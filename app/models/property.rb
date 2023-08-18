class Property < ApplicationRecord
  validates :address, :property_type, :num_of_bedrooms, :num_of_sitting_rooms,
    :num_of_kitchens, :num_of_bathrooms, :num_of_toilets, :owner, :description,
    :valid_from, :valid_to, presence: true

  validates :num_of_bedrooms, :num_of_sitting_rooms,
    :num_of_kitchens, :num_of_bathrooms, :num_of_toilets,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :owner, :property_type, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" }
  validates :address, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters, numbers, and spaces" }

  validates :valid_from, :valid_to, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "should be in the format yyyy-mm-dd" }

  validate :valid_to_not_less_than_valid_from

  def valid_to_not_less_than_valid_from
    if valid_to.present? && valid_from.present? && valid_to < valid_from
      errors.add(:valid_to, "must be greater than or equal to Valid from")
    end
  end
end
