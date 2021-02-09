class CreateKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :keywords do |t|
      t.string :user_id
      t.string :keyword_name

      t.timestamps
    end
    add_index :keywords, [:user_id, :keyword_name], unique: true

  end
end
