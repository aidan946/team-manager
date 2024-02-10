class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :description
      t.string :status
      t.integer :owner_id, null: false

      t.timestamps
    end

    add_index :teams, :name
    add_index :teams, :owner_id
    add_foreign_key :teams, :users, column: :owner_id
  end
end
