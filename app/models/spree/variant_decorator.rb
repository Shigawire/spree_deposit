Spree::Variant.class_eval do
  def price_per_liter
    return nil unless product.volume_liter.present?

    Float(price / product.volume_liter)
  end
end
