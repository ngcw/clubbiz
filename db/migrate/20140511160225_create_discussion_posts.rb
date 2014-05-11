class CreateDiscussionPosts < ActiveRecord::Migration
  def change
    create_table :discussion_posts do |t|
      t.text :contents
      t.integer :user

      t.timestamps
    end
  end
end
