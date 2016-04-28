class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
