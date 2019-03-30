def add(params)
  record = @seed_klass.create!(params)

  yield(record) if block_given?
end

def set(klass)
  @seed_klass = klass

  yield
end

set User do
  (1..3).each do |i|
    id = format('%02d', i)
    add name: "user#{id}", email: "user#{id}@example.com", password: 'passpass', password_confirmation: 'passpass'
  end
end

set Task do
  (1..3).each do |i|
    id = format('%02d', i)
    add user: User.first, name: "task#{id}", due_date: Time.zone.now + i.hours
  end
end
