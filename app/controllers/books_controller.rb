class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    #データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      # 詳細画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end


  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end


  private
  # ストロングパラメータ
  def book_params
   params.require(:book).permit(:title, :body)
  end
end