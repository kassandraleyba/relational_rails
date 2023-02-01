class Work < ApplicationRecord
  # inheriting from application record makes this a model
  belongs_to :artist
end