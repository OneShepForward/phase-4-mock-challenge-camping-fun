class CampersController < ApplicationController

    def index
        camper = Camper.all
        render json: camper, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, status: :ok, serializer: CamperWithActivitiesSerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def render_record_not_found
        render json: {"error" => "Camper not found"}, status: :not_found
    end

    def camper_params
        params.permit(:name, :age)
    end
end
