module Spree
  module V2
    module Storefront
      class DepositSerializer < BaseSerializer
        set_type :deposit
        attributes :price, :display_price
        
      end
    end
  end
end