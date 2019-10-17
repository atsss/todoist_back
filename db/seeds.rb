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
    add name: "user#{id}"
  end
end

set Account do
  (1..3).each do |i|
    id = format('%02d', i)
    add user_id: i, email: "test#{id}@example.com", password: 'passpass'
  end
end

set Task do
  (1..9).each do |i|
    id = format('%02d', i)
    user = i.even? ? User.first : User.second

    add user: user, name: "task#{id}", due_date: Time.zone.now + i.hours
  end
end
