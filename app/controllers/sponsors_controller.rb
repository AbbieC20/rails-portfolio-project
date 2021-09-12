class SponsorsController < ApplicationController 

    def new
        @sponsor = Sponsor.new
    end
  
    def create 
        if sponsor_params[:name].empty?
            redirect_to new_sponsor_path
        else
            @sponsor = Sponsor.create(sponsor_params)
            redirect_to new_event_url 
        end
    end


    private

    def sponsor_params
        params.require(:sponsor).permit(:name)
    end

end