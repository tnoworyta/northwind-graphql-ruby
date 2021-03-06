class Functions::Update < GraphQL::Function
  def initialize(model)
    @model = model
    @param_key = model.model_name.param_key
  end

  def call(obj, args, ctx)
    attributes = args[@param_key].to_h
    id = attributes.delete(@model.primary_key)
    @model.update(id, Services::NestedAttributes.call(@model, attributes))
  end
end
