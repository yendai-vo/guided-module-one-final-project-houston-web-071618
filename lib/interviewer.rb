class Interviewer < ActiveRecord::Base
  has_many :applicants, through: :interviews
  has_many :interviews

  def self.show_all_interviewers
    p Interviewer.all
  end

  def self.find_interviewer_by_name
    puts "Please enter interviewer's name: "
    int_name = gets.chomp().capitalize
    p Interviewer.find_by(name: int_name)
  end

  def self.find_interviewer_by_job_title
    puts "Please enter the job title: "
    int_job = gets.chomp().titleize
    int = Interviewer.where(job_title: int_job)
    p int.map(&:name)
  end

  def self.find_interviewer_avg_rating
    puts "Please enter interview's name: "
    int_name = gets.chomp().capitalize
    interviewer_instance = Interviewer.where(name: int_name)

    num = interviewer_instance.map(&:id).first
    int_arr = Interview.where(interviewer_id: num)
    rating_sum = int_arr.map(&:rating).reduce(:+)
    p average = rating_sum.to_f / int_arr.length
  end

    # Applicant.first.interviews.first.interviewer

  def self.find_interviewer_conducting_most_interviews
    Interviewer.all.reduce([Interviewer.first]) do |most_int_interviewers, current_interviewer|
      most_int_interviewer = most_int_interviewers.first
      if current_interviewer.interviews.count > most_int_interviewer.interviews.count
        most_int_interviewers = [current_interviewer]
      elsif current_interviewer.interviews.count == most_int_interviewer.interviews.count
        most_int_interviewers << current_interviewer
      end
      p most_int_interviewers
    end
  end
end


