class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :vote
      t.belongs_to :interview, index: true
      t.belongs_to :politician, index: true
      t.belongs_to :voter, index: true
      t.timestamps
    end
  end
end
