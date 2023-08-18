class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show update destroy ]

  # POST /properties
  def create
    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(
        :address,
        :property_type,
        :num_of_bedrooms,
        :num_of_sitting_rooms,
        :num_of_kitchens,
        :num_of_bathrooms,
        :num_of_toilets,
        :owner,
        :description,
        :valid_from,
        :valid_to
      )
    end
end
