module Spree
  module V2
    module Storefront
      module VariantSerializerDecorator
        def self.prepended(base)
          base.attribute :price_per_liter

          base.attribute :display_price_per_liter do |object|
            Spree::Money.new object.price_per_liter
          end
        end
      end
    end
  end
end

Spree::V2::Storefront::VariantSerializer.prepend Spree::V2::Storefront::VariantSerializerDecorator
