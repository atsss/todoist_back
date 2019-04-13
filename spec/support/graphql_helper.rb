def perform(klass:, args: {})
  klass.new(object: nil, context: {}).resolve(args)
end
