class CreateApplicants < ActiveRecord::Migration[5.0]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :school
      t.integer :resume_rating
    end
  end
end
