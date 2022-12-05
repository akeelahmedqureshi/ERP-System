class Attendence < ApplicationRecord
  belongs_to :employee

  scope :monthwise_attendences, ->(date){ where("created_at >= ? AND created_at <=?", date.at_beginning_of_month, date.at_end_of_month) }

end
