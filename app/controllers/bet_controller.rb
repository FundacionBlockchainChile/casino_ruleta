class BetController < ApplicationController
  before_action :set_bet, only: %i[ show edit update destroy ]

  def new  #GET
    @jugador = Jugador.find(Integer(params[:format]))
    @bet = Bet.new
  end
  
  def create #POST
    jugador_id =    params[:jugador_id]
    bet_ammount =   params[:bet_ammount]
    bet_color =     params[:bet_color]
    @bet = Bet.new({:round_id => Round.last.id, jugador_id: jugador_id, bet_ammount: bet_ammount, bet_color: bet_color})
    @bet.save
    # trigger an event with pusher
    if @bet.save
      jugador = Jugador.find(jugador_id)
      broadcasting bets using pusher
      Pusher.trigger('bets-channel','new-bet', {
        id: @bet.id,
        bet_ammount: @bet.bet_ammount,
        bet_color: @bet.bet_color,
        jugador_name: jugador.name
      })
      redirect_to('/')
    else
      flash[:notice] = "Porfavor llena los campos correctamente e intenta denuevo."
      redirect_to bet_create_path(@bet)
    end
  end

  def edit #GET
  end

  def update #PUT/PATCH
    @bet = Bet.find(params[:id])
    if @bet.update(bet_params)
     flash[:notice] = "Apuesta modificada"
     redirect_to root_path
    else
      flash[:notice] = "Ops. Hubo un problema. Porfavor llena todos los campos correctamente."
      redirect_to bet_path(@bet)
    end
  end

  def destroy #DELETE
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Bet was successfully destroyed." }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end

   # Only allow a list of trusted parameters through.
    def bet_params
      params.require(:bet).permit(:round_id, :jugador_id, :jugador_name, :bet_color, :bet_ammount)
    end

end
