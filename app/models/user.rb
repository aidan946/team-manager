class User < ApplicationRecord
  has_many :owned_teams, class_name: 'Team', foreign_key: 'owner_id'
  has_many :members, dependent: :destroy
  has_many :teams, through: :members
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
