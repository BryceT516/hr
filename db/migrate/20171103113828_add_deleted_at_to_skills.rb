class AddDeletedAtToSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :deleted_at, :datetime
  end
end
