# coding: utf-8
class TradersController < ApplicationController

  before_filter :find_trader, only: [:show, :edit, :update, :destroy]

  def index
    @traders = Trader.all
  end

  def show
  end

  def new
    @trader = Trader.new
  end

  def create
    @trader = Trader.new(permitted_params)

    if @trader.save
      redirect_to @trader, notice: 'Трейдер успешно добавлен в базу данных'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @trader.update(permitted_params)
      redirect_to @trader, notice: 'Данные трейдера успешно обновлены'
    else
      render 'edit'
    end
  end

  def destroy
    if @trader.destroy
      redirect_to traders_path, notice: 'Трейдер успешно удален'
    else
      render 'show'
    end
  end

private
  def find_trader
    (@trader = Trader.find_by_id(params[:id])) ? (return @trader) : (redirect_to traders_path, alert: 'Трейдер отсутствует')
  end

  def permitted_params
    params.require(:trader).permit(:pamm_name, :pamm_url, :pamm_broker, :pamm_num)
  end
end
