# coding: utf-8
class TradersController < ApplicationController

  def index
    @traders = Trader.all
  end

  def show
    @trader = Trader.find(params[:id])
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
    @trader = Trader.find(params[:id])
  end

  def update
    @trader = Trader.find(params[:id])

    if @trader.update(permitted_params)
      redirect_to @trader, notice: 'Данные трейдера успешно обновлены'
    else
      render 'edit'
    end
  end

  def destroy
    @trader = Trader.find(params[:id])

    if @trader.destroy
      redirect_to traders_path, notice: 'Трейдер успешно удален'
    else
      render 'show'
    end
  end

private
  def permitted_params
    params.require(:trader).permit(:pamm_name, :pamm_url, :pamm_broker, :pamm_num)
  end
end
