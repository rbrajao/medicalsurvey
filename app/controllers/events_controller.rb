class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ show edit update new ]

  before_action :authenticate_user!

  # GET /events or /events.json
  def index
    @events = Event.all 

  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  #####import patients
  def import_patients
    csv_file = params[:event][:csv_file]
    event_id = params[:event][:event_id]
    
    # Faça a leitura e o processamento do arquivo CSV aqui
    # Você pode usar uma biblioteca como 'csv' para facilitar a leitura e o processamento

    # Exemplo de código para processar o arquivo CSV
    require 'csv'

    CSV.foreach(csv_file.path, headers: true) do |row|
      nome = row['Nome do Paciente']
      data_nascimento = row['Data de Nascimento']
      cpf = row['CPF']
      sexo = row['Sexo']

      # Crie uma instância de Patient associada ao evento
      patient = Patient.new(nome: nome, data_nascimento: data_nascimento, cpf: cpf, sexo: sexo)
      patient.event_id = event_id
      patient.save
    end

    # Redirecione ou exiba uma mensagem de sucesso após o processamento do arquivo
    redirect_to event_path(event_id), notice: 'Lista de pacientes importada com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:survey_id, :organization_id, :name, :date_init, :date_end, :acessurl, :status)
    end

    def set_organization
      @organizations = Organization.all
    end
end
