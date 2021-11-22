class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end

    #This line prevents individual users from having more than one membership to the same group
    add_index :memberships, [:user_id, :group_id], :unique => true
  end
end
