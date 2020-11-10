TITLES = ["Ruby On Rails", "Spring Boot", "React", "Node Express", "Php", "Python and Django", "Android", "IOS"]
IMAGES = ['/public/image/test1.jpg', '/public/image/test2.jpg', '/public/image/test3.jpg', '/public/image/test4.jpg', '/public/image/test5.jpg', '/public/image/app.png', '/public/image/rails.png']

# AdminUser.create!(email: 'admin@test.com', password: '123456', password_confirmation: '123456') if Rails.env.development?

def get_user
  User.order("RANDOM()").limit(1).first
end 

def get_project
  Project.order("RANDOM()").limit(1).first
end

def generate_project title = "프로젝트"
  5.times do 
    image_field = File.open(("#{Rails.root}"+IMAGES.sample))
    Project.create(name: TITLES.sample + " " + title, description: Faker::Lorem.sentence(word_count: 100), image: image_field, start_at: Date.today, end_at: Date.today + 5.days)
    puts "프로젝트 생성"
  end
end
   
def generate_users 
  5.times do
    user_info = {
      email: Faker::Internet.email,
      password: "password",
      name: "#{Faker::Name.name}",
      phone: "010-1234-5678",
    }

    User.customer.create(user_info)
    puts "고객 생성"
  end

  5.times do
    user_info = {
      email: Faker::Internet.email,
      password: "password",
      name: "#{Faker::Name.name}",
      phone: "010-1234-5678",
    }

    User.developer.create(user_info)
    puts "개발자 생성"
  end
end

def generate_posts
  5.times do 
    image_field = File.open(("#{Rails.root}"+IMAGES.sample))
    post = Post.create( user: get_user, title: Faker::Computer.platform + " 게시글", body: Faker::Lorem.sentence(word_count: 100), project: get_project, image: image_field )
    puts "게시글 생성"
  end
end

generate_project
generate_users
generate_posts