class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :set_category
  before_action :set_breadcrumbs

  # GET /books or /books.json
  def index
    @breadcrumbs += [
      {link: '#', text: 'Books', enable: false}
    ]
    # XXX
    # En la siguiente instruccion, toma todos los libros con el metodo .all, y luego los ordena
    # con el metodo order, y dentro de los parentesis de order, le indica que sea por el atributo "title",
    # y en orden ascendente.
    @books = @category.books.all.order(title: :asc)

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
    @breadcrumbs += [
      {link: category_books_path(@category), text: 'Books', enable: true},
      {link: '#', text: @book.title, enable: false}
    ]
  end

  # GET /books/new
  def new
    @breadcrumbs += [
      {link: category_books_path(@category), text: 'Books', enable: true},
      {link: '#', text: 'New', enable: false}
    ]
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @breadcrumbs += [
      {link: category_books_path(@category), text: 'Books', enable: true},
      {link: category_book_path(@category, @book), text: @book.title, enable: true},
      {link: '#', text: 'Edit', enable: false}
    ]
  end

  # POST /books or /books.json
  def create
    @book = @category.books.build(book_params)

    respond_to do |format|
      if @book.save
        flash[:success] = "Book was successfully created."
        format.html { redirect_to category_books_path(@category) }
        format.json { render :show, status: :created, location: @book }
      else
        flash[:danger] = "Ups, there was an issue with your category"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        flash[:success] = "Book was successfully updated."
        format.html { redirect_to category_books_path(@category) }
        format.json { render :show, status: :ok, location: @book }
      else
        flash[:danger] = "Ups, there was an issue with your category"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      flash[:warning] = "Book was successfully destroyed."
      format.html { redirect_to category_books_path(@category) }
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

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_breadcrumbs
      @breadcrumbs = [
        {link: root_path, text: 'Categories', enable: true},
        {link: @category, text: @category.name, enable: true},
      ]
    end
end
