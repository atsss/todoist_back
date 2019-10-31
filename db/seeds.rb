def add(params)
  record = @seed_klass.create!(params)

  yield(record) if block_given?
end

def set(klass)
  @seed_klass = klass

  yield
end

set Account do
  (1..3).each do |i|
    id = format('%02d', i)
    add email: "test#{id}@example.com", password: 'passpass'
  end
end

set User do
  (1..3).each do |i|
    id = format('%02d', i)
    add account_id: i, name: "user#{id}"
  end
end

set Tag do
  %w(Coding English).each { |name| add name: name }
end

SAMPLE_TASKS = [
  {
    name: 'Speeking',
    tag_name: 'English',
    duration: 60,
    schedules: [
      { kind: :everyday, hour: 8, minute: 0 }
    ]
  },
  {
    name: 'Hearing',
    tag_name: 'English',
    duration: 30,
    schedules: [
      { kind: :everyday, hour: 23, minute: 30 }
    ]
  },
  {
    name: '1st Coding',
    tag_name: 'Coding',
    duration: 90,
    schedules: [
      { kind: :weekday, hour: 10, minute: 30 }
    ]
  },
  {
    name: '2nd Coding',
    tag_name: 'Coding',
    duration: 90,
    schedules: [
      { kind: :weekday, hour: 14, minute: 0 }
    ]
  },
  {
    name: '3rd Coding',
    tag_name: 'Coding',
    duration: 90,
    schedules: [
      { kind: :weekday, hour: 16, minute: 0 }
    ]
  },
  {
    name: '4th Coding',
    tag_name: 'Coding',
    duration: 90,
    schedules: [
      { kind: :weekday, hour: 18, minute: 0 }
    ]
  },
  {
    name: 'Learning',
    tag_name: 'Coding',
    duration: 60,
    schedules: [
      { kind: :weekday, hour: 20, minute: 0 },
      { kind: :weekend, hour: 9, minute: 0 },
    ]
  }
]

set Task do
  SAMPLE_TASKS.each do |st|
    user = User.first
    tag = Tag.find_by(name: st[:tag_name])

    add(user: user, name: st[:name], duration: st[:duration]) do |task|
      task.tags << tag

      st[:schedules].each { |schedule| task.schedules.create!(kind: schedule[:kind], hour: schedule[:hour], minute: schedule[:minute]) }
    end
  end

  # make sure that these tasks don't exist on User.fisrt page
  (1..9).each do |i|
    id = format('%02d', i)
    user = i.even? ? User.last : User.second

    add(user: user, name: "task#{id}",duration: i * 10) do |task|
      task.tags << Tag.first

      task.schedules.create!(kind: Schedule.kind.values[i], hour: 1 * i, minute: 0)
    end
  end
end

set Result do
  one = User.last.tasks.first
  two = User.last.tasks.second

  add task: one, score: 8, done_at: Time.current
  add task: two, score: 8, done_at: Time.current - 1.day
end
