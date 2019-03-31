class AddStatustypeToNotice < ActiveRecord::Migration[5.2]
  def change
    add_column :notices , :statustype , :integer , default: 0
  end
end
