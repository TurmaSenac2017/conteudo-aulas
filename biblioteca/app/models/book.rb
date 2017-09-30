# class String
#   def inicial_maiscula?
#     self[0] == self[0].upcase
#   end
# end

class Book < ApplicationRecord
  belongs_to :author

  validates_presence_of :title
  # validates_presence_of :author

  mount_uploader :cover, CoverUploader

end
