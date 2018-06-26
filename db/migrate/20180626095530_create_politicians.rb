class CreatePoliticians < ActiveRecord::Migration[5.1]
  def change
    create_table :politicians do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.belongs_to :territory, index: true
      t.timestamps
    end
  end
end
