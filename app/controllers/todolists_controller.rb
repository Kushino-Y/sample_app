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
    # 3.トップ画面へリダイレクト
    redirect_to '/top'
  end
  
  private
  # ストロングパラメータ 一番下に書く
  def list_params
    params.require(:list).permit(:title,:body)
  end
  
end