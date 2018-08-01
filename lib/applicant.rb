class Applicant < ActiveRecord::Base
  has_many :interviews
  has_many :interviewers, through: :interviews

  def show_all_applicants
  end

  #Need to ADD in runner file
  def show_all_interviews_for_applicant

  end #Need to ADD in runner file

  def find_applicant_by_name
    puts "Please enter applicant name: "
    name = gets.chomp()
    # Applicant.find_by(:name => "name")
  end

  def find_applicant_by_school
  end

  def find_highest_rated_applicant
  end

  def find_applicant_with_most_interviews
  end

  def find_applicant_with_rating_num(rating_num)
  end
end
