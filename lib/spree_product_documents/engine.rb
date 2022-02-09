module SpreeProductDocuments
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_product_documents'

    initializer 'spree.spree_product_documents.preferences', after: 'spree.environment' do |_app|
      Spree::ProductDocumentsConfiguration = Spree::SpreeProductDocumentsConfiguration.new
    end
    
    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
