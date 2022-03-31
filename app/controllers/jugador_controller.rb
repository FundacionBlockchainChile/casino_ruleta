class JugadorController < ApplicationController
  def create
  end

  def store
    # create a new jugador object and save to db
    print(params)
    @jugador = Jugador.new({:nombre => params[:nombre], :email => params[:email], :total_billetera => params[:total_billetera]})
    @jugador.save
    # trigger an event with pusher
    if @jugador.save
          # broadcasting posts using pusher
          print('*************************************')
          print(@jugador.nombre)
          print('*************************************')
          Pusher.trigger('jugadores-channel','new-jugador', {
            id: @jugador.id,
            nombre: @jugador.nombre,
            email: @jugador.email,
            total_billetera: @jugador.total_billetera
          })
        end 
    # redirect_to('/')
  end
end
