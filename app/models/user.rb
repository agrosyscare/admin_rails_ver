class User < ApplicationRecord
  has_paper_trail on: %i[ update destroy ], only: %i[rut firstname middlename lastname mothername phone email encrypted_password]

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :rut, presence: true, run: {uniqueness: false}, if: Proc.new { |u| u.rut.present? } || !u.super_admin?
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :phone, format: {with: /\A\+56[2-9]\d{8}\z/}, if: Proc.new { |u| u.phone.present? }

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
end

