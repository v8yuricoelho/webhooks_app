class IssuesController < ApplicationController
    before_action :set_issue, only: [:show]

    def show
        render json: @issue, status: :ok
    end

    private
    def set_issue
        @issue = Issue.find(params[:id])
    end
end
