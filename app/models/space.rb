class Space < ApplicationRecord
  belongs_to :user

  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :category, :price_day, :available, :info_space, :title, :address, presence: true
  validates :price_day, numericality: { greater_than_or_equal_to: 0 }
  validates :info_space, length: { minimum: 80 }
  validates :category, inclusion: ['Small', 'Large']

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [:address, :title, :info_space],
    using: {
      tsearch: { prefix: true }
    }
end
