class MydispositionsController < ApplicationController
  def index
    @dispositions = Array.new
    DispositionDetail.all.each do |dispo|
      if dispo.penerima==current_user.username
            @dispositions.push(Disposition.find_by_nomor(dispo.nomor))
      end
    end
  end

  # GET /dispositions/1
  # GET /dispositions/1.json
  def show
  end

  # GET /dispositions/new

  # GET /dispositions/1/edit

  # POST /dispositions
  # POST /dispositions.json

  # PATCH/PUT /dispositions/1
  # PATCH/PUT /dispositions/1.json

  # DELETE /dispositions/1
  # DELETE /dispositions/1.json
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