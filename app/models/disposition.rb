class Disposition < ActiveRecord::Base
  # include ActiveModel::Model
  #
  # attr_accessor :nomor, :penerima
  #
  # def save
  #   return false if invalid?
  #
  #   ActiveRecord::Base.transaction do
  #     detail = DispositionDetail.create!(nomor: nomor, penerima: penerima)
  #   end
  #
  #   true
  # rescue ActiveRecord::StatementInvalid => e
  #   # Handle exception that caused the transaction to fail
  #   # e.message and e.cause.message can be helpful
  #   errors.add(:base, e.message)
  #
  #   false
  # end

  has_many :disposition_details
  belongs_to :letter
end
