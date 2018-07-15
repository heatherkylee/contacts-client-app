Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  get "/" => "client/contacts#index"
  namespace :client do
    # show all
    get "/contacts" => "contacts#index"
    # display new contact form
    get "/contacts/new" => "contacts#new" 
    # show specific contact
    get "/contacts/:id" => "contacts#show"
    # create new contact (this happens when submit button is clicked on the new.html.erb page)
    post "/contacts" => "contacts#create"
    # like new, but return a contact form to edit an existing contact
    get "/contacts/:id/edit" => "contacts#edit"
    # edit a specific contact
    patch "/contacts/:id" => "contacts#update"
    # delete a contact
    delete "/contacts/:id" => "contacts#destroy"

    get "/signup" => "users#new"
    post "/users" => "users#create"
    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
    delete "/logout" => "sessions#destroy"
  end
end
