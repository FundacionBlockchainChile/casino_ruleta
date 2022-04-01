class JugadorController < ApplicationController
  before_action :set_jugador, only: %i[ show edit update destroy ]


  def create
    @jugadores = Jugador.all
  end

  def edit
  end

  # PATCH/PUT /jugadors/1 or /jugadors/1.json
  def update
    byebug
    respond_to do |format|
      if @jugador.update(jugador_params)
        format.html { redirect_to jugador_url(@jugador), notice: "Jugador was successfully updated." }
        format.json { render :show, status: :ok, location: @jugador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jugador.errors, status: :unprocessable_entity }
      end
    end
  end

  def store
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

  def destroy
    @jugador.destroy
    respond_to do |format|
      format.html { redirect_to jugador_create_path, notice: "Jugador was successfully destroyed." }
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
