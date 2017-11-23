require('pry')
require_relative('../models/student.rb')
require_relative('../models/house.rb')

House.delete_all()
Student.delete_all()


house1 = House.new({
  "house_type" => "Tweed"
  })
house1.save()

house2 = House.new({
  "house_type" => "Burgh"
  })
house2.save()

house3 = House.new({
  "house_type" => "Currie"
  })
house3.save()

house4 = House.new({
  "house_type" => "Bearsden"
  })
house4.save()

student1 = Student.new({
  "first_name" => "Fraser",
  "last_name" => "Black",
  "house_id" => house1.id,
  "age" => 22
})
student1.save()

student2 = Student.new({
  "first_name" => "Calum",
  "last_name" => "Brown",
  "house_id" => house2.id,
  "age" => 23
})
student2.save()

student3 = Student.new({
  "first_name" => "Kieran",
  "last_name" => "Friel",
  "house_id" => house3.id,
  "age" => 21
})
student3.save()

student4 = Student.new({
  "first_name" => "Matthew",
  "last_name" => "Brews",
  "house_id" => house4.id,
  "age" => 24
})
student4.save()

binding.pry
nil 
