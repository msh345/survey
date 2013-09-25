class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |w|
      w.string  :word
      w.string :sorted
      w.timestamp
    end
  end
end
