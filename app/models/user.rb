class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :rut, presence: true, run: {uniqueness: false}, if: Proc.new { |u| u.rut.present? } #|| !u.super_admin? 
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :phone, format: {with: /\A\+56[2-9]\d{8}\z/}, if: Proc.new { |u| u.phone.present? }

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
