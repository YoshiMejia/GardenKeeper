# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = {
  "Tim" => {
    :email => "tim@gmail",
    :password_digest => "passwardo"
  },
  "Bob" => {
    :email => "bobby@gmail",
    :password_digest => "huhuhu"
  },
  "finn" => {
    :email => "finley@aol",
    :password_digest => "different0"
  },
  "oil boy" => {
    :email => "oily@aol",
    :password_digest => "different0"
  },
  "charlotte" => {
    :email => "charl@aol",
    :password_digest => "different0"
  },
  "orlando" => {
    :email => "orly@aol",
    :password_digest => "different0"
  },
  "kyle" => {
    :email => "kyle@aol",
    :password_digest => "different0"
  },
  "Hanna" => {
    :email => "hanbanan@aol",
    :password_digest => "different0"
  },
  "henry" => {
    :email => "tim@gmail",
    :password_digest => "delta2"
}}

user_list.each do |name, user_hash|
  u = User.new
  u.name = name
  user_hash.each do |attribute, value|
      u[attribute] = value
  end
  u.save
end

plant_list = {
  "Lavender" => {
    :description => "purple, used for medicine"
  },
  "thornbush" => {
    :description => "prickly"
  },
  "Oranges" => {
    :description => "orange tree"
  },
  "monstera" => {
    :description => "plant"
  },
  "oak tree" => {
    :description => "tree"
  },
  "lillies" => {
    :description => "white flower"
  },
  "sunflower" => {
    :description => "seeds"
  },
  "rose" => {
    :description => "pretty red flower"
  },
  "Grass" => {
    :description => "green stuff on lawn"
  },
  "thyme" => {
    :description => "smelly"
}}

plant_list.each do |name, plant_hash|
  p = Plant.new
  p.name = name
  plant_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end

garden_list = {
    "123 Main St" => {
    :user_id => 1,
    :plant_id => 9
},
"345 coffee lane" => {
    :user_id => 2,
    :plant_id => 8
},
"99 pierce rd" => {
    :user_id => 3,
    :plant_id => 7
},
"743 isles" => {
    :user_id => 4,
    :plant_id => 6
},
"444 broadway" => {
    :user_id => 5,
    :plant_id => 5
},
"456 sobo ave" => {
    :user_id => 6,
    :plant_id => 4
},
"212 home" => {
    :user_id => 7,
    :plant_id => 3
},
"123123 south ave" => {
    :user_id => 8,
    :plant_id => 2
},
"990 Spring st" => {
    :user_id => 9,
    :plant_id => 1
}}

garden_list.each do |address, garden_hash|
  g = Garden.new
  g.address = address
  garden_hash.each do |attribute, value|
      g[attribute] = value
  end
  g.save
end
