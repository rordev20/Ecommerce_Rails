class Tax < ApplicationRecord
  belongs_to :sub_category
  belongs_to :country
end
