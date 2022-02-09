module Spree
  class Document < Asset
    ALLOWED_CONTENT_TYPES = Spree::ProductDocumentsConfiguration[:allowed_document_content_types]

     # active_storage
    has_one_attached :attachment
    validates :attachment, presence: true, file_content_type: { allow: ALLOWED_CONTENT_TYPES }

    
    # TODELETE: paperclip
    has_attached_file :old_attachment,
                      default_style: :product,
                      url: '/spree/products/:id/:basename.:extension',
                      path: ':rails_root/public/spree/products/:id/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
    validates_attachment :old_attachment, presence: true, content_type: { content_type:  ALLOWED_CONTENT_TYPES}
    validate :no_old_attachment_errors

    before_post_process :skip_thumbnail_creation

    # if there are errors from the plugin, then add a more meaningful message
    def no_old_attachment_errors
      unless old_attachment.errors.empty?
        # uncomment this to get rid of the less-than-useful interim messages
        # errors.clear
        errors.add :old_attachment, "Paperclip returned errors for file '#{old_attachment_file_name}' - check ImageMagick installation or image source file."
        false
      end
    end

    private
    def skip_thumbnail_creation
      return false if ALLOWED_CONTENT_TYPES.include?(old_attachment_content_type)
    end
  end
end
