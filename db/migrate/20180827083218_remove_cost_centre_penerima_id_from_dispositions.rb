class RemoveCostCentrePenerimaIdFromDispositions < ActiveRecord::Migration
  def change
    remove_column :dispositions, :cost_centre_penerima_id, :integer
  end
end
