class AddLoginFieldsToCamels < ActiveRecord::Migration[5.0]
  def change
    add_column :camels, :email, :string, unique: true
    add_column :camels, :password, :string
    add_column :camels, :is_admin, :boolean, default: false
  end
end
