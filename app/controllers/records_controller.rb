class RecordsController < ApplicationController
  def index
    if params[:actor].present?
      @records = Record.where(actor: params[:actor])
    else
      @records = Record.all
    end
  end

  private

  def record_params
    params.require(:record).permit(:actor)
  end
end
