class Book < ApplicationRecord
  belongs_to :person, optional: true

  validates :titre, presence: true
  validates :auteur, presence: true
end
