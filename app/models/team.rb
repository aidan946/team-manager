class Team < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  validates :name, presence: true
  validates :owner_id, presence: true
end
