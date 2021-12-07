class AddGymRequiredToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :gym_required, :boolean
  end
end
