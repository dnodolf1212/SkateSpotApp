class AddNameToSkatespots < ActiveRecord::Migration[6.0]
  def change
    add_column :skatespots, :name, :string
  end
end
