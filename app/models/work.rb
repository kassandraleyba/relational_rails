class Work < ApplicationRecord
  # inheriting from application record makes this a model
  belongs_to :artist
  scope :purchase_true, -> { where(available_for_purchase: :true) }
  scope :sort_alphabetically, -> { order(title: :asc) }
    # this is a class method
end