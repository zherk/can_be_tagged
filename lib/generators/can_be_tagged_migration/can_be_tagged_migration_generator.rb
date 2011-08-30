class CanBeTaggedMigrationGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(dirname) #:nodoc:
    next_migration_number = current_migration_number(dirname) + 1
    ActiveRecord::Migration.next_migration_number(next_migration_number)
  end
  
  def create_migration
    migration_template "tags_migration.rb", "db/migrate/create_tags.rb"
    migration_template "tag_lines_migration.rb", "db/migrate/create_tag_lines.rb"
  end
  
end
