class MoveDepositFromVariantToProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :spree_variants, :deposit, :decimal, precision: 10, scale: 2, default: 0.0
    add_column :spree_products, :deposit, :decimal, precision: 10, scale: 2, default: 0.0
  end
end
