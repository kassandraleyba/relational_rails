class Work < ApplicationRecord
  belongs_to :artist
  scope :purchase_true, -> { where(available_for_purchase: :true) }
  scope :sort_alphabetically, -> { order(title: :asc) }
  # scope :purchase_price, -> { where("price > #{num}") }
    # this is a class method

  def self.purchase_price(num)
    where("price > #{num}")
  end
end