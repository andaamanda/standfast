Standfast::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end
  
  # old content redirects
  match "/system/documents/fbt-om.pdf", :to => redirect("/support")
  match "/system/documents/road_tanker_comparison.pdf", :to => redirect("/support")
  match "/system/documents/Installation1.pdf", :to => redirect("/support")
  match "/system/documents/standard-om.pdf", :to => redirect("/support")
  match "/system/documents/TRAM_Installation_Manual_-_All_Blocks_-_July_07.pdf", :to => redirect("/support")
  match "/system/documents/ISOTRAM_operators_manual_draft_V0.pdf", :to => redirect("/support")
  match "/system/documents/trd.pdf", :to => redirect("/support")
  match "/system/resources/catalogue.pdf", :to => redirect("http://standfast.s3.amazonaws.com/documents/catalogue.pdf")
  match "/hdbsxqtwcoijntvg.html", :to => redirect("/")
  
  # redirect to www
  constraints(:host => /^standfastusa.com/) do
    root :to => redirect("http://www.standfastusa.com")
    match '/*path', :to => redirect { |params| "http://www.standfastusa.com/#{params[:path]}" }
  end
  constraints(:host => /^st.local/) do
    root :to => redirect("http://www.st.local")
    match '/*path', :to => redirect { |params| "http://www.st.local/#{params[:path]}" }
  end

  resources :standfast
  match 'about' => "standfast#about"
  match 'support' => "standfast#support"
  match 'installation' => "standfast#installation"
  match 'contact' => "standfast#contact"  
  match 'testimonials' => 'standfast#testimonials'
  match 'email' => "standfast#email"
  match 'thanks' => "standfast#thanks"
  match 'legal' => "standfast#legal"
  
  resources :solutions
  match 'tram' => "solutions#tram"
  match 'isotram' => "solutions#isotram"
  match 'railtram' => "solutions#railtram"
  match 'firetram' => "solutions#firetram"
  match 'windtram' => "solutions#windtram"
  match 'tline' => "solutions#tline"
  match 'custom' => "solutions#custom"
  
  get '/gsa' => 'standfast#gsa'
  
  resources :installers
  
  # login
  match '/login' => 'sessions#login'
  get '/logout' => 'sessions#logout'
  
  get 'news' => 'posts#index', :as => :news
  get 'news/:slug' => 'posts#show', :as => :article
  resources :posts
  
  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"
  root :to => "standfast#index"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  
  # errors
  match '/fouroone', :to => 'application#render_401'
  match '/fourothree', :to => 'application#render_403'
  match "*url", :to => 'application#render_404' # invalid route
end
