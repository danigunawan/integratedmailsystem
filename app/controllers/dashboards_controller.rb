class DashboardsController < ApplicationController

  def index

    # Buat field penerima sama pengirim : username
    if CostCentre.find_by_kode(current_user.cost_centre_id)
        @pejabat = CostCentre.find_by_kode(current_user.cost_centre_id).pejabat

    else
      puts "Not Found"
    end

    @count_letter_masuk = 0
    @count_letter_keluar = 0
    @count_letter_status = 0
    @count_disposisi_masuk = 0
    @count_disposisi_status = 0

# NGITUNG SURAT2
    Letter.all.each do |letters|
      if current_user.role =='dirut' || current_user.role =='direksi' || current_user.role == 'kadiv' || current_user.role == 'manajer'

        if letters.penerima==current_user.username
          @count_letter_masuk +=1

          if letters.status == "NotRead"
            @count_letter_status +=1
          end

        end

        if letters.pengirim==current_user.username || letters.pengirim==current_user.username
          @count_letter_keluar +=1
        end

      elsif current_user.role =='sekretaris_dirut' || current_user.role =='sekretaris_direksi' || current_user.role =='admin'

        if letters.penerima==@pejabat
          @count_letter_masuk +=1

          if letters.status =="NotRead"
            @count_letter_status +=1
          end

        end

        if letters.pengirim==@pejabat || letters.pengirim==@pejabat
          @count_letter_keluar +=1
        end
      else
        @count_letter_masuk +=1
        if letters.status =="NotRead"
          @count_letter_status +=1
        end
        @count_letter_keluar +=1
      end
      end

# NGITUNG DISPOSISI

    Disposition.all.each do |dispo|
      if current_user.role =='direksi' || current_user.role == 'kadiv'
        if dispo.penerima==current_user.username || dispo.penerima==current_user.username
          @count_disposisi_masuk += 1
          if dispo.status=='NotRead'
            @count_disposisi_status+=1
          end
        end
      elsif current_user.role =='sekretaris_dirut' || current_user.role =='sekretaris_direksi' || current_user.role =='admin'

        if dispo.penerima==@pejabat || dispo.penerima == @pejabat
          @count_disposisi_masuk += 1
          if dispo.status=='NotRead'
            @count_disposisi_status+=1
          end
        end
      else
        @count_disposisi_masuk += 1
        if dispo.status=='NotRead'
          @count_disposisi_status+=1
        end
      end
    end

  end
  end
