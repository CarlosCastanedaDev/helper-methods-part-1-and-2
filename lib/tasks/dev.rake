desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
    # Create sample directors
    5.times do
      Director.create(
        name: Faker::Name.name,
        bio: Faker::Lorem.paragraph,
        dob: Faker::Date.birthday(min_age: 25, max_age: 70)
      )
    end

    # Create sample movies
    10.times do
      Movie.create(
        title: Faker::Movie.title,
        description: Faker::Lorem.paragraph,
      )
    end

    # Create sample users
    # 3.times do
    #   User.create(
    #     email: Faker::Internet.email,
    #     password: "password", # You can customize the password
    #     first_name: Faker::Name.first_name,
    #     last_name: Faker::Name.last_name
    #   )
    # end

    puts "Sample data populated for directors, movies, and users."
end
