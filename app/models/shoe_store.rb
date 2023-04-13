class ShoeStore < ApplicationRecord
  belongs_to :store
  belongs_to :shoe
end
