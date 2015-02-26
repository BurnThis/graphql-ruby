class GraphQL::Types::ObjectField < GraphQL::Field
  type "object"
  def as_result
    object = finished_value
    return nil unless object.present?
    node_class = GraphQL::SCHEMA.type_for_object(object)
    node = node_class.new(finished_value, query: query, fields: fields)
    node.as_result
  end
end