class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :short
      t.string :original

      t.timestamps
    end

    add_index :links, :short
  end
end
