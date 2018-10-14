Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
			defaults format: :json do
	  		get "/:url", to: "short_urls#new", :constraints  => { :url => /[0-z\.]+/ }
	  		get "/details/:url", to: "short_url_details#index", :constraints  => { :url => /[0-z\.]+/ }
			end
  	end
  end

  get "/:short_url", to: "short_urls#show"
  root to: "short_urls#index"
end
