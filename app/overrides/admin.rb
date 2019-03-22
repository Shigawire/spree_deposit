Deface::Override.new(
  virtual_path: 'spree/admin/variants/_form',
  insert_after: '[data-hook=\'discontinue_on\']',
  name: 'insert-deposit',
  partial: 'spree/admin/variants/variants_deposit',
)

Deface::Override.new(
  virtual_path: 'spree/admin/variants/index',
  insert_before: '[class=\'actions\']',
  text: '<th><%= Spree.t(:deposit) %></th>',
  name: 'insert-deposit-index.th',
)

Deface::Override.new(
  virtual_path: 'spree/admin/variants/index',
  insert_before: '[class=\'actions actions-2 text-right\']',
  text: '<td> <%= Spree::Money.new(variant.deposit&.total) %> </td>',
  name: 'insert-deposit-index.td',
)

Deface::Override.new(
  virtual_path: 'spree/admin/orders/_line_items',
  insert_bottom: '[class=\'line-item-price text-center\']',
  text: '<div> <%= Spree::Money.new(item.variant&.deposit&.total) if item.variant&.deposit&.total&.positive? %>  </div>',
  name: 'insert-line-item-deposit-price'
)

Deface::Override.new(
  virtual_path: 'spree/admin/shared/_order_summary',
  insert_after: 'tr:has(td[data-hook=\'admin_order_tab_included_tax_title\'])',
  partial: 'spree/admin/shared/order_summary_deposit',
  name: 'insert-order-summary-deposit-total'
)
