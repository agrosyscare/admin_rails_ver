class User < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
    else
      self.add_role(:operator) if self.roles.blank?
    end
  end

end
