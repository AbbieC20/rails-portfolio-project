class OrganisersController < ApplicationController 

    def new
        @organiser = Organiser.new
    end
  
    def create 
        if organiser_params[:name].empty?
            redirect_to new_organiser_path
        else
            @organiser = Organiser.create(organiser_params)
            redirect_to new_event_url
        end
    end


    private

    def organiser_params
        params.require(:organiser).permit(:name)
    end

end
