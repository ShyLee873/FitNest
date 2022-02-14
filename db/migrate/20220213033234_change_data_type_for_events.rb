class ChangeDataTypeForEvents < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :latitude, :decimal
    change_column :events, :longitude, :decimal
  end
end
