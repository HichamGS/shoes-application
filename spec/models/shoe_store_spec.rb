require 'rails_helper'

RSpec.describe ShoeStore, type: :model do
  it { should belong_to(:shoe) }
  it { should belong_to(:store) }

end
