class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.string :subject
      t.string :description

      t.timestamps
    end
  end
end
