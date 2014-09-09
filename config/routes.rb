ActionController::Routing::Routes.draw do |map|
  map.resources :forms do |form|
    form.resources :questions
  end
  map.render_form '/render/:id', :controller => 'render', :action => 'show', :conditions => {:method => :get}
  map.receive '/receiver/:id', :controller => 'receiver', :action => 'update', :conditions => {:method => :put}
  map.form_message '/thankyou/:id', :controller => 'response', :action => 'thankyou', :conditions => {:method => :get}
  
  map.root :controller => 'forms'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
