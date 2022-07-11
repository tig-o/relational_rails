class TrailsController < ApplicationController #view directories map to name of controller
    def index #view filenames map to name of actions/methods
        @trails = Trail.all
    end
    
    def show
        # binding.pry
        @trail = Trail.find(params[:id])
    end
end