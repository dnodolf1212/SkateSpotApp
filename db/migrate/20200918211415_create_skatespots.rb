class CreateSkatespots < ActiveRecord::Migration[6.0]
  def change
    create_table :skatespots do |t|
      t.string :location
      t.string :nickname
      t.string :category

      t.timestamps
    end
  end
end
