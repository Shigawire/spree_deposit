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
  text: '<td> <%= variant.deposit&.total %> </td>',
  name: 'insert-deposit-index.td',
)