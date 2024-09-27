class ShiftSwapRequest < ApplicationRecord
  belongs_to :requesting_user
  belongs_to :requested_user
  belongs_to :shift
end
