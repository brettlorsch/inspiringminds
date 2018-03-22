class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :question
      t.binary :answer

      t.timestamps
    end
  end
end
