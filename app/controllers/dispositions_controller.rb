class DispositionsController < ApplicationController
  before_action :set_disposition, only: [:show, :edit, :update, :destroy]

  # GET /dispositions
  # GET /dispositions.json
  def index
    if  current_user.role=='direksi' || current_user.role=='kadiv' || current_user.role=='admin'
      @dispositions = Disposition.where('penerima'=>current_user.username)

    elsif current_user.role=='sekretaris_direksi' || current_user.role=='admin'
      @dispositions = Disposition.where('penerima'=>CostCentre.find_by_kode(current_user.cost_centre_id).pejabat)

    else
      @dispositions = Disposition.all
    end
  end

  def history
    if  current_user.role=='direksi' || current_user.role=='kadiv' || current_user.role=='admin'
      @dispositions = Disposition.where('pemberi'=>current_user.username)
      @details = DispositionDetail.all
    elsif current_user.role=='sekretaris_direksi' || current_user.role=='admin'
      @dispositions = Disposition.where('pemberi'=>CostCentre.find_by_kode(current_user.cost_centre_id).pejabat)
      @details = DispositionDetail.all
    else
      @dispositions = Disposition.all
      @details = DispositionDetail.all
    end
    
  end
  # GET /dispositions/1
  # GET /dispositions/1.json
  def show
    @nomor = Disposition.find(params[:id]).nomor
    @detail = DispositionDetail.where("nomor"=>@nomor)
  end

  # GET /dispositions/new
  def new
    @disposition = Disposition.new
  end

  # GET /dispositions/1/edit
  def edit
  end

  # POST /dispositions
  # POST /dispositions.json
  def create
    @disposition = Disposition.new(disposition_params)


    respond_to do |format|
      if @disposition.save
        format.html { redirect_to @disposition, notice: 'Disposition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @disposition }
      else
        format.html { render action: 'new' }
        format.json { render json: @disposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispositions/1
  # PATCH/PUT /dispositions/1.json
  def update
    respond_to do |format|
      if @disposition.update(disposition_params)
        format.html { redirect_to @disposition, notice: 'Disposition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @disposition.errors, status: :unprocessable_entity }
      end
    endi
  end

  # DELETE /dispositions/1
  # DELETE /dispositions/1.json
  def destroy
    @disposition.destroy
    respond_to do |format|
      format.html { redirect_to dispositions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disposition
      @disposition = Disposition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disposition_params
      params.require(:disposition).permit(:nomor, :letter_id, :instruksi, :tgl, :status, :laporan, :penerima, :pemberi, :cost_centre_pemberi_id, :cost_centre_penerima_id)
    end
  end
end

