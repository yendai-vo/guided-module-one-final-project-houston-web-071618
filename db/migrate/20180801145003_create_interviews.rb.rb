class CreateInterviews < ActiveRecord::Migration[5.0]
  def change
    create_table :interviews do |t|
      t.belongs_to :applicant
      t.belongs_to :interviewer
      t.integer :rating
    end
  end
end
