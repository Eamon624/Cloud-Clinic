class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

    #A system user can complete all actions multiple times.
  has_many :patients
  has_many :notes
  has_many :appointments

    #Devise is the ruby gem used to control user authentication.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
