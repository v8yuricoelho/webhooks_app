class IssuesController < ApplicationController
    before_action :set_issue, only: [:show]

    def show
        render json: @issue
    end

    private
    def set_issue
        @issue = Issue.find(params[:number])
    end
end
