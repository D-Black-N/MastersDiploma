# Удаление всех записей
Document.delete_all
Vehicle.delete_all
Request.delete_all
Client.delete_all
User.delete_all

# Создание пользователей
User.create!([
  { role: 'admin', login: 'admin@test.ru', password: 'password', first_name: 'Администратор', last_name: 'Первый' }, # Админ
  { role: 'manager', login: 'manager@test.ru', password: 'password', first_name: 'Менеджер', last_name: 'Первый' }, # Менеджер
  { role: 'risk_manager', login: 'risk_manager@test.ru', password: 'password', first_name: 'Риск Менеджер', last_name: 'Первый' }, # Риск Менеджер
])

# Создание клиентов
Client.create!([
  { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, passport_series: '1111', passport_number: '111111', email: 'client_1@test.ru', phone_number: '+7 (999) 222 11 55', user_id: User.first.id },
  { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, passport_series: '2222', passport_number: '222222', email: 'client_2@test.ru', phone_number: '+7 (922) 666 00 11', user_id: User.first.id },
  { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, passport_series: '3333', passport_number: '333333', email: 'client_3@test.ru', phone_number: '+7 (917) 888 87 78', user_id: User.first.id },
  { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, passport_series: '4444', passport_number: '444444', email: 'client_4@test.ru', phone_number: '+7 (950) 111 65 65', user_id: User.first.id },
  { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, passport_series: '5555', passport_number: '555555', email: 'client_5@test.ru', phone_number: '+7 (901) 333 34 01', user_id: User.first.id }
])

# Создание ТС
Vehicle.create!([
  [Faker::Vehicle.make_and_model.split(' ')].map { |brand, model| { brand: brand, vehicle_model: model } }.first.merge({ year: 2025, status: 'ready', vin: 'XXXXXX' }),
  [Faker::Vehicle.make_and_model.split(' ')].map { |brand, model| { brand: brand, vehicle_model: model } }.first.merge({ year: 2024, status: 'ready', vin: 'XXXXXX' }),
  [Faker::Vehicle.make_and_model.split(' ')].map { |brand, model| { brand: brand, vehicle_model: model } }.first.merge({ year: 2025, status: 'ready', vin: 'XXXXXX' }),
  [Faker::Vehicle.make_and_model.split(' ')].map { |brand, model| { brand: brand, vehicle_model: model } }.first.merge({ year: 2024, status: 'ready', vin: 'XXXXXX' }),
  [Faker::Vehicle.make_and_model.split(' ')].map { |brand, model| { brand: brand, vehicle_model: model } }.first.merge({ year: 2025, status: 'ready', vin: 'XXXXXX' }),
  [Faker::Vehicle.make_and_model.split(' ')].map { |brand, model| { brand: brand, vehicle_model: model } }.first.merge({ year: 2024, status: 'ready', vin: 'XXXXXX' })
])

# Создание заявок
Vehicle.find_each do |vehicle|
  vehicle.create_request(
    leasing_term: 12, payment_type: 'bank_card', status: 'open', conditions: 'какие-то', verification_result: {}, user_id: User.second.id, client_id: Client.first.id, risk_level: 'green'
  )
end
