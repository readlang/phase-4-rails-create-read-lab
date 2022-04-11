class PlantsController < ApplicationController

    def index
        plants = Plant.all
        array = []
        plants.each do |x|
            hash = {}
            hash[:id] = x[:id]
            hash[:name] = x[:name]
            hash [:image] = x[:image]
            hash[:price] = x[:price].to_s
            # hash.created_at = x.created_at
            # hash.updated_at = x.updated_at
            array << hash
        end


        render json: array
    end

    def show
        plant = Plant.find_by(id: params[:id])
        plant[:price] = "#{plant[:price]}" 
        render json: plant
    end

    def create
        new_plant = Plant.create(params.permit(:name, :image, :price) )
        render json: new_plant, status: :created

    end


end
