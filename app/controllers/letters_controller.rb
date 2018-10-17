class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit, :update, :destroy]

  # GET /letters
  # GET /letters.json
  def index

    if logged_in?
      @a = current_user.username

      if current_user.role =='dirut' || current_user.role =='direksi' || current_user.role =='kadiv'

        @letters = Letter.all.where('penerima'=>@a)

      else
             @letters = Letter.all
      end
    end
  end

  def index2

    if logged_in?
      @cs = current_user.cost_centre_id
      @pejabat = CostCentre.find_by_kode(@cs).pejabat


      if current_user.role == 'sekretaris_dirut' || current_user.role=='sekretaris_direksi' || current_user.role=='admin'
        @letters_masuk = Letter.where('penerima'=>@pejabat)
        @letters_keluar = Letter.where('pengirim'=>@pejabat)

      else
        @letter = Letter.all

      end
    end

  end

  # GET /letters/1
  # GET /letters/1.json
  def show
  end


  # GET /letters/new
  def new
    @letter = Letter.new
  end


  # GET /letters/1/edit
  def edit
  end

  # POST /letters
  # POST /letters.json
  def create()
    @letter = Letter.new(letter_params)
    @pejabat = CostCentre.find_by_kode(current_user.cost_centre_id).pejabat

    @letter.penerima = @pejabat

    if request.url=='new_letter_keluar'
      @letter.pengirim = CostCentre.find_by_kode(current_user.cost_centre_id).pejabat
    else
      @pen = CostCentre.find_by_kode(current_user.cost_centre_id).pejabat
      @letter.penerima = User.find_by_nama(@pen).email
      @letter.cost_centre_id = current_user.cost_centre_id
    end

    if(!params[:letter][:nama_file].nil?)
      uploaded_io = params[:letter][:nama_file]
      file_path = File.join('uploads/surat', Time.new.strftime("surat_%Y%m%d%H%M%S%L_" + uploaded_io.original_filename.gsub(/[^.a-zA-Z0-9_-]*/, '')))
      File.open(Rails.root.join('app/assets', file_path), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @letter.nama_file = file_path
    end

    respond_to do |format|
      if @letter.save

        # @us = User.find_by_nama(@letter.penerima)
        # UserMailer.inbox_email(@letter, @us).deliver_now
        #
        # if @letter.delegasi!=""
        #   @del = User.find_by_nama(@letter.delegasi)
        #
        # end

        format.html { redirect_to @letter, notice: 'Letter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @letter }
      else
        format.html { render action: 'new' }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /letters/1
  # PATCH/PUT /letters/1.json
  def update
    respond_to do |format|
      if @letter.update(letter_params)
        format.html { redirect_to @letter, notice: 'Letter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letters/1
  # DELETE /letters/1.json
  def destroy
    @letter.destroy
    respond_to do |format|
      format.html { redirect_to letters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter
      @letter = Letter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_params
      params.require(:letter).permit(:no_surat, :sifat, :jenis, :pengirim, :penerima, :asal_surat, :perihal, :tgl_surat, :tgl_terima, :cost_centre_id, :directorate_id, :nama_file, :status, :delegasi)
    end
end
