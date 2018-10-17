class DispositionDetailsController < ApplicationController
  before_action :set_disposition_detail, only: [:show, :edit, :update, :destroy]

  # GET /disposition_details
  # GET /disposition_details.json
  def index
    @disposition_details = DispositionDetail.all
  end

  # GET /disposition_details/1
  # GET /disposition_details/1.json
  def show
  end

  # GET /disposition_details/new
  def new
    @disposition_detail = DispositionDetail.new
  end

  # GET /disposition_details/1/edit
  def edit
  end

  # POST /disposition_details
  # POST /disposition_details.json
  def create
    @disposition_detail = DispositionDetail.new(disposition_detail_params)

    respond_to do |format|
      if @disposition_detail.save
        format.html { redirect_to @disposition_detail, notice: 'Disposition detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @disposition_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @disposition_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disposition_details/1
  # PATCH/PUT /disposition_details/1.json
  def update
    respond_to do |format|
      if @disposition_detail.update(disposition_detail_params)
        format.html { redirect_to @disposition_detail, notice: 'Disposition detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @disposition_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disposition_details/1
  # DELETE /disposition_details/1.json
  def destroy
    @disposition_detail.destroy
    respond_to do |format|
      format.html { redirect_to disposition_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disposition_detail
      @disposition_detail = DispositionDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disposition_detail_params
      params.require(:disposition_detail).permit(:nomor, :penerima, :status, :laporan, :tgl_laporan)
    end
end
