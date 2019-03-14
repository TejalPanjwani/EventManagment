class SetDefaultStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :requestforsevices, :status, :integer, default: 0
  end
end
