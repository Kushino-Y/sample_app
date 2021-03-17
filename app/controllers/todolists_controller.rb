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
    list.update(list_params) #データ（レコード）をアップデート
    redirect_to todolist_path(list.id)#詳細画面へリダイレクト
  end
  
  def destroy
    list = List.find(params[:id]) #データレコードを一件削除
    list.destroy #データ（レコード）を削除
    redirect_to todolists_path #投稿一覧画面へリダイレクト
    
  end
  private
  # ストロングパラメータ 一番下に書く
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
  
end
