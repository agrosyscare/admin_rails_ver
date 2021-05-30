class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
  end

  def datatable
    @users = User.all

    respond_to do |format|
      format.json { render json: UserDatatable.new(params, collection: @users) }
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    binding.pry
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
      if @user.update(user_params)
        redirect_to users_path, notice: "User was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    dynamic_attributes = []

    unless (params[:user][:password].nil? || params[:user][:password].blank?)
      dynamic_attributes << [:password, :password_confirmation]
    end
    params.require(:user).permit(
      :rut,
      :fistname,
      :middlename,
      :lastname,
      :mothername,
      :phone,
      {role_ids: []},
      *dynamic_attributes
    )
  end

end
