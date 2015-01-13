class AddSubHeaderToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :subheader, :string
  end
end
