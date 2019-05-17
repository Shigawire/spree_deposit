module Spree
  module V2
    module Storefront
      module ProductSerializerDecorator
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

Spree::V2::Storefront::ProductSerializer.prepend Spree::V2::Storefront::ProductSerializerDecorator
