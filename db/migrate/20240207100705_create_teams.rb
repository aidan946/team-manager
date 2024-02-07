class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
