# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Cat.destroy_all
CatRentalRequest.destroy_all

1.upto(5) do |i|
    u = User.create!(username: "user#{i}", 
    password: "password#{i}")

    color = %w(black white orange brown).sample
    sex = ['M','F'].sample 
    
    c = Cat.create!(name: "name#{i}", 
        birth_date: i.years.ago, 
        color: color,
        sex: sex, 
        description: "description#{i}",
        user_id: u.id)

    CatRentalRequest.create!(cat_id: c.id,
    start_date: i.month.ago,
    end_date: i.month.from_now,
    status: 'PENDING')
end