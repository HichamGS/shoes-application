require 'rails_helper'

RSpec.describe Shoe, type: :model do

  it { should have_many(:shoe_stores).dependent(:destroy) }
  it { should have_many(:stores).through(:shoe_stores) }

  it { should validate_presence_of(:name) }

end
