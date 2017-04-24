class Clinic < ApplicationRecord
  has_many :patients #A clinic has many patients enrolled.
end
