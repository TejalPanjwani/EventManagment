class SetDefualtToNotice < ActiveRecord::Migration[5.2]
  def change
    add_column :notices, :status, :integer, default: 0
  end
end
