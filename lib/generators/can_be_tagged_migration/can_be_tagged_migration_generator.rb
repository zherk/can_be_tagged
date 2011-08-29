class CanBeTaggedMigrationGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  def create_migration
    generate("migration", "CreateTag name:string")
    generate("migration", "CreateTagLine tag_id:integer, tagged_id:integer, tagged_type:string")
  end
  
end
