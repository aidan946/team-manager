# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.integer :team_id, null: false
      t.integer :user_id, null: false
      t.string :role

      t.timestamps
    end

    add_foreign_key :members, :users, column: :user_id
    add_foreign_key :members, :teams, column: :team_id

    add_index :members, :team_id
    add_index :members, :user_id

    add_column :teams, :members_count, :integer, default: 0
  end
end
