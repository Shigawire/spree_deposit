module Spree
  module V2
    module Storefront
      module VariantSerializerDecorator
        def self.prepended(base)
          base.attribute :deposit do |object|
            object.deposit
          end

          base.attribute :deposit_display_price do |object|
            Spree::Money.new object.deposit
          end
        end
      end
    end
  end
end

Spree::V2::Storefront::VariantSerializer.prepend Spree::V2::Storefront::VariantSerializerDecorator
