require 'rails_helper'

RSpec.describe Work, type: :model do
  it {should belong_to :artist}

  def works_count
    require 'pry'; binding.pry
  end
end