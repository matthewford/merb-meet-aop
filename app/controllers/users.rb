class Users < Application
  provides :xml, :yaml, :js
  
  def index
    @users = User.all
    display @users
  end

  def show(id = params[:id])
    @user = User[id]
    display @user
  end

  def new
    only_provides :html
    @user = User.new
    render
  end

  def edit(id = params[:id])
    only_provides :html
    @user = User[id]
    render
  end

  def create(user = params[:user])
    @user = User.new(user)
    if @user.save
      redirect url(:user, @user)
    else
      render :new
    end
  end

  def update(id = params[:id], user = params[:user])
   @user = User[id]
    if @user.update_attributes(user)
      redirect url(:user, @user)
    else
      raise BadRequest
    end
  end

  def destroy(id = params[:id])
    @user = User[id]
    if @user.destroy!
      redirect url(:users)
    else
      raise BadRequest
    end
  end
  
end
