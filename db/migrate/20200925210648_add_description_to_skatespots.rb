class AddDescriptionToSkatespots < ActiveRecord::Migration[6.0]
  def change
    add_column :skatespots, :description, :text
  end
end
