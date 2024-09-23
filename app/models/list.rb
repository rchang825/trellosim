class List < ApplicationRecord
  has_many :list_items
  has_many :note_items
end
