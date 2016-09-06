Rails.application.routes.draw do
	
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	resources :disasters do
			resources :messages, :controller=>"disaster_messages"
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
