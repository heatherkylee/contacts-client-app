class Client::ContactsController < ApplicationController
  def index
    #need to get all contacts from api app
    response = Unirest.get("http://localhost:3000/api/contacts/")
    @contacts = response.body
    render "index.html.erb"
  end

  def show
    contact_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/contacts/#{contact_id}")
    @contact = response.body
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    #need to send the client inputted information to the api app and retrieve the information from the api app
    response = Unirest.post("http://localhost:3000/api/contacts", parameters:
      {
        input_first_name: params[:input_first_name],
        input_middle_name: params[:input_middle_name],
        input_last_name: params[:input_last_name],
        input_phone_number: params[:input_phone_number],
        input_email: params[:input_email],
        input_bio: params[:input_bio]
      }
    )
    @contact = response.body
    render "show.html.erb"
  end

  def edit
    contact_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/contacts/#{contact_id}")
    @contact = response.body
    render "edit.html.erb"
  end

  def update
    # when i click submit I need to send the information from the html form to api app to update in the db and then send the updated informtion back to show.html.erb to show that the contact has been updated
    contact_id = params[:id]    
    response = Unirest.patch("http://localhost:3000/api/contacts/#{contact_id}", parameters:
      {
        input_first_name: params[:input_first_name],
        input_middle_name: params[:input_middle_name],
        input_last_name: params[:input_last_name],
        input_phone_number: params[:input_phone_number],
        input_email: params[:input_email],
        input_bio: params[:input_bio]
      }
    )
    @contact = response.body
    render "show.html.erb" 
  end

  def destroy
    contact_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/contacts/#{contact_id}")
    render "destroy.html.erb"
  end
end
