class ParksController < ApplicationController
    def index #after this, we need a view(file with same name as action). Not an empty whitescreen
        @parks = Park.all.order_by_timestamp_created
    end

    def show
        # binding.pry
        @park = Park.find(params[:id])
    end
end