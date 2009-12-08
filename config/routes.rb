ActionController::Routing::Routes.draw do |map|
  map.resources :forms
  
  map.root :controller => 'forms'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
