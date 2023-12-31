require 'swagger_helper'

RSpec.describe 'api/v1/properties', type: :request do

  path '/api/v1/properties' do

    post('Add/create a new property') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :property, in: :body, schema: {
          type: :object,
          properties: {
            address: { type: :string },
            property_type: { type: :string },
            num_of_bedrooms: { type: :integer },
            num_of_sitting_rooms: { type: :integer },
            num_of_kitchens: { type: :integer },
            num_of_bathrooms: { type: :integer },
            num_of_toilets: { type: :integer },
            owner: { type: :string },
            description: { type: :string },
            valid_from: { type: :string },
            valid_to: { type: :string }
          },
          required: %w[
            address property_type num_of_bedrooms num_of_sitting_rooms num_of_kitchens
            num_of_bathrooms num_of_toilets owner description valid_from valid_to
          ]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/properties/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'Property ID'

    get('Retrieve a single property using property id') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/properties/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'Property ID'

    patch('Update a property partially') do
      response(200, 'successful') do
        let(:id) { '123' }

        consumes 'application/json'
        parameter name: :property, in: :body, schema: {
          type: :object,
          properties: {
            description: { type: :string },
            num_of_bedrooms: { type: :integer },
            num_of_sitting_rooms: { type: :integer },
            num_of_kitchens: { type: :integer },
            num_of_bathrooms: { type: :integer },
            num_of_toilets: { type: :integer },
            valid_to: { type: :string }
          },
          required: %w[
            description num_of_bedrooms num_of_sitting_rooms num_of_kitchens
            num_of_bathrooms num_of_toilets valid_to
          ]
        }

        before do
          # Send the PATCH request to update the property
          patch "/api/v1/properties/#{id}", params: property.to_json, headers: { 'Content-Type' => 'application/json' }
        end

        it 'updates the property' do
          expect(response).to have_http_status(200)
          expect(Property.find(id)).to have_attributes(property)
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    put('Update a property completely') do
      response(200, 'successful') do
        let(:id) { '123' }

        consumes 'application/json'
        parameter name: :property, in: :body, schema: {
          type: :object,
          properties: {
            description: { type: :string },
            num_of_bedrooms: { type: :integer },
            num_of_sitting_rooms: { type: :integer },
            num_of_kitchens: { type: :integer },
            num_of_bathrooms: { type: :integer },
            num_of_toilets: { type: :integer },
            valid_to: { type: :string }
          },
          required: %w[
            description num_of_bedrooms num_of_sitting_rooms num_of_kitchens
            num_of_bathrooms num_of_toilets valid_to
          ]
        }

        before do
          # Send the PATCH request to update the property
          put "/api/v1/properties/#{id}", params: property.to_json, headers: { 'Content-Type' => 'application/json' }
        end

        it 'updates the property' do
          expect(response).to have_http_status(200)
          expect(Property.find(id)).to have_attributes(property)
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end

  path '/api/v1/properties/owner/{owner}' do
    parameter name: 'owner', in: :path, type: :string, description: 'owner'

    get('Retrieve multiple properties for a given owner') do
      response(200, 'successful') do
        let(:owner) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/properties/property_address/{property_address}' do
    parameter name: 'property_address', in: :path, type: :string, description: 'property_address'

    get('Find a property by address') do
      response(200, 'successful') do
        let(:property_address) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/properties/filter/{property}' do
    parameter name: :owner, in: :query, type: :string, description: "Owner of the property"
    parameter name: :property_type, in: :query, type: :string, description: "Type of the property"
    parameter name: :num_of_bedrooms, in: :query, type: :integer, description: "Number of bedrooms"
    parameter name: :num_of_sitting_rooms, in: :query, type: :integer, description: "Number of sitting rooms"
    parameter name: :num_of_kitchens, in: :query, type: :integer, description: "Number of kitchens"
    parameter name: :num_of_bathrooms, in: :query, type: :integer, description: "Number of bathrooms"
    parameter name: :num_of_toilets, in: :query, type: :integer, description: "Number of toilets"
    parameter name: :valid_to, in: :query, type: :string, format: :date, description: "Validity date of the property"


    get('Retrieve multiple properties using additional filters') do
      response(200, 'successful') do
        let(:property) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
