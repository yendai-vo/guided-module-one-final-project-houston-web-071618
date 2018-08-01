require_relative '../config/environment'

def greet
  option = false
  while (option == false)
    puts "------------------------------"
    puts " Welcome to Interview Tracker "
    puts "------------------------------"
    puts " "
    puts "Please enter number for the following options:"
    puts " 1. Find Applicant Information."
    puts " 2. Find Interviewer Information."
    puts " 3. Find Interview Information."
    user_input = gets.chomp()

    if user_input == "1"
      open_applicant_info
      option = true
    elsif user_input == "2"
      open_interviewer_info
      option = true
    elsif user_input == "3"
      open_interview_info
      option = true
    else
      puts "**************************"
    puts "--- Invalid Option #{user_input}."
    puts "--- Try Again."
      puts "**************************"
    end
  end #while
end#greeting

def open_applicant_info
  option = false
  while (option == false)
  puts "-"*40
  puts " Welcome to Applicant Information."
  puts " "
  puts "Please enter number for the following options:"
  puts "-"*40
  puts " 1. Show All Applicants."
  puts " 2. Find Applicant by name."
  puts " 3. Find Applicant by school."
  puts " 4. Find highest rated Applicant."
  puts " 5. Find Applicant with most interviews."
  puts " 6. Find Applicant(s) with rating greater than (your input)"
  user_input = gets.chomp()

  if user_input == "1"
    show_all_applicants
    option = true
  elsif user_input == "2"
    find_applicant_by_name
    option = true
  elsif user_input == "3"
    find_applicant_by_school
    option = true
  elsif user_input == "4"
    find_highest_rated_applicant
    option = true
  elsif user_input == "5"
    find_applicant_with_most_interviews
    option = true
  elsif user_input == "6"
    option_rating = false
    while (option_rating == false)
      puts "Please enter rating number range 1-10"
      rating_num = gets.chomp().to_i
      if rating_num >= 1 && rating_num <=10
        find_applicant_with_rating_num(rating_num)
            option = true
            option_rating = true
      else
        puts "*"*40
        puts "--- Invalid Option #{rating_num}."
        puts "--- Try Again."
        puts "*"*40
      end
    end #while
  else
    puts "*"*40
    puts "--- Invalid Option #{user_input}."
    puts "--- Try Again."
    puts "*"*40
  end
end #while
end

def open_interviewer_info
    option = false
  while (option == false)
    puts "-"*40
    puts " "
    puts " Welcome to Interviewer Information."
    puts " "
    puts "Please enter number for the following options:"
    puts "-"*40
    puts " 1. Show all interviewers."
    puts " 2. Find Interviewer by name."
    puts " 3. Find Interviewer by job title."
    puts " 4. Find Interviewer giving highest average rating."
    puts " 5. Find Interviewer giving lowest average rating."
    puts " 6. Find Interviewer conducting most interviews."
    user_input = gets.chomp()

    if user_input == "1"
      show_all_interviewers
      option = true
    elsif user_input == "2"
      find_interviewer_by_name
      option = true
    elsif user_input == "3"
        find_interviewer_by_job_title
        option = true
    elsif user_input == "4"
      find_interviewer_highest_avg_ranking
      option = true
    elsif user_input == "5"
      find_interviewer_lowest_avg_ranking
      option = true
    elsif user_input == "6"
      find_interviewer_conducting_most_interviews
      option = true
    else
      puts "*"*40
      puts "--- Invalid Option #{user_input}."
      puts "--- Try Again."
      puts "*"*40
    end
  end #while
end

def open_interview_info
  option = false
  while (option == false)
    puts "-"*40
    puts " Welcome to Interview Information."
    puts " "
    puts "Please enter number for the following options:"
    puts "-"*40
    puts " 1. Show all interviews."
    puts " 2. Show Interview(s) with rating greater than (your input)"
      user_input = gets.chomp()

    if user_input == "1"
      show_all_interviews
      option = true
    elsif user_input == "2"
      option_rating = false
      while (option_rating == false)
        puts "Please enter rating number range 1-10"
        rating_num = gets.chomp().to_i
        if rating_num >= 1 && rating_num <=10
          show_interviews_with_rating_num(rating_num)
                option = true
              option_rating = true
        else
          puts "--- Invalid Option #{rating_num}."
          puts "--- Try Again."
          puts "*"*40
        end
      end #while
    else
      puts "*"*40
      puts "--- Invalid Option #{user_input}."
      puts "*"*40
    end
  end #while
end

greet
