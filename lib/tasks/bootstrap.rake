
DEFAULT_FIXTURES = ['global_property',
                    'privilege',
                    'role',
                    'role_privilege',
                    'role_role',
                    'users',
                    'user_role',
                    'encounter_type',
                    'relationship_type',
                    'order_type',
                    'patient_identifier_type',
                    'field_type',
                    'location',
                    'program',
                    'concept_answer',
                    'concept_class',
                    'concept_set',
                    'concept',
                    'drug',
                    'drug_barcodes',
                    'field',
                    'form_field',
                    'form']

namespace :db do
  namespace :bootstrap do
    desc "Load initial records (in db/data/*.yml) into the current database. Load specific fixtures using FIXTURES=x,y"
    task :load => :environment do
      require 'active_record/fixtures'
      ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
      puts "Disabling foreign keys" if ENV['KEYS'] == 'disabled'
      ActiveRecord::Base.connection.execute "SET FOREIGN_KEY_CHECKS = 0" if ENV['KEYS'] == 'disabled' 
      (ENV['FIXTURES'] ? ENV['FIXTURES'].split(/,/) : Dir.glob(File.join(RAILS_ROOT, 'db', 'data', '*.{yml}'))).each do |file|
        puts "Loading 'db/data/#{File.basename(file, '.*')}'"      
        Fixtures.create_fixtures('db/data', File.basename(file, '.*'))
      end
      ActiveRecord::Base.connection.execute "SET FOREIGN_KEY_CHECKS = 1" if ENV['KEYS'] == 'disabled' 
    end

    namespace :load do
      desc "Load initial default database records (in db/data/*.yml) into the current environment's database." 
      task :defaults => :environment do      
        ENV['KEYS'] = 'disabled'
        ENV['FIXTURES'] = DEFAULT_FIXTURES.join(',')
        Rake::Task["db:bootstrap:load"].execute
      end
    end
    
    desc "Create fixtures in db/data that can be used to initialize the database. Dump specific models using MODELS=x,y"    
    task :dump => :environment do
      ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
FIXTURE_CLASS = {   
                }
                   

      tables = (ENV['MODELS'] ? ENV['MODELS'].split(/,/) : ActiveRecord::Base.connection.tables) - ["schema_info"]
      tables.each {|table|            
        i = "0000"
        model = FIXTURE_CLASS[table] || table.pluralize.classify.constantize
        data = model.find(:all)       
        data.each {|r| 
          if ENV['CREATOR'] == 'reset'
            r.creator = 1 if r.has_attribute?('creator') 
            r.changed_by = 1 if r.has_attribute?('changed_by')
            r.updated_by = 1 if r.has_attribute?('updated_by')
          end  
        }
        File.open("#{RAILS_ROOT}/db/data/#{table}.yml", 'w') do |file|
          file.write data.inject({}) {|hash,r| 
            hash.merge("#{table}_#{i.succ!}" => r.attributes) 
          }.to_yaml         
        end  
      }
    end

    namespace :dump do
      desc "Create a default set of fixtures in db/data that can be portably used to initialize the database."    
      task :defaults => :environment do      
        ENV['MODELS'] = DEFAULT_FIXTURES.join(',')
        ENV['CREATOR'] = 'reset'
        Rake::Task["db:bootstrap:dump"].execute
      end
    end  
  end  
end	