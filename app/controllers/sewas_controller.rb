class SewasController < ApplicationController
  before_action :set_sewa, only: %i[ show edit update destroy ]

  # GET /sewas or /sewas.json
  def index
    @sewas = Sewa.all
  end

  # GET /sewas/1 or /sewas/1.json
  def show
  end

  # GET /sewas/new
  def new
    @sewa = Sewa.new
  end

  # GET /sewas/1/edit
  def edit
  end

  # POST /sewas or /sewas.json
  def create
    @sewa = Sewa.new(sewa_params)

    respond_to do |format|
      if @sewa.save
        format.html { redirect_to @sewa, notice: "Sewa was successfully created." }
        format.json { render :show, status: :created, location: @sewa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sewa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sewas/1 or /sewas/1.json
  def update
    respond_to do |format|
      if @sewa.update(sewa_params)
        format.html { redirect_to @sewa, notice: "Sewa was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @sewa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sewa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sewas/1 or /sewas/1.json
  def destroy
    @sewa.destroy!

    respond_to do |format|
      format.html { redirect_to sewas_path, notice: "Sewa was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sewa
      @sewa = Sewa.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sewa_params
      params.expect(sewa: [ :kasur_id, :penyewa_id, :tanggal_mulai, :tanggal_selesai, :total_harga, :status ])
    end
end
