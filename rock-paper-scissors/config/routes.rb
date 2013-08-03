RockPaperScissors::Application.routes.draw do
	root :to => 'game#new'
	post '/throw' => 'game#play'
	get '/throw' => redirect('/')
end
