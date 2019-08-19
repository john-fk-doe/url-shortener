class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.references :link
      t.string :ip

      t.timestamps
    end
  end
end
