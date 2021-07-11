module Admin
  class UsersController < AdminController
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
    def show
    end

    # GET /users/new
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to admin_users_path, notice: User.human_notice(:created) }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def show
      @versions = @user.versions
    end

    def edit
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to admin_users_path, notice: User.human_notice(:updated) }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_url, notice: User.human_notice(:destroyed) }
      end
    end

    def rollback
      @user = User.find(params[:user_id])
      version = @user.versions.find(params[:version])
      if version.reify.save
        redirect_to @user, notice: User.human_notice(:rollbacked)
      else
        render :show, error: User.human_notice(:rollback)
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

      if current_user.super_admin?
        dynamic_attributes << [group_ids: []]
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

end
