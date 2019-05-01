class DropSpreeDepositPosition < ActiveRecord::Migration[5.2]
  def change
    drop_table :spree_deposit_positions
  end
end
