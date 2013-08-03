RockPaperScissors::Application.routes.draw do
	root :to => 'game#new'
	post '/throw' => 'game#play'
end
