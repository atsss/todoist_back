def perform(klass: described_class, args: {}, context: {})
  context = { session: {} }.merge(context)

  klass.new(object: nil, context: context).resolve(args)
end
