require 'rails_helper'

RSpec.describe Artist, type: :model do
  it {should have_many :works}
end