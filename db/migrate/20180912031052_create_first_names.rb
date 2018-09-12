class CreateFirstNames < ActiveRecord::Migration[5.2]
  def change
    create_table :first_names do |t|
      t.string :last_name
      t.string :email
      t.references :company, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
