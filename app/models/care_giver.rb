class CareGiver < ActiveRecord::Base
     has_secure_password
     has_many :daily_activities


end
