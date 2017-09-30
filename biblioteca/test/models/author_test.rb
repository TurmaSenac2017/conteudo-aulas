require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "não pode salvar sem nome" do
    author = Author.new(birthdate: Date.today-18.years)
    assert_not author.save
  end

  test "não pode salvar sem data de nascimento" do
    author = Author.new(name: "John Doe")
    assert_not author.save
  end

  test 'pode salvar com o nome e com a data de nascimento' do
    author = Author.new(
      name: "John Doe",
      birthdate: Date.today - 30.years)
    assert author.save
  end
end
