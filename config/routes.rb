ActionController::Routing::Routes.draw do |map|
  map.resources :forms do |form|
    form.resources :questions
  end
  map.resources :render
  
  map.root :controller => 'forms'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
