class Interviewer < ActiveRecord::Base
  has_many :applicants, through: :interviews
  has_many :interviews

  def self.show_all_interviewers
    p Interviewer.all
  end

  def self.list_of_all_int_names
    Interviewer.all.map(&:name)
  end

  def self.find_interviewer_by_name
    puts "Please enter interviewer's name: "
    int_name = gets.chomp().capitalize

    if list_of_all_int_names.include?(int_name)
      p Interviewer.find_by(name: int_name)
    else
      puts "*" * 40
      puts "--- Interviewer does not exist."
      puts "--- Please try again."
      puts "*" * 40
      find_interviewer_by_name
    end
  end

  def self.list_of_all_job_titles
    Interviewer.all.map(&:job_title)
  end

  def self.find_interviewer_by_job_title
    puts "Please enter the job title: "
    int_job = gets.chomp().titleize

    if list_of_all_job_titles.include?(int_job)
      int = Interviewer.where(job_title: int_job)
      p int.map(&:name)
    else
      puts "*" * 40
      puts "--- Applicant does not exist."
      puts "--- Please try again."
      puts "*" * 40
      find_interviewer_by_job_title
    end
  end

  def self.find_interviewer_avg_rating
    puts "Please enter interview's name: "
    int_name = gets.chomp().capitalize
    if list_of_all_int_names.include?(int_name)
      interviewer_instance = Interviewer.where(name: int_name)

      num = interviewer_instance.map(&:id).first
      int_arr = Interview.where(interviewer_id: num)
      rating_sum = int_arr.map(&:rating).reduce(:+)
      p average = rating_sum.to_f / int_arr.length
    else
      puts "*" * 40
      puts "--- Interviewer does not exist."
      puts "--- Please try again."
      puts "*" * 40
      find_interviewer_avg_rating
    end
  end

  def self.find_interviewer_with_most_interviews
    array = []
    Interviewer.all.each do |x|
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

end


