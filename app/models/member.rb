# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :user
  belongs_to :team

  after_create :increment_members_count
  after_destroy :decrement_members_count

  def increment_members_count
    team.increment!(:members_count)
  end

  def decrement_members_count
    team.decrement!(:members_count)
  end
end
