class Property < ApplicationRecord
  def validate_address
    require 'opencage/geocoder'

    return unless address_changed?

    geocoder = OpenCage::Geocoder.new(api_key: '65cff62cf6164d9ca7dfccd17caa34f4')
    results = geocoder.geocode(address)

    p results.first.address

    if results.empty?
      errors.add(:address, 'is invalid')
    else
      self.latitude = results.first.latitude
      self.longitude = results.first.longitude
    end
  end
end
