class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :contents
      t.integer :user_id
      t.integer :discussion_id

      t.timestamps
    end
  end
end
