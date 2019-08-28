class IndexingVisits < ActiveRecord::Migration[5.2]
  def change
    add_index :visits, :location
  end
end
