class Api::V1::PropertiesController < ApplicationController
  require 'rest-client'

  # GET /properties or /properties.json
  def index
    # properties = Property.all
    # render json: properties, status: 200
    properties = Property.all

    # if property_params.present?
    #   properties = properties.where(property_params)
    # end

    render json: properties
  end

  # GET /properties/1 or /properties/1.json
  def show
    property = Property.where(id: params[:id])

    if property
      render json: property, status: 200
    else
      render json: { error: "Property not found" }
    end
  end

  # GET multiple owner properties /properties/owner/:owner
  def owner
    properties = Property.where(owner: params[:owner])
    render json: properties
  end

  # GET /api/v1/properties/address/:address
  def property_address
    property = Property.where(address: params[:address])

    if property
      render json: property
    else
      render json: { error: 'Property not found' }, status: :not_found
    end
  end

  # POST /properties or /properties.json
  def create
    property = Property.new(property_params)

    api_key = '65cff62cf6164d9ca7dfccd17caa34f4'
    query = property_params['address']
    api_url = 'https://api.opencagedata.com/geocode/v1/json'

    url = api_url + '?' + 'key=' + api_key + '&q=' + query + '&pretty=1' + '&no_annotations=1'

    response = RestClient.get(url)
    data = JSON.parse(response.body)
    results = data['results']

    if results.empty?
      render json: {status: "failed", message: "The address is invalid"}, status: :not_found
    else
      if property.save
        render json: property, status: 200
      else
        render json: { errors: "Property not saved" }, status:403
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    property = Property.find_by(id: params[:id])

    if property
      property.update(
        description: params[:description],
        num_of_bedrooms: params[:num_of_bedrooms],
        num_of_sitting_rooms: params[:num_of_sitting_rooms],
        num_of_kitchens: params[:num_of_kitchens],
        num_of_bathrooms: params[:num_of_bathrooms],
        num_of_toilets: params[:num_of_toilets],
        valid_to: params[:valid_to],
      )
      render json: property, status: 200
    else
      render json: { error: 'Property not found' }
    end
  end

  def destroy
  end

  private
    def property_params
      params.require(:property).permit([
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
      ])
    end
end
