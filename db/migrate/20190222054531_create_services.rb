class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :nameofsevice
      t.string :address
      t.string :contact
      t.string :description
      t.references :title
      t.references :city

      t.timestamps
    end
  end
end
