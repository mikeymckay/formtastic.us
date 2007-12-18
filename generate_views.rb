
view_spec = ""
t = ActiveRecord::Base.connection.tables
t.sort!
t.each { |table|
  unless table == 'schema_info' || table =~ /_view$/
    view_name = table.downcase
    view_name.gsub! "\s", "_"
    view_name.gsub! "[", ""
    view_name.gsub! "]", ""
    view_name = view_name << "_view"
   
    view_spec << "\nIF object_id('#{view_name}') IS NOT NULL"
    view_spec << "\n  DROP VIEW #{view_name}"
    view_spec << "\nGO"
    view_spec << "\n  CREATE VIEW #{view_name} AS"
    view_spec << "\n    SELECT"

    cols = ActiveRecord::Base.connection.columns(table)
    cols.each {|c|
      name = c.name
      name = "[" << name << "]" if name =~ /^\d/
      view_spec << "\n      " << name << " AS " << name.downcase << ","
    }

    view_spec.chop!
    view_spec << "\n    FROM dbo.#{table}"
    view_spec << "\nGO"
    view_spec << "\n"
 end
}

puts view_spec

