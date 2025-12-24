# frozen_string_literal: true

class PenyewasController < ApplicationController
  before_action :set_penyewa, only: %i[ show edit update destroy ]

  # GET /penyewas or /penyewas.json
  def index
    @penyewas = Penyewa.all
  end

  # GET /penyewas/1 or /penyewas/1.json
  def show
  end

  # GET /penyewas/new
  def new
    @penyewa = Penyewa.new
  end

  # GET /penyewas/1/edit
  def edit
  end

  # POST /penyewas or /penyewas.json
  def create
    @penyewa = Penyewa.new(penyewa_params)

    respond_to do |format|
      if @penyewa.save
        format.html { redirect_to @penyewa, notice: "Penyewa was successfully created." }
        format.json { render :show, status: :created, location: @penyewa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @penyewa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /penyewas/1 or /penyewas/1.json
  def update
    respond_to do |format|
      if @penyewa.update(penyewa_params)
        format.html { redirect_to @penyewa, notice: "Penyewa was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @penyewa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @penyewa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /penyewas/1 or /penyewas/1.json
  def destroy
    @penyewa.destroy!

    respond_to do |format|
      format.html { redirect_to penyewas_path, notice: "Penyewa was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_penyewa
      @penyewa = Penyewa.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def penyewa_params
      params.expect(penyewa: [ :nama, :alamat, :nomor_telepon, :identitas ])
    end
end
