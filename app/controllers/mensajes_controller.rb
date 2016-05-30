class MensajesController < ApplicationController

  # estos mensajes son los del formulario de la sección Contacto

  def new
  @mensaje = Mensaje.new
end

def create
  @mensaje = Mensaje.new(mensaje_params)

  if @mensaje.valid?
    MensajeMailer.new_mensaje(@mensaje).deliver
    redirect_to root_path, notice: "Mensaje enviado."
  else
    flash[:alert] = "Ha habido un error..."
    render :new
  end
end

private

def mensaje_params
  params.require(:mensaje).permit(:nombre, :email, :contenido)
end

end
