class Author < ApplicationRecord
  attr_reader :remember_me
  has_many :books

  validates_presence_of :name, :birthdate
  validates_uniqueness_of :name
  validates_length_of :name, maximum: 20
end
