# record.rb
get '/record/display/:id' do
  @record = Record.find(params[:id])
  erb :'record/display'
end

get '/record/new' do
  if session[:doctor_id]
    erb :'record/new'
  else
    erb :login
  end
end

post '/record/new' do
  # doctor = doctor.find(session[:doctor_id])
  Record.create(title: params[:title], text: params[:text])

  # erb :'/record/new'

  redirect :'/record/display'
end

get '/record/:id/edit' do
  @record = Record.find(params[:id])
  erb :'record/edit'
end

put '/record/:id/edit' do
  record = Record.find(params[:id])
  record.update(title: params[:title])
  redirect :"record/display/#{record.id}"
end

delete "/record/:id" do
  Record.find(params[:id]).destroy
  redirect "/"
end

get '/record/display' do
  @record = Record.all
end
