class AddDescriptionToOperations < ActiveRecord::Migration[5.1]
  def change
    add_column :operations, :description, :string
  end
end
