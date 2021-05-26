class User < ApplicationRecord
  include PublicActivity::Model
  # tracked owner: Proc.new{ |controller, model| controller.current_user }
  rolify
  after_create :assign_default_role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  validates :rut, presence: true, run: {uniqueness: false}, if: Proc.new { |u| u.rut.present? || !u.super_admin? }

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
