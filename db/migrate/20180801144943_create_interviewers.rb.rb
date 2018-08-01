class CreateInterviewers < ActiveRecord::Migration[5.0]
  def change
    create_table :interviewers do |t|
      t.string :name
      t.string :job_title
    end
  end
end
