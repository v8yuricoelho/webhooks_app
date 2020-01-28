class EventsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        request.body.rewind
        payload_body = request.body.read
        verify_signature(payload_body)

        push = urlencoded_to_json(request.headers)
    
        event = Issue.find_or_create_by(number: push.dig("issue", "number")).events.new(action: push.dig("action"))

        if event.save
            render json: {data: event}, status: :ok
        else
            render json: {errors: event.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def index
        if params[:number]
            @events = Issue.find_by(number: params[:number]).events
        else
            @events = Event.all
        end

        render json: @events, status: :ok
    end

    private
        # Method that checks if the content type is JSON, if not, it will convert
        def urlencoded_to_json(payload)
            if payload['Content-Type'] == 'application/json'
                return JSON.parse(request.body.read)
            else
                params.as_json
            end
        end

        # Method that validates payloads with hash signature from GitHub
        def verify_signature(payload_body)
            signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['SECRET_TOKEN'], payload_body)
            return "Signatures didn't match!" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE'])
        end
end
