class Post < ApplicationRecord
  has_rich_text :content

  belongs_to :user
  belongs_to :team
  has_many :comments, dependent: :destroy
end
