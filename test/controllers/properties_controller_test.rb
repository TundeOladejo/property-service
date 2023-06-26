require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get properties_url, as: :json
    assert_response :success
  end

  test "should create property" do
    assert_difference("Property.count") do
      post properties_url, params: { property: { address: @property.address, description: @property.description, num_of_bathrooms: @property.num_of_bathrooms, num_of_bedrooms: @property.num_of_bedrooms, num_of_kitchens: @property.num_of_kitchens, num_of_sitting_rooms: @property.num_of_sitting_rooms, num_of_toilets: @property.num_of_toilets, owner: @property.owner, type: @property.type, valid_from: @property.valid_from, valid_to: @property.valid_to } }, as: :json
    end

    assert_response :created
  end

  test "should show property" do
    get property_url(@property), as: :json
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: { property: { address: @property.address, description: @property.description, num_of_bathrooms: @property.num_of_bathrooms, num_of_bedrooms: @property.num_of_bedrooms, num_of_kitchens: @property.num_of_kitchens, num_of_sitting_rooms: @property.num_of_sitting_rooms, num_of_toilets: @property.num_of_toilets, owner: @property.owner, type: @property.type, valid_from: @property.valid_from, valid_to: @property.valid_to } }, as: :json
    assert_response :success
  end

  test "should destroy property" do
    assert_difference("Property.count", -1) do
      delete property_url(@property), as: :json
    end

    assert_response :no_content
  end
end
