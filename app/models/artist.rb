class Artist < ApplicationRecord
  # AR association and foreign key migration
  has_many :works

  def self.sort
    order(created_at: :desc)
  end
end