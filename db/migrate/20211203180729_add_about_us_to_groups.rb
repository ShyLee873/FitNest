class AddAboutUsToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :about_us, :string
  end
end
