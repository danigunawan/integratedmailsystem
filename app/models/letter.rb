class Letter < ActiveRecord::Base
  has_one :disposition
  max_paginates_per 50


end
