class CreateSpreeDepositPositions < SpreeExtension::Migration[5.2]
  def change
    create_table :spree_deposit_positions do |t|
      t.references :deposit, index: true
      t.string :name
      t.integer :amount
      t.decimal :price, precision: 10, scale: 2
    end
  end
end
