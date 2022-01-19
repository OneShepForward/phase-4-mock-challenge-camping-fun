class ActivitiesController < ApplicationController

    def index
        activity = Activity.all
        render json: activity, status: :ok
    end

    def destroy
        act = Activity.find(params[:id])
        act.destroy
        render status: :no_content
    end

    private

    def render_record_not_found
        render json: {"error" => "Activity not found"}, status: :not_found
    end
end
