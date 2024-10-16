class CreateProjectStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :project_statuses do |t|
      t.integer :status
      t.references :user, null: true, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
