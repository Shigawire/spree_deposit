Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  insert_after: '[data-hook=\'admin_product_form_price\']',
  name: 'insert-deposit',
  partial: 'spree/admin/products/products_deposit'
)

# Deface::Override.new(
#   virtual_path: 'spree/admin/variants/index',
#   insert_before: '[class=\'actions\']',
#   text: '<th><%= Spree.t(:deposit) %></th>',
#   name: 'insert-deposit-index.th',
# )

# Deface::Override.new(
#   virtual_path: 'spree/admin/variants/index',
#   insert_before: '[class=\'actions actions-2 text-right\']',
#   text: '<td> <%= Spree::Money.new(variant.deposit, unit: \'\') %> </td>',
#   name: 'insert-deposit-index.td',
# )

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
