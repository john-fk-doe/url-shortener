class AddLocationToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :location, :string
  end
end
