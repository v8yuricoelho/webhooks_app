class EventsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        push = JSON.parse(request.body.read)

        issue = Issue.find_or_create_by(id: push.dig("issue", "number")) # Assimilating the issue number to the id.
        event = Event.new(issue_id: issue.id, action: push.dig("action"))

        if event.save
            render json: {data: event}, status: :ok
        else
            render json: {errors: event.errors.full_messages}, status: :unprocessable_entity
        end
    end
end
