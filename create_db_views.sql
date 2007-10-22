DROP VIEW IF EXISTS forms;
CREATE VIEW forms (id, name, version, build, published, description, encounter_type, schema_namespace, template, infopath_solution_version, uri, xslt, creator, date_created, changed_by, date_changed, retired, retired_by, date_retired, retired_reason) AS SELECT * FROM form;

DROP VIEW IF EXISTS fields;
CREATE VIEW fields (id, name, description, field_type, concept_id, table_name, attribute_name, default_value, select_multiple, creator, date_created, changed_by, date_changed ) AS SELECT * from field;

DROP VIEW IF EXISTS form_fields;
CREATE VIEW form_fields (id, form_id, field_id, field_number, field_part, page_number, parent_form_field, min_occurs, max_occurs, required, changed_by, date_changed, creator, date_created) AS SELECT * from form_field;

DROP VIEW IF EXISTS field_types;
CREATE VIEW field_types (id, name, description, is_set, creator, date_created) AS SELECT * from field_type;

CREATE TABLE `field_attribute_types` (
  `id` INT(11) NOT NULL auto_increment, 
  `name` varchar(255) NOT NULL, 
  `description` varchar (255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `field_attribute` (
  `id` INT(11) NOT NULL auto_increment, 
  `field_id` INT(11) DEFAULT NULL, 
  `form_field_id` INT(11) DEFAULT NULL, 
  `field_attribute_type_id` INT(11) NOT NULL, 
  `value` varchar (255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
