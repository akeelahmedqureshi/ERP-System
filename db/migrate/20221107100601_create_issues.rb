class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.string :subject
      t.string :description
      t.string :priority
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
