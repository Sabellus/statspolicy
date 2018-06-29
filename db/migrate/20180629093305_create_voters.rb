class CreateVoters < ActiveRecord::Migration[5.1]
  def change
    create_table :voters do |t|
      t.string :last_name
      t.string :sex
      t.integer :age

      t.timestamps
    end
  end
end
