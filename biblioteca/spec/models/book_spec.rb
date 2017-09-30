require 'rails_helper'

describe Book, type: :model do
  it { should validate_presence_of(:title) }
  it { should belong_to(:author) }
end
