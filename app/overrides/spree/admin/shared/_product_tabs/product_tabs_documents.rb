Deface::Override.new(
  virtual_path: 'spree/admin/shared/_product_tabs',
  name: 'product_tabs_documents',
  # original: '10edf2223cf4fe1ebcd351beb56472f5b623ea6b',
  insert_after: "erb[silent]:contains('if can?(:admin, Spree::Image)')",
  text: <<-HTML
      <% if can?(:admin, Spree::Document) && !@product.deleted? %>
      <li>
        <%= link_to_with_icon 'file', I18n.t('spree.admin.tab.documents'), admin_product_documents_path(@product), class: "\#\{'active' if current == :documents\} nav-link" %>
      </li>
      <% end %>
    HTML
)
