class Space < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :category, :price_day, :available, :info_space, :title, :address, presence: true
  validates :price_day, numericality: { greater_than_or_equal_to: 0 }
  validates :info_space, length: { minimum: 10 }
  validates :category, inclusion: ['Small', 'Large']
end
