class EventsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        push = JSON.parse(request.body.read)
        puts 'I got some JSON #{push.inspect}'
    end
end
