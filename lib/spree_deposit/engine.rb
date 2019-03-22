module SpreeDeposit
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_deposit'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'spree_deposit.register.deposit_adjuster', after: 'spree.register.adjustable_adjusters' do |app|
      app.config.spree.adjusters << Spree::Adjustable::Adjuster::Deposit
    end

    # config.to_prepare do
    #   Rails.application.config.spree.adjusters = [Spree::Adjustable::Adjuster::Deposit]
    # end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
