class Patient < ApplicationRecord
  belongs_to :user #A patient is associated with the system user.
  belongs_to :clinic #A patient belongs to the clinic that is assigned to it upon creation/edit.
  has_many :notes #A patient can have multiple notes on file.
  has_many :appointments
end
