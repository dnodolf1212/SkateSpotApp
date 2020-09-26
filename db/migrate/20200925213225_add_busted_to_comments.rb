class AddBustedToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :busted, :boolean
  end
end
