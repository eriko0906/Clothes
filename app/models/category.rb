class Category < ApplicationRecord
    has_many :cloths, dependent: :destroy
end
