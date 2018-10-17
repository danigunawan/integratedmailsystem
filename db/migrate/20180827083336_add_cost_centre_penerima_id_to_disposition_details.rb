class AddCostCentrePenerimaIdToDispositionDetails < ActiveRecord::Migration
  def change
    add_column :disposition_details, :cost_centre_penerima_id, :integer
  end
end
