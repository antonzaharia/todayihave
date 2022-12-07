class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :post_count

      t.timestamps
    end
  end
end
