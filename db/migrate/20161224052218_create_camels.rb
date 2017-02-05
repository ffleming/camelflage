class CreateCamels < ActiveRecord::Migration[5.0]
  def change
    create_table :camels do |t|
      t.string :name, null: false
      t.string :breed, null: false
      t.string :notes

      t.timestamps
    end
  end
end
