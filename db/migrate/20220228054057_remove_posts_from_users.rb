class RemovePostsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference(:posts, :user, index: true, foreign_key: true)
  end
end
