class AddPhotosphereToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :photosphere, :string
  end
end
