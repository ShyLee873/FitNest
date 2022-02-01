class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.datetime :date
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
