class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    # XXX
    # En la siguiente instruccion, toma todos los libros con el metodo .all, y luego los ordena
    # con el metodo order, y dentro de los parentesis de order, le indica que sea por el atributo "title",
    # y en orden ascendente.
    @books = Book.all.order(title: :asc)

    # XXX
    # Lo siguiente es para detectar si se ha mandado el parametro "status", a traves de la URL.
    if params[:status] and params[:status] != 'all'
      # el método "where" filtra dentro del arreglo @books solamente los objetos book que tengan su atributo "status" igual al elemento :status
      # dentro de la variable params.
      @books = @books.where(status: params[:status]).order(title: :asc)
    end

  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      # XXX
      # Lo que hace esto es primero buscar el libro usando params[:id], y en caso de que ocurra un error,
      # entonces salta a la linea , donde redirecciona al metodo index de este controlador.
      # En este caso, decidimos redireccionar al index, pero ¿Qué otra solución hay? enviarlo a una página especial
      # donde no se encuentran los objetos? O mandarlo a una página donde diga que no se encuentra el libro?
      # O mandarlo a una página con un buscador alternativo? Se puede usar render?
      begin
        @book = Book.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        redirect_to books_url, notice: "ERROR: Libro no encontrado"
      end

    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :status, :checkin, :checkout)
    end
end
