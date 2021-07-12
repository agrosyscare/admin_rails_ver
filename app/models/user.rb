class User < ApplicationRecord
  include Burlesque::Admin

  has_paper_trail on: %i[ update destroy ], only: %i[rut firstname middlename lastname mothername phone email encrypted_password]

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :rut, presence: true, run: {uniqueness: false}, if: Proc.new { |u| u.rut.present? } || !u.super_admin?
  validates :firstname, presence: true || !u.super_admin?
  validates :lastname, presence: true || !u.super_admin?
  validates :phone, format: {with: /\A\+56[2-9]\d{8}\z/}, if: Proc.new { |u| u.phone.present? }

  before_validation :setup_groups

  def super_admin?
    Rails.configuration.super_admins.include?(self.email)
  end

  def complete_name
    if middlename.nil? || mothername.nil?
      "#{firstname.strip} #{lastname.strip}".strip
    else
      "#{firstname.strip} #{middlename.strip} #{lastname.strip} #{mothername.strip}".strip
    end
  end

  def rut=(value)
    super(Run.format(value))
  end

  def is_manager?
    self.groups.where(name: 'Encargado de invernadero').any?
  end

  def is_worker?
    self.groups.where(name: 'Trabajador').any?
  end

  private
  def setup_groups
    unless self.groups.any?
      if group = Burlesque::Group.find_or_create_by(name: 'Trabajador')
        self.groups << group
      end
    end
  end
end

