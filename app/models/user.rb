class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  has_one :patient

  scope :admins, -> { where(role: 'admin') }
  scope :doctors, -> { where(role: 'doctor') }
  scope :nurses, -> { where(role: 'nurse') }
  scope :patients, -> { where(role: 'patient') }

end
