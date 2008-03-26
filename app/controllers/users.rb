class Users < Application
  provides :xml, :yaml, :js
  
  def index
    @users = User.all
    display @users
  end

  def show
    @user = User.first(params[:id])
    display @user
    rescue DataMapper::ObjectNotFoundError
      raise NotFound
  end

  def new
    only_provides :html
    @user = User.new
    render
  end

  def edit
    only_provides :html
    @user = User.first(params[:id])
    render
    rescue DataMapper::ObjectNotFoundError
      raise NotFound
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect url(:user, @user)
    else
      render :new
    end
  end

  def update
    @user = User.first(params[:id])
    if @user.update_attributes(params[:user])
      redirect url(:user, @user)
    else
      raise BadRequest
    end
    rescue DataMapper::ObjectNotFoundError
      raise NotFound
  end

  def destroy
    @user = User.first(params[:id])
    if @user.destroy!
      redirect url(:users)
    else
      raise BadRequest
    end
    rescue DataMapper::ObjectNotFoundError
      raise NotFound
  end
  
end
