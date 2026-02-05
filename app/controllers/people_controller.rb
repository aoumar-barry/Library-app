class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy, :return_all_books, :borrow_book]

  def index
    @people = Person.all
    if params[:search].present?
      @people = @people.where("nom ILIKE ? OR prenom ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end

  def show
    @all_books = Book.includes(:person).order(:titre)
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to @person, notice: "Personne créée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @person.update(person_params)
      redirect_to @person, notice: "Personne modifiée avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy!
    redirect_to people_path, notice: "Personne supprimée avec succès.", status: :see_other
  end

  def return_all_books
    books_count = @person.books.count
    @person.books.update_all(person_id: nil)
    redirect_to @person, notice: "#{books_count} livre(s) ont été rendus."
  end

  def borrow_book
    book = Book.find(params[:book_id])
    book.update(person: @person)
    redirect_to @person, notice: "Le livre \"#{book.titre}\" a été emprunté."
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:nom, :prenom, :email)
  end
end
