class TrailsController < ApplicationController #view directories map to name of controller
    def index #view filenames map to name of actions/methods
        @trails = Trail.all
    end
end