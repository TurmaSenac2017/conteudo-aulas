class Author < ApplicationRecord
  attr_reader :remember_me
  has_many :books

  validates_presence_of :name
  validates_uniqueness_of :name
end
