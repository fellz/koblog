# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Category.create!([{name: 'спорт'},{name:'политика'}, {name: 'экономика'}] )

User.create!(name: 'Roman', email: 'goracioo@ya.ru', password: 'rfrjqnj')

Article.create!(title: 'Петербургский завод Toyota выпускает новую модель',
 description: 'Инвестиции в проект увеличения производственной мощности и подготовки к запуску Toyota RAV4 на петербургском заводе составили 7,1 млрд рублей.',
 body: '<p>В мае 2016 года предприятие намерено более чем в два раза увеличить скорость конвейера и перейти на работу в одну смену, максимально задействовав модернизированные линии, отмечается в сообщении компании. Под эти цели было дополнительно создано порядка 800 новых рабочих мест. <br></p>',
 approved: true,
 user_id: 1)