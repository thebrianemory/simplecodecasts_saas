class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contacts_params)
    
    if @contact.save
      flash[:success] = 'Message sent.'
      redirect_to new_contact_path
    else
      flash[:danger] = 'Error occured, message has not been sent. All form fields are required.'
      redirect_to new_contact_path
    end
  end
  
  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end