class CreateInterviewees < ActiveRecord::Migration[5.1]
  def change
    create_table :interviewees do |t|
      t.string :last_name
      t.string :age
      t.string :sex

      t.timestamps
    end
  end
end
