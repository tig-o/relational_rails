class ParksController < ApplicationController
    def index #after this, we need a view(file with same name as action). Not an empty whitescreen
        @parks = Park.all
    end
end