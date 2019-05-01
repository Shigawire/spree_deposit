class DropSpreeDeposit < ActiveRecord::Migration[5.2]
  def change
    drop_table :spree_deposits
  end
end
