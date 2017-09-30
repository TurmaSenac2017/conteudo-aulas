require 'rails_helper'

describe "usuário logando", type: :feature do
  before(:each) do
    @user = User.create(email: 'admin@biblioteca.com', password: 'asdf1234')
  end

  it "logando com credencial correta" do
    visit "/authors"

    fill_in 'Email', with: @user.email
    fill_in 'Senha', with: @user.password
    click_button 'Login'

    expect(page).to have_content("Lista de Autores")
  end

  it "logando com credencial correta" do
    visit "/authors"

    fill_in 'Email', with: @user.email
    fill_in 'Senha', with: "kfjkadsfjkl"
    click_button 'Login'

    expect(page).to have_content("Email ou senha inválidos.")
  end
end
