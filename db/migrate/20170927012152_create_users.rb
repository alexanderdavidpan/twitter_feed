class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users, id: false) do |t|
      t.integer :id
      t.string :name
      t.string :screen_name

      t.timestamps
    end
  end
end
