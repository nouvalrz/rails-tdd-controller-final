class FoodsController < ApplicationController
  def index
    @foods = params[:letter] ? Food.by_letter(params[:letter]) : Food.all
  end

  def show
    @food = Food.find_by(id: params[:id])
  end

  def new
    @food = Food.new
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
