class TodolistsController < ApplicationController
  def new
    #/Viewへ渡すためのインスタンスにからのモデルオブジェクトを生成する。
    @list = List.new
  end
  
  def create
    # 1.データを新規登録するためのインステンス作成
    list = List.new(list_params)
    # 2.データをデータベースに保存するためのsaveメソッドの実行
    list.save
    # 3.詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
  end
  
  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  
  private
  # ストロングパラメータ 一番下に書く
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
  
end
