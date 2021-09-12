class StaticPagesController < ApplicationController 

    def home
        if logged_in 
            @previous_events = current_user.events.where('date < ?', Date.today).sort_by { |e| e.date }
            @upcoming_events = current_user.events.where('date >= ?', Date.today).sort_by { |e| e.date }
        end
    end

end