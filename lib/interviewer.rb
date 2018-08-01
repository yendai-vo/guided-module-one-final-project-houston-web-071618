class Interviewer < ActiveRecord::Base
   has_many :applicants, through: :interviews
   has_many :interviews

end
