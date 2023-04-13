class Shoe < ApplicationRecord
    has_many :shoe_stores, dependent: :destroy
    has_many :stores, through: :shoe_stores
    validates_presence_of :name, presence: true, uniqueness: { case_sensitive: false}
end
