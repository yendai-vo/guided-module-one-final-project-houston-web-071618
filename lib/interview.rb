class Interview < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :interviewer

  def self.show_all_interviews
    p Interview.all
  end

  def self.show_interviews_with_rating_num(rating_num)
    p Interview.where("rating >= ?", rating_num)
  end
end
