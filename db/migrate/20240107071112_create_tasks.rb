class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, limit: 30, null: false
      t.text :description
      t.timestamps
    end
  end
end
