class AdminController < ActionController::Base

  before_action :authenticate, except: [:login]
  def index
    render layout: 'application'
  end

  def login
    render layout: 'application'
  end

  def checkLogin
    user = User.find_by_email(params[:user][:email])
    if user.password == params[:user][:password] && user.kind == 1
      session[:email] = user.email
      redirect_to admin_index_path
    else
      redirect_to admin_login_path
    end
  end

  def logOut
    reset_session
    redirect_to admin_login_path
  end

  def newUser
    session[:pablo] = 1
    render layout: 'application'
  end

  def newProduct
  end

  def updateUser
  end

  def updateProduct
  end

  def destroyUser
  end

  def destroyProduct
  end

  def showUser
  end

  def showProduct
  end

  private

  def authenticate
    if session[:email] == nil
      redirect_to admin_login_path
    else
      @login = true
    end
  end
end
