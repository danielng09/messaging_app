# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create({email: 'homeowner1@gmail.com', password: "password", homeowner: true})
u2 = User.create({email: 'homeowner2@gmail.com', password: "password", homeowner: true})
u3 = User.create({email: 'homeowner3@gmail.com', password: "password", homeowner: true})
u4= User.create({email: 'contractor1@gmail.com', password: "password", homeowner: false})
u5 = User.create({email: 'contractor2@gmail.com', password: "password", homeowner: false})

c1 = Conversation.create()
c2 = Conversation.create()

cp1 = ConversationParticipant.create({user_id: 1, conversation_id: 1})
cp2 = ConversationParticipant.create({user_id: 4, conversation_id: 1})
cp3 = ConversationParticipant.create({user_id: 1, conversation_id: 2})
cp3 = ConversationParticipant.create({user_id: 5, conversation_id: 2})


Message.create({conversation_id: 1, from_id: 1, to_id: 4, subject: "intro", body: "hello", active: true, read: false})
Message.create({conversation_id: 1, from_id: 4, to_id: 1, subject: "RE:intro", body: "hello", active: true, read: false})
Message.create({conversation_id: 1, from_id: 1, to_id: 4, subject: "RE:RE:intro", body: "hello", active: true, read: false})
Message.create({conversation_id: 2, from_id: 1, to_id: 5, subject: "intro", body: "hello", active: true, read: false})
