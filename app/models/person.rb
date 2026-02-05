class Person < ApplicationRecord
  has_many :books, dependent: :nullify

  validates :nom, presence: true
  validates :prenom, presence: true
end
