class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  has_one :patient

  def admin?
    role == 'admin'
  end

  def patient?
    role == 'patient'
  end

  def nurse?
    role == 'nurse'
  end

  def doctor?
    role == 'doctor'
  end

  scope :admins, -> { where(role: 'admin') }
  scope :doctors, -> { where(role: 'doctor') }
  scope :nurses, -> { where(role: 'nurse') }
  scope :patients, -> { where(role: 'patient') }

  def self.roles
    ['admin', 'doctor', 'nurse', 'patient']
  end
end
