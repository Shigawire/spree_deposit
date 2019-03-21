class CreateSpreeDeposits < SpreeExtension::Migration[5.2]
  def change
    create_table :spree_deposits do |t|
      t.references :variant, index: true
    end
  end
end
