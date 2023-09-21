class Group < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :expenses, dependent: :destroy

  has_one_attached :icon
end
