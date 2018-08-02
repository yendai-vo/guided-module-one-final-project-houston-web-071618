class Applicant < ActiveRecord::Base
  has_many :interviews
  has_many :interviewers, through: :interviews

  def self.show_all_applicants
    p Applicant.all
  end
 
  def self.show_all_interviews_for_applicant
    puts "Please enter applicant name: "
    appl_name = gets.chomp().capitalize
    p Interview.where(name: appl_name)
  end

  def self.find_applicant_by_name
    puts "Please enter applicant name: "
    appl_name = gets.chomp().capitalize
    p Applicant.find_by(name: appl_name)
  end

  def self.find_applicant_by_school
    puts "Please enter school name: "
    school_name = gets.chomp().titleize
    p Applicant.where(school: school_name)
  end

  def self.find_applicant_with_most_interviews
    Applicant.all.reduce([Applicant.first]) do |most_interviewed_applicants, current_applicant|
      most_interviewed_applicant = most_interviewed_applicants.first
      if current_applicant.interviews.count > most_interviewed_applicant.interviews.count
        most_interviewed_applicants = [current_applicant]
      elsif current_applicant.interviews.count == most_interviewed_applicant.interviews.count
        most_interviewed_applicants << current_applicant
      end
      p most_interviewed_applicants
    end
  end

  def self.find_applicant_with_rating_num(rating_num)
    result = Interview.where("rating >= ?", rating_num)
    appl_id_arr = result.map(&:applicant_id)
    appl= Applicant.find(appl_id_arr)
    p appl.map(&:name).uniq
  end
end
