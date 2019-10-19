def perform(klass: described_class, args: {}, context: {})
  return klass.new(object: nil, context: context).resolve(args) if args.present?

  klass.new(object: nil, context: context).resolve
end
