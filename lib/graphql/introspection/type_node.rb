class GraphQL::Introspection::TypeNode < GraphQL::Node
  exposes "GraphQL::Node"
  field.string(:name)
  field.string(:description)
  field.connection(:fields)

  cursor :name

  def fields
    target.all_fields.values
  end

  def name
    schema_name
  end
end