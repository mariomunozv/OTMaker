<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
	include Filterable
	include Importable
	include Exportable

	self.per_page = 10

	<% attributes.select(&:reference?).each do |attribute| -%>
  		belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %>
	<% end -%>
	<% if attributes.any?(&:password_digest?) -%>
  		has_secure_password
	<% end -%>

	# Validations
	<% attributes.each do |attribute| -%>
		# validates :<%= attribute.name %>, <validations>
	<% end -%>

	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
	<% attributes.each do |attribute| -%>
		<%- if attribute.reference? -%>
	scope :<%= attribute.name %>, -> (<%= attribute.name %>_name) { where("<%= attribute.name %>.name like ?", "%#{<%= attribute.name %>_name}%") }
		<%- else -%>
			<%- if attribute.name == 'name' -%>
	scope :byname, -> (name) { where("name like ?", "%#{name}%") }
			<%- else -%>
	scope :<%= attribute.name %>, -> (<%= attribute.name %>) { where <%= attribute.name %>: <%= attribute.name %> }
			<%- end -%>
		<%- end -%>
	<% end -%>

end
<% end -%>
