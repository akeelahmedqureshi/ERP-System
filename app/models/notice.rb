class Notice < ApplicationRecord

  scope:expired_notices, ->{ where("created_at < ?", 10.days.ago) }

end
