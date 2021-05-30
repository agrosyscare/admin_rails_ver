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

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "User was successfully created." }
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
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
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
      :firstname,
      :middlename,
      :lastname,
      :mothername,
      :email,
      :phone,
      {role_ids: []},
      *dynamic_attributes
    )
  end
end
