class AddGroupToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :group, null: false, foreign_key: true
  end
end
