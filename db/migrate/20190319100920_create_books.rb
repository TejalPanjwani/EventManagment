class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :guestdata
      t.string :daydata
      t.string :bugetdata
      t.string :calldata
      t.string :contact
      t.references :service, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
