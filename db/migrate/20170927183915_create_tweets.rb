class CreateTweets < ActiveRecord::Migration
  def change
    create_table(:tweets, id: false) do |t|
      t.integer :id
      t.text :text
      t.datetime :tweeted_at
      t.integer :user_id

      t.timestamps
    end
  end
end
