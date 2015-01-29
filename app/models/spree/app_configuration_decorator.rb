Spree::AppConfiguration.class_eval do
  preference :allowed_document_content_types, :array, :default => %w(application/pdf application/zip)
end