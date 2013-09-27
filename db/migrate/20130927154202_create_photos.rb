class CreatePhotos < ActiveRecord::Migration
  def change
    create_table do :photos |t|
      t.string :file
    end
  end
end
