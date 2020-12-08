class AddReferencesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :feed, null: false, foreign_key: true
  end
end
