class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :ext
      t.string :loc

      t.timestamps
    end
  end
end
