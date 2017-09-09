class AuthorsController < ApplicationController
  authorize_resource class: :authors
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @authors = Author.where("name like '%#{params[:search]}%'").paginate(page: params[:page], per_page: 5)
    else
      @authors = Author.paginate(page: params[:page], per_page: 5)
    end
  end

  def show;end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to authors_path, notice: "Autor cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @author.assign_attributes(author_params)

    if @author.save
      redirect_to authors_path, notice: "Autor foi Atualizado com sucesso"
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      begin
        @author.delete
        format.html { redirect_to authors_path, notice: "Autor removido com sucesso" }
        format.js
      rescue
        format.html { redirect_to authors_path, notice: "Autor não pode ser removido" }
        format.js
      end
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :birthdate)
  end
end
