module Spree
  module V2
    module Storefront
      module CartSerializerDecorator
        def self.prepended(base)
          base.attribute :deposit_total do |object|
            object.deposit_total
          end

          base.attribute :display_deposit_total do |object|
            Spree::Money.new object.deposit_total
          end
        end
      end
    end
  end
end

Spree::V2::Storefront::CartSerializer.prepend Spree::V2::Storefront::CartSerializerDecorator
