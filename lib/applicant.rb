class Applicant < ActiveRecord::Base
  has_many :interviews
  has_many :interviewers, through: :interviews

  def self.show_all_applicants
    p Applicant.all
  end
 
  def self.show_all_interviews_for_applicant
    puts "Please enter applicant name: "
    appl_name = gets.chomp()
    p Interview.where(name: appl_name)  
  end

  def self.find_applicant_by_name
    puts "Please enter applicant name: "
    appl_name = gets.chomp()
    p Applicant.find_by(name: appl_name)
  end

  def self.find_applicant_by_school
    puts "Please enter school name: "
    school_name = gets.chomp()
    p Applicant.where(school: school_name)
  end

  # def self.find_highest_rated_applicant

  # end

  def self.find_applicant_with_most_interviews
    # scan through all interviews 
    # within each interview, pull out all applicant name
    # go thru applicant_name array and create a new hash for counter
    # make .each for hash counter
    # do hash.max_by{...}
    appl_arr = Interview.all.map(&:applicant_id)
    appl_hash = Hash.new(0)
    appl_arr.each do |x|
      appl_hash[x] += 1
    end
    appl_num = appl_hash.sort_by{ |k, v| v}
    
    # appl_num = appl_num[0]
    # p Applicant.find(appl_num)
  end

  def self.find_applicant_with_rating_num(rating_num)
  end

end
