class IndexPeopleWorkExperience < ActiveRecord::Migration
  def up
    execute "CREATE INDEX people_work_experience ON people USING GIN(work_experience)"
  end

  def down
    execute "DROP INDEX people_work_experience"
  end
end
