class AddStarsCountToProjects < ActiveRecord::Migration[7.0]
  def up
    add_column :projects, :stars_count, :integer, default: 0, null: false

    Project.find_each do |project|
      Project.reset_counters(project.id, :stars)
    end
  end

  def down
    remove_column :projects, :stars_count
  end
end
