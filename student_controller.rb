require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( './models/student' )

get '/students' do # index
  @students = Student.all()
  erb( :index )
end

get '/students/new' do # new
  erb( :new )
end

post '/students' do # create
  @student = Student.new( params )
  @student.save()
  redirect to "/students"
end

get '/students/:id' do # show
  @student = Student.find( params[:id] )
  erb( :show )
end


get '/students/:id/edit' do # edit
  @student = Student.find( params[:id] )
  @houses = House.all
  erb( :edit )
end
#
put '/students/:id' do # update
  Student.new( params ).update
  redirect to '/students'
end

delete '/students/:id' do # delete
  student = Student.find( params[:id] )
  student.delete()
  redirect to '/students'
end
