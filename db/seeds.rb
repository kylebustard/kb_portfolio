@employee = Employee.create(email: "test@test.com",
    password: "asdfasdf",
    password_confirmation: "asdfasdf",
    first_name: "Jon",last_name: "Snow",
    phone: '9802673103',
    ssn: 1234,
    company: 'Acme Company')

puts "1 employee created"

AdminUser.create(email: "kabustard@yahoo.com",
    password: "asdfasdf",
    password_confirmation: "asdfasdf",
    first_name: "Admin",
    last_name: "Name",
    phone: '9802673103',
    ssn: 1234,
    company: 'Acme Company')

puts "1 Admin User created"

AuditLog.create!(user_id: @employee.id,
    status: 0,
    start_date: (Date.current - 6.days))
AuditLog.create!(user_id: @employee.id,
    status: 0,
    start_date: (Date.current - 13.days))
AuditLog.create!(user_id: @employee.id,
    status: 0,
    start_date: (Date.current - 20.days))

puts "3 Audit Logs have been created"

100.times do |post|
    Post.create!(date: Date.current,
        rationale: "#{post} Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem, ducimus, animi. Earum error placeat quos quia saepe ipsum necessitatibus, enim maiores porro soluta dolor aspernatur, omnis magni tempore dolorem alias.",
        user_id: @employee.id,
        daily_hours: 12.5)
end

puts "100 Posts have been created"
