class DelegationsController < ApplicationController
  before_action :set_delegation, only: [:show, :edit, :update, :destroy]

  # GET /delegations
  # GET /delegations.json
  def index
    @pejabat = CostCentre.find_by_kode(current_user.cost_centre_id).pejabat
    @delegations = Delegation.where('pemberi'=>@pejabat)
  end

  # GET /delegations/1
  # GET /delegations/1.json
  def show
  end

  # GET /delegations/new
  def new
    @delegation = Delegation.new
  end

  # GET /delegations/1/edit
  def edit
  end

  # POST /delegations
  # POST /delegations.json
  def create
    @delegation = Delegation.new(delegation_params)

    @delegation.cost_centre_pemberi_id = CostCentre.find_by_kode(current_user.cost_centre_id).kode

    respond_to do |format|
      if @delegation.save
        format.html { redirect_to @delegation, notice: 'Delegation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @delegation }
      else
        format.html { render action: 'new' }
        format.json { render json: @delegation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delegations/1
  # PATCH/PUT /delegations/1.json
  def update
    respond_to do |format|
      if @delegation.update(delegation_params)
        format.html { redirect_to @delegation, notice: 'Delegation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @delegation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delegations/1
  # DELETE /delegations/1.json
  def destroy
    @delegation.destroy
    respond_to do |format|
      format.html { redirect_to delegations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delegation
      @delegation = Delegation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delegation_params
      params.require(:delegation).permit(:nomor, :mulai, :selesai, :pemberi, :cost_centre_pemberi_id, :penerima, :cost_centre_penerima_id, :keterangan)
    end
end
