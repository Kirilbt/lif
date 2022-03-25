class Booking < ApplicationRecord
  belongs_to :space
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validate :start_date_after_today?, :end_date_after_start_date?

  private

  def start_date_after_today?
    if start_date < Date.today
      errors.add :start_date, "can't be before today"
    end
  end

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end

end
