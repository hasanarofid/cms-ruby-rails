# frozen_string_literal: true

class KasursController < ApplicationController
  before_action :set_kasur, only: %i[ show edit update destroy ]

  # GET /kasurs or /kasurs.json
  def index
    @kasurs = Kasur.all
  end

  # GET /kasurs/1 or /kasurs/1.json
  def show
  end

  # GET /kasurs/new
  def new
    @kasur = Kasur.new
  end

  # GET /kasurs/1/edit
  def edit
  end

  # POST /kasurs or /kasurs.json
  def create
    @kasur = Kasur.new(kasur_params)

    respond_to do |format|
      if @kasur.save
        format.html { redirect_to @kasur, notice: "Kasur was successfully created." }
        format.json { render :show, status: :created, location: @kasur }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kasur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kasurs/1 or /kasurs/1.json
  def update
    respond_to do |format|
      if @kasur.update(kasur_params)
        format.html { redirect_to @kasur, notice: "Kasur was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @kasur }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kasur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kasurs/1 or /kasurs/1.json
  def destroy
    @kasur.destroy!

    respond_to do |format|
      format.html { redirect_to kasurs_path, notice: "Kasur was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kasur
      @kasur = Kasur.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def kasur_params
      params.expect(kasur: [ :nama, :deskripsi, :harga_per_hari, :status ])
    end
end
