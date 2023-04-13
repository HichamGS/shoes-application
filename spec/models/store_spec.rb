require 'rails_helper'

RSpec.describe Store, type: :model do

  it { should have_many(:shoe_stores).dependent(:destroy) }
  it { should have_many(:shoes).through(:shoe_stores) }

  it { should validate_presence_of(:name) }

end
