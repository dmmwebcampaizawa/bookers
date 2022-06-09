class BooksController < ApplicationController

  def create
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @books = Book.all
    #データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      flash[:notice] = "Book was successfully created."
      # 詳細画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
    
    # book = Book.find(params[:id])
    # book.update(book_params)
    # flash[:notice] = "Book was successfully created."
    # redirect_to book_path(book.id)

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully created."
    redirect_to '/books'
  end


  private
  # ストロングパラメータ
  def book_params
   params.require(:book).permit(:title, :body)
  end
end