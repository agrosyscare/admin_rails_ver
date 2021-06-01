class User < ApplicationRecord
  include PublicActivity::Model
  # tracked owner: Proc.new{ |controller, model| controller.current_user }
  rolify
  after_create :assign_default_role
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :rut, presence: true, run: {uniqueness: false}
  validates :firstname, presence: true
  validates :lastname, presence: true

  def rut=(value)
    super(Run.format(value))
  end

  def assign_default_role
    if User.count == 1
      add_role(:super_admin) if roles.blank?
      add_role(:administrator)
      add_role(:operator)
    elsif roles.blank?
      add_role(:administrator)
    end
  end
end
