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
    params.require(:user).permit({role_ids: []})
  end

end
