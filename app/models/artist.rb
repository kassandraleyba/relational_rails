class Artist < ApplicationRecord
  # AR association and foreign key migration
  has_many :works
end