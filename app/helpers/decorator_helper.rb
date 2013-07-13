module DecoratorHelper
  def decorate(object)
    klass = "#{object.class}Decorator".constantize
    decorator = klass.new(object)
    yield decorator if block_given?
    decorator
  end
end
