Deface::Override.new(
  virtual_path: 'spree/admin/variants/_form',
  insert_after: '[data-hook=\'discontinue_on\']',
  # text: 'YOLO',
  name: 'insert-deposit',
  partial: 'spree/admin/variants/variants_deposit',
  # name: "insert-cart"
)