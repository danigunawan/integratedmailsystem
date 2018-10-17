class RemovePenerimaFromDispositions < ActiveRecord::Migration
  def change
    remove_column :dispositions, :penerima, :string
  end
end
