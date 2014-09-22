# display.rb
get '/record/display' do
  @record = Record.all

  erb :'/record/display'
end
