class Applicant < ActiveRecord::Base
  has_many :interviews
  has_many :interviewers, through: :interviews

  def self.show_all_applicants
    p Applicant.all
  end

  def self.list_of_all_app_names
    Applicant.all.map(&:name)
  end
 
  def self.show_all_interviews_for_applicant
    puts "Please enter applicant name: "
    appl_name = gets.chomp().capitalize

    if list_of_all_app_names.include?(appl_name)
      p Applicant.find_by(name: appl_name)
    else
      puts "*" * 40
      puts "--- Applicant does not exist."
      puts "--- Please try again."
      puts "*" * 40
      show_all_interviews_for_applicant
    end
  end

  def self.find_applicant_by_name
    puts "Please enter applicant name: "
    appl_name = gets.chomp().capitalize

    if list_of_all_app_names.include?(appl_name)
      p Applicant.find_by(name: appl_name)
    else
      puts "*" * 40
      puts "--- Applicant does not exist."
      puts "--- Please try again."
      puts "*" * 40
      find_applicant_by_name
    end
  end

  def self.list_of_all_school_names
    Applicant.all.map(&:school)
  end

  def self.find_applicant_by_school
    puts "Please enter school name: "
    school_name = gets.chomp().titleize

    if list_of_all_school_names.include?(school_name)
      app = Applicant.where(school: school_name)
      p app.map(&:name)
    else
      puts "*" * 40
      puts "--- School does not exist."
      puts "--- Please try again."
      puts "*" * 40
      find_applicant_by_school
    end
  end

  def self.find_applicant_with_most_interviews
    array = []
    Applicant.all.each do |x|
      array.first || array << x
      if x.interviews.count > array.first.interviews.count
        array.clear
        array << x
      elsif x.interviews.count == array.first.interviews
        array << x
      end
    end
    array.each { |x| p x.name }
  end

  def self.find_applicant_with_rating_num(rating_num)
    result = Interview.where("rating >= ?", rating_num)
    appl_id_arr = result.map(&:applicant_id)
    appl= Applicant.find(appl_id_arr)
    p appl.map(&:name).uniq
  end
end