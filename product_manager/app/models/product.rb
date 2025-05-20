class Product < ApplicationRecord
  # Ensure that new records get a default value for available
  after_initialize :set_default_available, if: :new_record?

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :available, inclusion: { in: [true, false] }, allow_nil: true

  private

  def set_default_available
    self.available = true if self.available.nil?
  end
end
