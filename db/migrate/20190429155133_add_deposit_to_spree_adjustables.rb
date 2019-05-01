class AddDepositToSpreeAdjustables < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_orders, :deposit_total, :decimal, precision: 10, scale: 2, default: 0.0
  end
end
