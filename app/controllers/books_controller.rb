class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :borrow, :return_book]

  def index
    @books = Book.all
    if params[:search].present?
      @books = @books.where("titre ILIKE ? OR auteur ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end

  def show
    @people = Person.all.order(:nom, :prenom)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Le livre a été ajouté avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Le livre a été modifié avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy!
    redirect_to books_path, notice: "Le livre a été supprimé avec succès.", status: :see_other
  end

  def borrow
    person = Person.find(params[:person_id])
    @book.update(person: person)
    redirect_to @book, notice: "Le livre a été prêté à #{person.prenom} #{person.nom}."
  end

  def return_book
    person_name = "#{@book.person.prenom} #{@book.person.nom}"
    @book.update(person: nil)
    redirect_to @book, notice: "Le livre a été rendu par #{person_name}."
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:titre, :auteur, :person_id)
  end
end
