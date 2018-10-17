class RemoveLaporanFromDispositions < ActiveRecord::Migration
  def change
    remove_column :dispositions, :laporan, :string
  end
end
