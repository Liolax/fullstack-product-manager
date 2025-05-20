class Product < ApplicationRecord
  attribute :available, :boolean, default: true

  before_validation :set_default_available

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :available, inclusion: { in: [true, false], strict: true }

  private

  def set_default_available
    self.available = true if available.nil?
  end
end
