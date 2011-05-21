Railsconf2011::Application.routes.draw do
  root :to => "presentations#index"
  resources :presentations, :only => [ :index ]
end
