require 'rails_helper'

describe Author do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:birthdate) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name) }

  it { should have_many(:books)}
end
