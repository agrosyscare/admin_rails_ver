class User < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  rolify
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  def assign_default_role
    if User.count == 1
      self.add_role(:super_admin) if self.roles.blank?
      self.add_role(:administrator)
      self.add_role(:operator)
    else
      self.add_role(:administrator) if self.roles.blank?
    end
  end

end
