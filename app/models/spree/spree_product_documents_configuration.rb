module Spree
  class SpreeProductDocumentsConfiguration < Preferences::Configuration
    # array of allowed content_types
    preference :allowed_document_content_types,  :array, default: %w( application/pdf application/zip )
  end
end
