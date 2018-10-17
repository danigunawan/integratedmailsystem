class ChangeLetterIdTypeInDispositions < ActiveRecord::Migration
  def self.up
    change_column :dispositions, :letter_id , :string
  end

  def self.down
    change_column :dispositions, :letter_id, :integer
  end
end

