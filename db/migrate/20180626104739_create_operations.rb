class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.string :name
      t.boolean :success, default: false
      t.belongs_to :politician, index: true
      t.timestamps
    end
  end
end
