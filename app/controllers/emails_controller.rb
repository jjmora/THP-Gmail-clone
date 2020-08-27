class EmailsController < ApplicationController
  def index
    @email = Email.all.order('created_at DESC')
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html{
        redirect_to email_path(params[:id])
      }
      format.js{ }
    end
  end

  def create
    @email = create_email(mail_params)
    
    respond_to do |format|
      format.html{
        redirect_to root_path
      }
      format.js{ }
    end
    # flash[:notice] = "You received a new email"
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    p "# "*20
    p mail_params[:read]
    p "# "*20
    # if mail_params[:read] == true
    #   @email.read = false
    # else
    #   @email.read = true
    # end
    
    # p "# "*20
    # p @email.read
    # p "# "*20
    redirect_to root_path
  end

  def destroy
    @emails = Email.all
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html{
        redirect_to root_path
      }
      format.js{ }
    end
    # flash[:error] = "The email has been deleted"
  end

  private

  def create_email(mail_params)
      new_email = Email.create(objet: Faker::Lorem.sentences[0], body: Faker::Lorem.paragraph, email: Faker::Internet.email, read: false)
  end

  def mail_params
    params.permit(:id, :objet, :body, :email, :read)
  end
end
