module Spree
  module AppConfigurationDecorator
    def self.prepended(base)
      base.preference :allowed_document_content_types, :array, :default => %w(application/pdf application/zip)
    end
  end
end

::Spree::AppConfiguration.prepend Spree::AppConfigurationDecorator if ::Spree::AppConfiguration.included_modules.exclude?(Spree::AppConfigurationDecorator)
