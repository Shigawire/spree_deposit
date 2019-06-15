Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  insert_after: '[data-hook=\'admin_product_form_price\']',
  name: 'insert-deposit',
  partial: 'spree/admin/products/deposit'
)

Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  insert_after: '[data-hook=\'admin_product_form_cost_currency\']',
  name: 'insert-volume-liter-liter',
  partial: 'spree/admin/products/volume_liter'
)

Deface::Override.new(
  virtual_path: 'spree/admin/orders/_line_items',
  insert_bottom: '[class=\'line-item-price text-center\']',
  text: '<div> <%= "#{Spree::Money.new(item.product&.deposit)} (#{Spree.t(:deposit)})" if item.product&.deposit&.positive? %> </div>',
  name: 'insert-line-item-deposit-price'
)

Deface::Override.new(
  virtual_path: 'spree/admin/shared/_order_summary',
  insert_before: 'tr:has(td[data-hook=\'admin_order_tab_included_tax_title\'])',
  partial: 'spree/admin/shared/order_summary_deposit',
  name: 'insert-order-summary-deposit-total'
)
