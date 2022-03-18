module Spree
  class Document < Asset
    ALLOWED_CONTENT_TYPES = Spree::ProductDocumentsConfiguration[:allowed_document_content_types]

     # active_storage
    has_one_attached :attachment
    validates :attachment, presence: true, file_content_type: { allow: ALLOWED_CONTENT_TYPES }

  end
end
