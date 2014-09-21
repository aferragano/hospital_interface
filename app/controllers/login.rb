# login.rb
get '/login' do 
	erb :'login/login'
end

post 'login' do
	doctor = Doctor.suthenticate(params[:doctor])
	session[:doctor_id] = doctor.doctor_id
	redirect '/'
end

get 'logout' do 
	session.clear
	redirect '/'
end

get '/signup' do
	erb :'login/signup'
end

post '/signup' do
	doctor = Doctor.create(params[:doctor])
	session[:doctor_id] = doctor.id 
	redirect '/'
end