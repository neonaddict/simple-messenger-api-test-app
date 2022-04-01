require 'faker'

# Users
datetime = DateTime.now # get some fixed time
users = (1..100).map do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  data = {
    email: "definitely#{i + 1}@uniq.com",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nickname: [first_name, last_name].join.downcase,
    avatar_url: Faker::Avatar.image
  }
  User.find_or_create_by(data)
end

chats = (1..10).map do
  data = {
    title: Faker::Company.name
  }
  Chat.find_or_create_by(data)
end

chats.map do |chat|
  chat.users << users.sample(10)
  chat.messages << (1..40).map do
    data = {
      content: Faker::Quote.famous_last_words,
      user: chat.users.sample,
      created_at: datetime - rand(50).minutes,
      read_by: chat.users.sample(5)&.pluck(:id)
    }
    Chat::Message.find_or_create_by(data)
  end
end

# chat1.users << users
# chat2.users << users[1..2]
# chat3.users << users[0..1]

# chat1.messages << [
#   { content: 'I like reading books at night!', user: users.first, created_at: datetime - 2.hours },
#   { content: 'Oh, me too!',  user: users.last, created_at: datetime - 1.hour },
#   { content: 'Yeah books books', user: users.second, created_at: datetime - 30.minutes }
# ].map do |data|
#   Chat::Message.find_or_create_by(data)
# end

# chat2.messages << [
#   { content: 'Guitar is better than bass', user: users.first, created_at: datetime - 1.hour },
#   { content: 'I agree', user: users.second, created_at: datetime - 30.minutes }
# ].map do |data|
#   Chat::Message.find_or_create_by(data)
# end

# chat3.messages << [
#   { content: 'Ruby 3 is out!', user: users.first, created_at: datetime - 3.hours },
#   { content: 'Oh my', user: users.last, created_at: datetime - 1.hour }
# ].map do |data|
#   Chat::Message.find_or_create_by(data)
# end
