class FoodsController < ApplicationController
  def index
    @foods = params[:letter] ? Food.by_letter(params[:letter]) : Food.all
  end

  def show

  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
