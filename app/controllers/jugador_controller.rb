class JugadorController < ApplicationController
  before_action :set_jugador, only: %i[ show edit update destroy ]

  def new  #GET
    @jugador = Jugador.new
  end
  
  def create #POST
    # create a new jugador object and save to db
    @jugador = Jugador.new({:nombre => params[:nombre], :email => params[:email], :total_billetera => 10000})
    @jugador.save
    # trigger an event with pusher
    if @jugador.save
      # broadcasting posts using pusher
      Pusher.trigger('jugadores-channel','new-jugador', {
        id: @jugador.id,
        nombre: @jugador.nombre,
        email: @jugador.email,
        total_billetera: @jugador.total_billetera
      })
      redirect_to('/')
    else
      flash[:notice] = "Porfavor llena los campos correctamente e intenta denuevo."
      print(@jugador.errors)
      redirect_to jugador_create_path(@jugador)
    end
  end

  def edit #GET
    @jugador = Jugador.find_by_id(params[:id])
  end

  def update #PUT/PATCH
    @jugador = Jugador.find(params[:id])
    if @jugador.update(jugador_params)
     flash[:notice] = "Jugador actualizado"
     redirect_to root_path
    else
      flash[:notice] = "Ops. Hubo un problema. Porfavor llena todos los campos correctamente."
      redirect_to jugador_path(@jugador)
    end
  end

  def destroy #DELETE
    @jugador.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Jugador was successfully destroyed." }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jugador
      @jugador = Jugador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jugador_params
      params.require(:jugador).permit(:nombre, :email, :total_billetera)
    end


end
