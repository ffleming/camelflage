class Camel < ApplicationRecord
  validates :name, presence: true
  validates :breed, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
  validates :password, presence: true
end
