class Artist < ApplicationRecord
  # AR association and foreign key migration
  has_many :works

  def self.sort
    order(created_at: :desc)
  end

  def work_count
    works.count
  end
end