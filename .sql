--------------------------------------------------------
--  File created - Thursday-June-29-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence DBOBJECTID_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."DBOBJECTID_SEQUENCE"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 50 START WITH 1 CACHE 50 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."DEPARTMENTS_SEQ"  MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."EMPLOYEES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 207 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence LOCATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."LOCATIONS_SEQ"  MINVALUE 1 MAXVALUE 9900 INCREMENT BY 100 START WITH 3300 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CATEGORIAS
--------------------------------------------------------

  CREATE TABLE "HR"."CATEGORIAS" 
   (	"ID_CATEGORIA" NUMBER(*,0), 
	"NOMBRE_CATEGORIA" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COUNTRIES
--------------------------------------------------------

  CREATE TABLE "HR"."COUNTRIES" SHARING=METADATA 
   (	"COUNTRY_ID" CHAR(2 BYTE), 
	"COUNTRY_NAME" VARCHAR2(40 BYTE), 
	"REGION_ID" NUMBER, 
	 CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 PCTTHRESHOLD 50;

   COMMENT ON COLUMN "HR"."COUNTRIES"."COUNTRY_ID" IS 'Primary key of countries table.';
   COMMENT ON COLUMN "HR"."COUNTRIES"."COUNTRY_NAME" IS 'Country name';
   COMMENT ON COLUMN "HR"."COUNTRIES"."REGION_ID" IS 'Region ID for the country. Foreign key to region_id column in the departments table.';
   COMMENT ON TABLE "HR"."COUNTRIES"  IS 'country table. Contains 25 rows. References with locations table.';
--------------------------------------------------------
--  DDL for Table DEPARTAMENTOS
--------------------------------------------------------

  CREATE TABLE "HR"."DEPARTAMENTOS" 
   (	"ID_DEPARTAMENTO" NUMBER(*,0), 
	"NOMBRE_DEPARTAMENTO" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "HR"."DEPARTMENTS" SHARING=METADATA 
   (	"DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(30 BYTE), 
	"MANAGER_ID" NUMBER(6,0), 
	"LOCATION_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."DEPARTMENTS"."DEPARTMENT_ID" IS 'Primary key column of departments table.';
   COMMENT ON COLUMN "HR"."DEPARTMENTS"."DEPARTMENT_NAME" IS 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ';
   COMMENT ON COLUMN "HR"."DEPARTMENTS"."MANAGER_ID" IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';
   COMMENT ON COLUMN "HR"."DEPARTMENTS"."LOCATION_ID" IS 'Location id where a department is located. Foreign key to location_id column of locations table.';
   COMMENT ON TABLE "HR"."DEPARTMENTS"  IS 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.';
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "HR"."EMPLOYEES" SHARING=METADATA 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(25 BYTE), 
	"EMAIL" VARCHAR2(25 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"HIRE_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."EMPLOYEES"."EMPLOYEE_ID" IS 'Primary key of employees table.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."FIRST_NAME" IS 'First name of the employee. A not null column.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."LAST_NAME" IS 'Last name of the employee. A not null column.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."EMAIL" IS 'Email id of the employee';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."PHONE_NUMBER" IS 'Phone number of the employee; includes country code and area code';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."HIRE_DATE" IS 'Date when the employee started on this job. A not null column.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."JOB_ID" IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."SALARY" IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."COMMISSION_PCT" IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."MANAGER_ID" IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."DEPARTMENT_ID" IS 'Department id where employee works; foreign key to department_id
column of the departments table';
   COMMENT ON TABLE "HR"."EMPLOYEES"  IS 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';
--------------------------------------------------------
--  DDL for Table EQUIPOS
--------------------------------------------------------

  CREATE TABLE "HR"."EQUIPOS" 
   (	"ID_EQUIPO" NUMBER(*,0), 
	"NOMBRE_EQUIPO" VARCHAR2(100 BYTE), 
	"DESCRIPCION" VARCHAR2(200 BYTE), 
	"NUM_SERIE" VARCHAR2(50 BYTE), 
	"CANTIDAD_DISPONIBLE" NUMBER(*,0), 
	"CATEGORIA" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table JOBS
--------------------------------------------------------

  CREATE TABLE "HR"."JOBS" SHARING=METADATA 
   (	"JOB_ID" VARCHAR2(10 BYTE), 
	"JOB_TITLE" VARCHAR2(35 BYTE), 
	"MIN_SALARY" NUMBER(6,0), 
	"MAX_SALARY" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."JOBS"."JOB_ID" IS 'Primary key of jobs table.';
   COMMENT ON COLUMN "HR"."JOBS"."JOB_TITLE" IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';
   COMMENT ON COLUMN "HR"."JOBS"."MIN_SALARY" IS 'Minimum salary for a job title.';
   COMMENT ON COLUMN "HR"."JOBS"."MAX_SALARY" IS 'Maximum salary for a job title';
   COMMENT ON TABLE "HR"."JOBS"  IS 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';
--------------------------------------------------------
--  DDL for Table JOB_HISTORY
--------------------------------------------------------

  CREATE TABLE "HR"."JOB_HISTORY" SHARING=METADATA 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."JOB_HISTORY"."EMPLOYEE_ID" IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table';
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."START_DATE" IS 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)';
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."END_DATE" IS 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)';
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."JOB_ID" IS 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.';
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."DEPARTMENT_ID" IS 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table';
   COMMENT ON TABLE "HR"."JOB_HISTORY"  IS 'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';
--------------------------------------------------------
--  DDL for Table LOCATIONS
--------------------------------------------------------

  CREATE TABLE "HR"."LOCATIONS" SHARING=METADATA 
   (	"LOCATION_ID" NUMBER(4,0), 
	"STREET_ADDRESS" VARCHAR2(40 BYTE), 
	"POSTAL_CODE" VARCHAR2(12 BYTE), 
	"CITY" VARCHAR2(30 BYTE), 
	"STATE_PROVINCE" VARCHAR2(25 BYTE), 
	"COUNTRY_ID" CHAR(2 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."LOCATIONS"."LOCATION_ID" IS 'Primary key of locations table';
   COMMENT ON COLUMN "HR"."LOCATIONS"."STREET_ADDRESS" IS 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';
   COMMENT ON COLUMN "HR"."LOCATIONS"."POSTAL_CODE" IS 'Postal code of the location of an office, warehouse, or production site
of a company. ';
   COMMENT ON COLUMN "HR"."LOCATIONS"."CITY" IS 'A not null column that shows city where an office, warehouse, or
production site of a company is located. ';
   COMMENT ON COLUMN "HR"."LOCATIONS"."STATE_PROVINCE" IS 'State or Province where an office, warehouse, or production site of a
company is located.';
   COMMENT ON COLUMN "HR"."LOCATIONS"."COUNTRY_ID" IS 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';
   COMMENT ON TABLE "HR"."LOCATIONS"  IS 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';
--------------------------------------------------------
--  DDL for Table MD_ADDITIONAL_PROPERTIES
--------------------------------------------------------

  CREATE TABLE "HR"."MD_ADDITIONAL_PROPERTIES" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"REF_ID_FK" NUMBER, 
	"REF_TYPE" VARCHAR2(4000 BYTE), 
	"PROPERTY_ORDER" NUMBER, 
	"PROP_KEY" VARCHAR2(4000 BYTE), 
	"VALUE" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_ADDITIONAL_PROPERTIES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_ADDITIONAL_PROPERTIES"."CONNECTION_ID_FK" IS 'Connection to which this belongs //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_ADDITIONAL_PROPERTIES"."REF_ID_FK" IS 'The object to which this property blongs';
   COMMENT ON COLUMN "HR"."MD_ADDITIONAL_PROPERTIES"."REF_TYPE" IS 'Type of object that this property belongs to';
   COMMENT ON COLUMN "HR"."MD_ADDITIONAL_PROPERTIES"."PROPERTY_ORDER" IS 'This is to handle a situation where multiple properties have a relevant order, or multiple properties have multiple values';
   COMMENT ON COLUMN "HR"."MD_ADDITIONAL_PROPERTIES"."PROP_KEY" IS 'The keyname for this property';
   COMMENT ON COLUMN "HR"."MD_ADDITIONAL_PROPERTIES"."VALUE" IS 'The value for this property';
   COMMENT ON TABLE "HR"."MD_ADDITIONAL_PROPERTIES"  IS 'This table is used to store additional properties in key-value pairs.  It is designed to store "other information" that is not supported in the main database object table.';
--------------------------------------------------------
--  DDL for Table MD_APPLICATIONFILES
--------------------------------------------------------

  CREATE TABLE "HR"."MD_APPLICATIONFILES" 
   (	"ID" NUMBER, 
	"APPLICATIONS_ID_FK" NUMBER, 
	"NAME" VARCHAR2(200 BYTE), 
	"URI" VARCHAR2(4000 BYTE), 
	"TYPE" VARCHAR2(100 BYTE), 
	"STATE" VARCHAR2(100 BYTE), 
	"LANGUAGE" VARCHAR2(100 BYTE), 
	"LOC" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(4000 BYTE), 
	"UPDATED_ON" DATE, 
	"UPDATED_BY" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_APPLICATIONFILES"."NAME" IS 'file name  //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONFILES"."URI" IS 'The uri is the part of the file url after the base dir has been removed.  See MD_APPLICATION for base dir';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONFILES"."TYPE" IS 'This will denote the type of file we have, including DIR, FILE (text), BINARY, IGNORE (where we choose to ignore files)';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONFILES"."STATE" IS 'State will be how this file is operated on.  For example. it will be OPEN, NEW, FIXED, IGNORED, REVIEWED, COMPLETE';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONFILES"."LANGUAGE" IS 'Language of the file that has been processed.';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONFILES"."SECURITY_GROUP_ID" IS 'APEX';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONFILES"."CREATED_ON" IS 'APEX';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONFILES"."CREATED_BY" IS 'APEX';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONFILES"."UPDATED_ON" IS 'APEX';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONFILES"."UPDATED_BY" IS 'APEX';
   COMMENT ON TABLE "HR"."MD_APPLICATIONFILES"  IS 'Holds a tuple for each file that is being processed whether it is changed or not.';
--------------------------------------------------------
--  DDL for Table MD_APPLICATIONS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_APPLICATIONS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"BASE_DIR" VARCHAR2(4000 BYTE), 
	"OUTPUT_DIR" VARCHAR2(4000 BYTE), 
	"BACKUP_DIR" VARCHAR2(4000 BYTE), 
	"INPLACE" NUMBER, 
	"PROJECT_ID_FK" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_APPLICATIONS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONS"."NAME" IS 'Name of the application suite  //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONS"."DESCRIPTION" IS 'Overview of what the application does.';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONS"."BASE_DIR" IS 'This is the base src directory for the application.  It could be an svn checkout, a clearcase view or something similar';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONS"."OUTPUT_DIR" IS 'This is the output directory where the scanner will present the converted files, if there are converted or modified.';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONS"."BACKUP_DIR" IS 'This is the directory in which the application files are backed up if a backp is chosen';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONS"."INPLACE" IS 'Designates whether the changes have been made inplace, in the source directory or not';
   COMMENT ON COLUMN "HR"."MD_APPLICATIONS"."PROJECT_ID_FK" IS 'project of the database(s) this application relates to';
   COMMENT ON TABLE "HR"."MD_APPLICATIONS"  IS 'This is the base table for application projects.  It holds the base information for applications associated with a database';
--------------------------------------------------------
--  DDL for Table MD_CATALOGS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_CATALOGS" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"CATALOG_NAME" VARCHAR2(4000 BYTE), 
	"DUMMY_FLAG" CHAR(1 BYTE) DEFAULT 'N', 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE ) ;

   COMMENT ON COLUMN "HR"."MD_CATALOGS"."CONNECTION_ID_FK" IS 'Foreign key into the connections table - Shows what connection this catalog belongs to //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_CATALOGS"."CATALOG_NAME" IS 'Name of the catalog //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_CATALOGS"."DUMMY_FLAG" IS 'Flag to show if this catalog is a "dummy" catalog which is used as a placeholder for those platforms that do not support catalogs.  ''N'' signifies that this is NOT a dummy catalog, while ''Y'' signifies that it is.';
   COMMENT ON COLUMN "HR"."MD_CATALOGS"."NATIVE_SQL" IS 'THe SQL used to create this catalog';
   COMMENT ON COLUMN "HR"."MD_CATALOGS"."NATIVE_KEY" IS 'A unique identifier used to identify the catalog at source.';
   COMMENT ON TABLE "HR"."MD_CATALOGS"  IS 'Store catalogs in this table.';
--------------------------------------------------------
--  DDL for Table MD_CODE_REGEX
--------------------------------------------------------

  CREATE TABLE "HR"."MD_CODE_REGEX" 
   (	"ID" NUMBER, 
	"REGEX" VARCHAR2(100 BYTE), 
	"DESCRIPTION" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_CODE_REGEX"."ID" IS 'ID of regex for searching source code';
   COMMENT ON COLUMN "HR"."MD_CODE_REGEX"."REGEX" IS 'Regex to use in reports of artifiacts in code.  This will be used for customers to analyze what is in their code.';
--------------------------------------------------------
--  DDL for Table MD_COLUMNS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_COLUMNS" 
   (	"ID" NUMBER, 
	"TABLE_ID_FK" NUMBER, 
	"COLUMN_NAME" VARCHAR2(4000 BYTE), 
	"COLUMN_ORDER" NUMBER, 
	"COLUMN_TYPE" VARCHAR2(4000 BYTE), 
	"PRECISION" NUMBER, 
	"SCALE" NUMBER, 
	"NULLABLE" CHAR(1 BYTE), 
	"DEFAULT_VALUE" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"DATATYPE_TRANSFORMED_FLAG" CHAR(1 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_COLUMNS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_COLUMNS"."TABLE_ID_FK" IS 'The table that this column is part of //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_COLUMNS"."COLUMN_NAME" IS 'The name of the column //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_COLUMNS"."COLUMN_ORDER" IS 'The order this appears in the table';
   COMMENT ON COLUMN "HR"."MD_COLUMNS"."COLUMN_TYPE" IS 'The type of the column';
   COMMENT ON COLUMN "HR"."MD_COLUMNS"."PRECISION" IS 'The precision on the column';
   COMMENT ON COLUMN "HR"."MD_COLUMNS"."SCALE" IS 'The scale of the column';
   COMMENT ON COLUMN "HR"."MD_COLUMNS"."NULLABLE" IS 'Yes or No.  Null signifies NO';
   COMMENT ON COLUMN "HR"."MD_COLUMNS"."DEFAULT_VALUE" IS 'Default value on the column';
   COMMENT ON COLUMN "HR"."MD_COLUMNS"."NATIVE_SQL" IS 'The SQL used to create this column at source';
   COMMENT ON COLUMN "HR"."MD_COLUMNS"."NATIVE_KEY" IS 'Unique identifier for this object at source';
   COMMENT ON COLUMN "HR"."MD_COLUMNS"."DATATYPE_TRANSFORMED_FLAG" IS 'This is set to ''Y'' to show if the data type was transformed.  This is useful so we don''t apply more than 1 datatype transformation to a column';
   COMMENT ON TABLE "HR"."MD_COLUMNS"  IS 'Column information is stored in this table.';
--------------------------------------------------------
--  DDL for Table MD_CONNECTIONS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_CONNECTIONS" 
   (	"ID" NUMBER, 
	"PROJECT_ID_FK" NUMBER, 
	"TYPE" VARCHAR2(4000 BYTE), 
	"HOST" VARCHAR2(4000 BYTE), 
	"PORT" NUMBER, 
	"USERNAME" VARCHAR2(4000 BYTE), 
	"PASSWORD" VARCHAR2(4000 BYTE), 
	"DBURL" VARCHAR2(4000 BYTE), 
	"NAME" VARCHAR2(255 BYTE), 
	"NATIVE_SQL" CLOB, 
	"STATUS" VARCHAR2(30 BYTE), 
	"NUM_CATALOGS" NUMBER, 
	"NUM_COLUMNS" NUMBER, 
	"NUM_CONSTRAINTS" NUMBER, 
	"NUM_GROUPS" NUMBER, 
	"NUM_ROLES" NUMBER, 
	"NUM_INDEXES" NUMBER, 
	"NUM_OTHER_OBJECTS" NUMBER, 
	"NUM_PACKAGES" NUMBER, 
	"NUM_PRIVILEGES" NUMBER, 
	"NUM_SCHEMAS" NUMBER, 
	"NUM_SEQUENCES" NUMBER, 
	"NUM_STORED_PROGRAMS" NUMBER, 
	"NUM_SYNONYMS" NUMBER, 
	"NUM_TABLES" NUMBER, 
	"NUM_TABLESPACES" NUMBER, 
	"NUM_TRIGGERS" NUMBER, 
	"NUM_USER_DEFINED_DATA_TYPES" NUMBER, 
	"NUM_USERS" NUMBER, 
	"NUM_VIEWS" NUMBER, 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_CONNECTIONS"."ID" IS 'Primary key';
   COMMENT ON COLUMN "HR"."MD_CONNECTIONS"."PROJECT_ID_FK" IS 'The project to which this connection belongs //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_CONNECTIONS"."TYPE" IS 'The type of the connection - For example it could be used to store "ORACLE" or "MYSQL"';
   COMMENT ON COLUMN "HR"."MD_CONNECTIONS"."HOST" IS 'The host to which this connection connects.';
   COMMENT ON COLUMN "HR"."MD_CONNECTIONS"."PORT" IS 'The port to which this connection connects';
   COMMENT ON COLUMN "HR"."MD_CONNECTIONS"."USERNAME" IS 'The username used to make the connection';
   COMMENT ON COLUMN "HR"."MD_CONNECTIONS"."PASSWORD" IS 'The password used to make this connection';
   COMMENT ON COLUMN "HR"."MD_CONNECTIONS"."DBURL" IS 'The database url used to make this connection';
   COMMENT ON COLUMN "HR"."MD_CONNECTIONS"."NAME" IS '//OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_CONNECTIONS"."NATIVE_SQL" IS 'The native sql used to create this connection';
   COMMENT ON COLUMN "HR"."MD_CONNECTIONS"."STATUS" IS 'Status of Migration, = captured,converted,generated,datamoved';
   COMMENT ON TABLE "HR"."MD_CONNECTIONS"  IS 'This table is used to store connection information.  For example, in migrations, we could be carrying out a consolidation which occurs across many connections.';
--------------------------------------------------------
--  DDL for Table MD_CONSTRAINTS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_CONSTRAINTS" 
   (	"ID" NUMBER, 
	"DELETE_CLAUSE" VARCHAR2(4000 BYTE), 
	"NAME" VARCHAR2(4000 BYTE), 
	"CONSTRAINT_TYPE" VARCHAR2(4000 BYTE), 
	"TABLE_ID_FK" NUMBER, 
	"REFTABLE_ID_FK" NUMBER, 
	"CONSTRAINT_TEXT" CLOB, 
	"LANGUAGE" VARCHAR2(40 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("CONSTRAINT_TEXT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_CONSTRAINTS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_CONSTRAINTS"."DELETE_CLAUSE" IS 'delete option , can be either CASCADE, RESTRICT or NULL';
   COMMENT ON COLUMN "HR"."MD_CONSTRAINTS"."NAME" IS 'Name of the constraint //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_CONSTRAINTS"."CONSTRAINT_TYPE" IS 'Type of the constraint (e.g. CHECK)';
   COMMENT ON COLUMN "HR"."MD_CONSTRAINTS"."TABLE_ID_FK" IS 'Table on which this constraint exists //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_CONSTRAINTS"."REFTABLE_ID_FK" IS 'Used in foreign keys - this gives the table that we refer to.';
   COMMENT ON COLUMN "HR"."MD_CONSTRAINTS"."CONSTRAINT_TEXT" IS 'The text of the constraint';
   COMMENT ON COLUMN "HR"."MD_CONSTRAINTS"."LANGUAGE" IS '//PUBLIC';
   COMMENT ON TABLE "HR"."MD_CONSTRAINTS"  IS 'Table for storing information about a constraint';
--------------------------------------------------------
--  DDL for Table MD_CONSTRAINT_DETAILS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_CONSTRAINT_DETAILS" 
   (	"ID" NUMBER, 
	"REF_FLAG" CHAR(1 BYTE) DEFAULT 'N', 
	"CONSTRAINT_ID_FK" NUMBER, 
	"COLUMN_ID_FK" NUMBER, 
	"COLUMN_PORTION" NUMBER, 
	"CONSTRAINT_TEXT" CLOB, 
	"DETAIL_ORDER" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("CONSTRAINT_TEXT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_CONSTRAINT_DETAILS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_CONSTRAINT_DETAILS"."REF_FLAG" IS '"N" or Null signify that this column is the colum that is used in the constraint.  A flag of Y signifies that the colum is a referenced column (i.e. part of a foreign key constraint)';
   COMMENT ON COLUMN "HR"."MD_CONSTRAINT_DETAILS"."CONSTRAINT_ID_FK" IS 'Constraint that this detail belongs to //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_CONSTRAINT_DETAILS"."COLUMN_PORTION" IS 'The portion of a column this detail belongs (e.g. for constrints on substrings)';
   COMMENT ON COLUMN "HR"."MD_CONSTRAINT_DETAILS"."CONSTRAINT_TEXT" IS 'The text of the constraint';
   COMMENT ON TABLE "HR"."MD_CONSTRAINT_DETAILS"  IS 'Constraint details show what columns are "involved" in a constraint.';
--------------------------------------------------------
--  DDL for Table MD_DERIVATIVES
--------------------------------------------------------

  CREATE TABLE "HR"."MD_DERIVATIVES" 
   (	"ID" NUMBER, 
	"SRC_ID" NUMBER, 
	"SRC_TYPE" VARCHAR2(4000 BYTE), 
	"DERIVED_ID" NUMBER, 
	"DERIVED_TYPE" VARCHAR2(4000 BYTE), 
	"DERIVED_CONNECTION_ID_FK" NUMBER, 
	"TRANSFORMED" CHAR(1 BYTE), 
	"ORIGINAL_IDENTIFIER" VARCHAR2(4000 BYTE), 
	"NEW_IDENTIFIER" VARCHAR2(4000 BYTE), 
	"DERIVED_OBJECT_NAMESPACE" VARCHAR2(40 BYTE), 
	"DERIVATIVE_REASON" VARCHAR2(10 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE), 
	"ENABLED" CHAR(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_DERIVATIVES"."TRANSFORMED" IS 'Set this field to ''Y'' if we carry out any sort of transformation on teh derived object.';
   COMMENT ON TABLE "HR"."MD_DERIVATIVES"  IS 'This table is used to store objects that are derived from each other.  For example in a migration an auto-increment column in a source model could be mapped to a primary key, and a sequence, and a trigger.  The MD_DERIVATIVES table would store the fact that these 3 objects are derived from the auto-increment column.';
--------------------------------------------------------
--  DDL for Table MD_FILE_ARTIFACTS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_FILE_ARTIFACTS" 
   (	"ID" NUMBER, 
	"APPLICATIONFILES_ID" NUMBER, 
	"PATTERN" VARCHAR2(4000 BYTE), 
	"STRING_FOUND" VARCHAR2(4000 BYTE), 
	"STRING_REPLACED" VARCHAR2(4000 BYTE), 
	"TYPE" VARCHAR2(200 BYTE), 
	"STATUS" VARCHAR2(4000 BYTE), 
	"LINE" NUMBER, 
	"PATTERN_START" NUMBER, 
	"PATTERN_END" NUMBER, 
	"DUE_DATE" DATE, 
	"DB_TYPE" VARCHAR2(100 BYTE), 
	"CODE_TYPE" VARCHAR2(1000 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"PRIORITY" NUMBER(*,0), 
	"SECURITY_GROUP_ID" VARCHAR2(20 BYTE) DEFAULT '0', 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(4000 BYTE), 
	"LAST_UPDATED" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_FILE_ARTIFACTS"."PATTERN" IS 'Pattern used to search source file for interesting artifiacts';
   COMMENT ON COLUMN "HR"."MD_FILE_ARTIFACTS"."STRING_FOUND" IS 'String found in source from the pattern supplied';
   COMMENT ON COLUMN "HR"."MD_FILE_ARTIFACTS"."STRING_REPLACED" IS 'This is the string which replace the string found if it was replaced.';
   COMMENT ON COLUMN "HR"."MD_FILE_ARTIFACTS"."TYPE" IS 'This is the type of the replacement.  It could be a straight replace from a replacement pattern, or we could have passed the string to a translator which would change the string depending on the database.';
   COMMENT ON COLUMN "HR"."MD_FILE_ARTIFACTS"."STATUS" IS 'Pattern used to search source file for interesting artifiacts';
   COMMENT ON COLUMN "HR"."MD_FILE_ARTIFACTS"."DUE_DATE" IS 'Due date is used by the TODO mechanism to manage the validation and work to complete this change';
   COMMENT ON COLUMN "HR"."MD_FILE_ARTIFACTS"."DB_TYPE" IS 'Source database calls type';
   COMMENT ON COLUMN "HR"."MD_FILE_ARTIFACTS"."CODE_TYPE" IS 'Source code db api, like dblib, jdbc';
   COMMENT ON COLUMN "HR"."MD_FILE_ARTIFACTS"."DESCRIPTION" IS 'This is a description of the artifact which will have a default generated by the scanner and then can be modified by the user to be more appropriate for their use';
   COMMENT ON COLUMN "HR"."MD_FILE_ARTIFACTS"."PRIORITY" IS 'The priority is set for the TODOs so they can be managed by the user';
   COMMENT ON TABLE "HR"."MD_FILE_ARTIFACTS"  IS 'Holds a tuple for each interesting thing the scanner finds in a file';
--------------------------------------------------------
--  DDL for Table MD_GROUPS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_GROUPS" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"GROUP_NAME" VARCHAR2(4000 BYTE), 
	"GROUP_FLAG" CHAR(1 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_GROUPS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_GROUPS"."SCHEMA_ID_FK" IS 'Schema in which this object belongs //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_GROUPS"."GROUP_NAME" IS 'Name of the group //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_GROUPS"."GROUP_FLAG" IS 'This is a flag to signify a group or a role.  If this is ''R'' it means the group is known as a Role.  Any other value means it is known as a group.';
   COMMENT ON COLUMN "HR"."MD_GROUPS"."NATIVE_SQL" IS 'SQL Used to generate this object at source';
   COMMENT ON COLUMN "HR"."MD_GROUPS"."NATIVE_KEY" IS 'Unique id for this object at source';
   COMMENT ON TABLE "HR"."MD_GROUPS"  IS 'Groups of users in a schema';
--------------------------------------------------------
--  DDL for Table MD_GROUP_MEMBERS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_GROUP_MEMBERS" 
   (	"ID" NUMBER, 
	"GROUP_ID_FK" NUMBER, 
	"USER_ID_FK" NUMBER, 
	"GROUP_MEMBER_ID_FK" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_GROUP_MEMBERS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_GROUP_MEMBERS"."USER_ID_FK" IS 'Id of member';
   COMMENT ON COLUMN "HR"."MD_GROUP_MEMBERS"."GROUP_MEMBER_ID_FK" IS 'groups can be members of groups';
   COMMENT ON TABLE "HR"."MD_GROUP_MEMBERS"  IS 'This table is used to store the members of a group.';
--------------------------------------------------------
--  DDL for Table MD_GROUP_PRIVILEGES
--------------------------------------------------------

  CREATE TABLE "HR"."MD_GROUP_PRIVILEGES" 
   (	"ID" NUMBER, 
	"GROUP_ID_FK" NUMBER, 
	"PRIVILEGE_ID_FK" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON TABLE "HR"."MD_GROUP_PRIVILEGES"  IS 'This table stores the privileges granted to a group (or role)';
--------------------------------------------------------
--  DDL for Table MD_INDEXES
--------------------------------------------------------

  CREATE TABLE "HR"."MD_INDEXES" 
   (	"ID" NUMBER, 
	"INDEX_TYPE" VARCHAR2(4000 BYTE), 
	"TABLE_ID_FK" NUMBER, 
	"INDEX_NAME" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_INDEXES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_INDEXES"."INDEX_TYPE" IS 'Type of the index e.g. PRIMARY';
   COMMENT ON COLUMN "HR"."MD_INDEXES"."TABLE_ID_FK" IS 'Table that this index is on //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_INDEXES"."INDEX_NAME" IS 'Name of the index //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_INDEXES"."NATIVE_SQL" IS 'SQL used to create the index at source';
   COMMENT ON COLUMN "HR"."MD_INDEXES"."NATIVE_KEY" IS 'A unique identifier for this object at the source';
   COMMENT ON TABLE "HR"."MD_INDEXES"  IS 'This table is used to store information about the indexes in a schema';
--------------------------------------------------------
--  DDL for Table MD_INDEX_DETAILS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_INDEX_DETAILS" 
   (	"ID" NUMBER, 
	"INDEX_ID_FK" NUMBER, 
	"COLUMN_ID_FK" NUMBER, 
	"INDEX_PORTION" NUMBER, 
	"DETAIL_ORDER" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_INDEX_DETAILS"."INDEX_ID_FK" IS 'The index to which this detail belongs. //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_INDEX_DETAILS"."INDEX_PORTION" IS 'To support indexing on part of a field';
   COMMENT ON TABLE "HR"."MD_INDEX_DETAILS"  IS 'This table stores the details of an index.  It shows what columns are "part" of the index.';
--------------------------------------------------------
--  DDL for Table MD_MIGR_DEPENDENCY
--------------------------------------------------------

  CREATE TABLE "HR"."MD_MIGR_DEPENDENCY" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"PARENT_ID" NUMBER, 
	"CHILD_ID" NUMBER, 
	"PARENT_OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"CHILD_OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_MIGR_DEPENDENCY"."CONNECTION_ID_FK" IS 'The connection that this exists in //PARENTFIELD';
--------------------------------------------------------
--  DDL for Table MD_MIGR_PARAMETER
--------------------------------------------------------

  CREATE TABLE "HR"."MD_MIGR_PARAMETER" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"OBJECT_ID" NUMBER, 
	"OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"PARAM_EXISTING" NUMBER, 
	"PARAM_ORDER" NUMBER, 
	"PARAM_NAME" VARCHAR2(4000 BYTE), 
	"PARAM_TYPE" VARCHAR2(4000 BYTE), 
	"PARAM_DATA_TYPE" VARCHAR2(4000 BYTE), 
	"PERCISION" NUMBER, 
	"SCALE" NUMBER, 
	"NULLABLE" CHAR(1 BYTE), 
	"DEFAULT_VALUE" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_MIGR_PARAMETER"."CONNECTION_ID_FK" IS 'the connection in which this belongs //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_MIGR_PARAMETER"."PARAM_EXISTING" IS '1 represents a new parameter for PL/SQL that was not present in the origional. 0 represents a n existing parameter that was present in the origional';
   COMMENT ON COLUMN "HR"."MD_MIGR_PARAMETER"."PARAM_ORDER" IS 'IF -1 THEN THIS PARAM IS A RETURN PARAMETER. 1 WILL BE THE FIRST PARAMETER IN THE PARAMETER LIST';
--------------------------------------------------------
--  DDL for Table MD_MIGR_WEAKDEP
--------------------------------------------------------

  CREATE TABLE "HR"."MD_MIGR_WEAKDEP" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"PARENT_ID" NUMBER, 
	"CHILD_NAME" VARCHAR2(4000 BYTE), 
	"PARENT_TYPE" VARCHAR2(4000 BYTE), 
	"CHILD_TYPE" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_MIGR_WEAKDEP"."CHILD_NAME" IS 'name of the child,  as weak dependencies dont have reference to child id';
   COMMENT ON COLUMN "HR"."MD_MIGR_WEAKDEP"."PARENT_TYPE" IS 'MD_<tablename>';
   COMMENT ON COLUMN "HR"."MD_MIGR_WEAKDEP"."CHILD_TYPE" IS 'Generic Type (not MD_<tablename>)';
--------------------------------------------------------
--  DDL for Table MD_NUMROW$SOURCE
--------------------------------------------------------

  CREATE TABLE "HR"."MD_NUMROW$SOURCE" 
   (	"NUMROWS" NUMBER(10,0), 
	"NAME" VARCHAR2(4000 BYTE), 
	"OBJID" NUMBER(10,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MD_NUMROW$TARGET
--------------------------------------------------------

  CREATE TABLE "HR"."MD_NUMROW$TARGET" 
   (	"NUMROWS" NUMBER(10,0), 
	"NAME" VARCHAR2(4000 BYTE), 
	"OBJID" NUMBER(10,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MD_OTHER_OBJECTS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_OTHER_OBJECTS" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_OTHER_OBJECTS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_OTHER_OBJECTS"."SCHEMA_ID_FK" IS 'Schema to which this object blongs. //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_OTHER_OBJECTS"."NAME" IS 'Name of this object //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_OTHER_OBJECTS"."NATIVE_SQL" IS 'The native SQL used to create this object';
   COMMENT ON COLUMN "HR"."MD_OTHER_OBJECTS"."NATIVE_KEY" IS 'A key that identifies this object at source.';
   COMMENT ON TABLE "HR"."MD_OTHER_OBJECTS"  IS 'For storing objects that don''''t belong anywhere else';
--------------------------------------------------------
--  DDL for Table MD_PACKAGES
--------------------------------------------------------

  CREATE TABLE "HR"."MD_PACKAGES" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"PACKAGE_HEADER" CLOB, 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"LANGUAGE" VARCHAR2(40 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("PACKAGE_HEADER") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_PACKAGES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_PACKAGES"."SCHEMA_ID_FK" IS 'the schema in which this package resides //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_PACKAGES"."NAME" IS 'Name of this package //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_PACKAGES"."NATIVE_SQL" IS 'The SQL used to create this package at source';
   COMMENT ON COLUMN "HR"."MD_PACKAGES"."NATIVE_KEY" IS 'A unique identifer for this object at source.';
   COMMENT ON COLUMN "HR"."MD_PACKAGES"."LANGUAGE" IS '//PUBLIC';
   COMMENT ON TABLE "HR"."MD_PACKAGES"  IS 'For storing packages';
--------------------------------------------------------
--  DDL for Table MD_PARTITIONS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_PARTITIONS" 
   (	"ID" NUMBER, 
	"TABLE_ID_FK" NUMBER, 
	"NATIVE_SQL" CLOB, 
	"PARTITION_EXPRESSION" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_PARTITIONS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_PARTITIONS"."TABLE_ID_FK" IS 'The table that this partition refers to //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_PARTITIONS"."NATIVE_SQL" IS 'The SQL used to create this partition at source';
   COMMENT ON COLUMN "HR"."MD_PARTITIONS"."PARTITION_EXPRESSION" IS 'The partition expression';
   COMMENT ON TABLE "HR"."MD_PARTITIONS"  IS 'Partition information is stored in this table.';
--------------------------------------------------------
--  DDL for Table MD_PRIVILEGES
--------------------------------------------------------

  CREATE TABLE "HR"."MD_PRIVILEGES" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"PRIVILEGE_NAME" VARCHAR2(4000 BYTE), 
	"PRIVELEGE_OBJECT_ID" NUMBER, 
	"PRIVELEGEOBJECTTYPE" VARCHAR2(4000 BYTE), 
	"PRIVELEGE_TYPE" VARCHAR2(4000 BYTE), 
	"ADMIN_OPTION" CHAR(1 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_PRIVILEGES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_PRIVILEGES"."SCHEMA_ID_FK" IS 'The schema to which this object belongs //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_PRIVILEGES"."PRIVILEGE_NAME" IS 'The name of the privilege //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_PRIVILEGES"."PRIVELEGE_OBJECT_ID" IS 'This references the table, view, etc on which the privelege exists.  This can be NULL for things like system wide privileges';
   COMMENT ON COLUMN "HR"."MD_PRIVILEGES"."PRIVELEGEOBJECTTYPE" IS 'The type the privelege is on (e.g. INDEX)';
   COMMENT ON COLUMN "HR"."MD_PRIVILEGES"."PRIVELEGE_TYPE" IS 'e.g.select';
   COMMENT ON COLUMN "HR"."MD_PRIVILEGES"."ADMIN_OPTION" IS 'Flag to show if this was granted with admin option.  ''Y'' means it was granted with admin option ''N'' means it was NOT granted with admin option.  NULL means not applicable (e.g. not known, not supported by source platform, etc.)';
   COMMENT ON COLUMN "HR"."MD_PRIVILEGES"."NATIVE_SQL" IS 'The SQL used to create this privilege at source';
   COMMENT ON COLUMN "HR"."MD_PRIVILEGES"."NATIVE_KEY" IS 'An identifier for this object at source.';
   COMMENT ON TABLE "HR"."MD_PRIVILEGES"  IS 'This table stores privilege information';
--------------------------------------------------------
--  DDL for Table MD_PROJECTS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_PROJECTS" 
   (	"ID" NUMBER, 
	"PROJECT_NAME" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_PROJECTS"."ID" IS 'Primary key';
   COMMENT ON COLUMN "HR"."MD_PROJECTS"."PROJECT_NAME" IS 'Name of the project //OBJECTNAME';
   COMMENT ON TABLE "HR"."MD_PROJECTS"  IS 'This is a top level container for a set of connections.';
--------------------------------------------------------
--  DDL for Table MD_REGISTRY
--------------------------------------------------------

  CREATE TABLE "HR"."MD_REGISTRY" 
   (	"OBJECT_TYPE" VARCHAR2(30 BYTE), 
	"OBJECT_NAME" VARCHAR2(30 BYTE), 
	"DESC_OBJECT_NAME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON TABLE "HR"."MD_REGISTRY"  IS 'Table to store information on the MD_ repository.  This lists the objects to be dropped if you wish to remove the repository';
--------------------------------------------------------
--  DDL for Table MD_REPOVERSIONS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_REPOVERSIONS" 
   (	"REVISION" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON TABLE "HR"."MD_REPOVERSIONS"  IS 'This table is used to version this schema for future requirements.';
--------------------------------------------------------
--  DDL for Table MD_SCHEMAS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_SCHEMAS" 
   (	"ID" NUMBER, 
	"CATALOG_ID_FK" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"TYPE" CHAR(1 BYTE), 
	"CHARACTER_SET" VARCHAR2(4000 BYTE), 
	"VERSION_TAG" VARCHAR2(40 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_SCHEMAS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_SCHEMAS"."CATALOG_ID_FK" IS 'Catalog to which this schema blongs //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_SCHEMAS"."NAME" IS 'Name of the schema //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_SCHEMAS"."TYPE" IS 'Type of this schema.  Eaxamples are ''CAPTURED'' OR ''CONVERTED''';
   COMMENT ON COLUMN "HR"."MD_SCHEMAS"."CHARACTER_SET" IS 'The characterset of this schema';
   COMMENT ON COLUMN "HR"."MD_SCHEMAS"."VERSION_TAG" IS 'A version string that can be used for tagging/baseling a schema';
   COMMENT ON COLUMN "HR"."MD_SCHEMAS"."NATIVE_SQL" IS 'The native SQL used to create this schema';
   COMMENT ON COLUMN "HR"."MD_SCHEMAS"."NATIVE_KEY" IS 'A unique identifier that this schema is known as in its source state.';
   COMMENT ON TABLE "HR"."MD_SCHEMAS"  IS 'This is the holder for schemas';
--------------------------------------------------------
--  DDL for Table MD_SEQUENCES
--------------------------------------------------------

  CREATE TABLE "HR"."MD_SEQUENCES" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"SEQ_START" NUMBER, 
	"INCR" NUMBER DEFAULT 1, 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE) DEFAULT '0', 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_SEQUENCES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_SEQUENCES"."SCHEMA_ID_FK" IS 'The schema to which this object belongs. //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_SEQUENCES"."NAME" IS 'Name of this sequence //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_SEQUENCES"."SEQ_START" IS 'Starting point of the sequence';
   COMMENT ON COLUMN "HR"."MD_SEQUENCES"."INCR" IS 'Increment value of the sequence';
   COMMENT ON COLUMN "HR"."MD_SEQUENCES"."NATIVE_SQL" IS 'SQL used to create this object at source';
   COMMENT ON COLUMN "HR"."MD_SEQUENCES"."NATIVE_KEY" IS 'Identifier for this object at source.';
   COMMENT ON TABLE "HR"."MD_SEQUENCES"  IS 'For storing information on sequences.';
--------------------------------------------------------
--  DDL for Table MD_STORED_PROGRAMS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_STORED_PROGRAMS" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"PROGRAMTYPE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(4000 BYTE), 
	"PACKAGE_ID_FK" NUMBER, 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"LANGUAGE" VARCHAR2(40 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"LINECOUNT" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_STORED_PROGRAMS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_STORED_PROGRAMS"."SCHEMA_ID_FK" IS 'Schema to which this object belongs.  Note that the PACKAGE_ID_FK (if present also leads us to the relevant schema), however a stored program may or may not belong in a package.  If it is in a package, then the SCHEMA_ID_FK and the SCHEME_ID_FK in the parent package should match //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_STORED_PROGRAMS"."PROGRAMTYPE" IS 'Java/TSQL/PLSQL, etc.';
   COMMENT ON COLUMN "HR"."MD_STORED_PROGRAMS"."NAME" IS 'Name of the stored program //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_STORED_PROGRAMS"."PACKAGE_ID_FK" IS 'The package to which this object belongs';
   COMMENT ON COLUMN "HR"."MD_STORED_PROGRAMS"."NATIVE_SQL" IS 'The SQL used to create this object at source';
   COMMENT ON COLUMN "HR"."MD_STORED_PROGRAMS"."NATIVE_KEY" IS 'A unique indetifier for this object at source';
   COMMENT ON COLUMN "HR"."MD_STORED_PROGRAMS"."LANGUAGE" IS '//PUBLIC';
   COMMENT ON TABLE "HR"."MD_STORED_PROGRAMS"  IS 'Container for stored programs.';
--------------------------------------------------------
--  DDL for Table MD_SYNONYMS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_SYNONYMS" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"SYNONYM_FOR_ID" NUMBER, 
	"FOR_OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"PRIVATE_VISIBILITY" CHAR(1 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_SYNONYMS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_SYNONYMS"."SCHEMA_ID_FK" IS 'The schema to which this object belongs //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_SYNONYMS"."NAME" IS 'Synonym name //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_SYNONYMS"."SYNONYM_FOR_ID" IS 'What object this is a synonym for';
   COMMENT ON COLUMN "HR"."MD_SYNONYMS"."FOR_OBJECT_TYPE" IS 'The type this is a synonym for (e.g. INDEX)';
   COMMENT ON COLUMN "HR"."MD_SYNONYMS"."PRIVATE_VISIBILITY" IS 'Visibility - Private or Public.  If Private_visibility = ''Y'' means this is a private synonym.  Anything else means it is a public synonym';
   COMMENT ON COLUMN "HR"."MD_SYNONYMS"."NATIVE_SQL" IS 'The SQL used to create this object at source';
   COMMENT ON COLUMN "HR"."MD_SYNONYMS"."NATIVE_KEY" IS 'An identifier for this object at source.';
   COMMENT ON TABLE "HR"."MD_SYNONYMS"  IS 'For storing synonym information.';
--------------------------------------------------------
--  DDL for Table MD_TABLES
--------------------------------------------------------

  CREATE TABLE "HR"."MD_TABLES" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"TABLE_NAME" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"QUALIFIED_NATIVE_NAME" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_TABLES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_TABLES"."SCHEMA_ID_FK" IS 'Schema in which this table resides //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_TABLES"."TABLE_NAME" IS 'Name of the table //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_TABLES"."NATIVE_SQL" IS 'SQL Used to create this table at soruce';
   COMMENT ON COLUMN "HR"."MD_TABLES"."NATIVE_KEY" IS 'Unique identifier for this table at source';
   COMMENT ON TABLE "HR"."MD_TABLES"  IS 'Table used to store information about tables.';
--------------------------------------------------------
--  DDL for Table MD_TABLESPACES
--------------------------------------------------------

  CREATE TABLE "HR"."MD_TABLESPACES" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"TABLESPACE_NAME" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE ) ;

   COMMENT ON COLUMN "HR"."MD_TABLESPACES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_TABLESPACES"."SCHEMA_ID_FK" IS 'Schema to which this tablespace belongs //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_TABLESPACES"."TABLESPACE_NAME" IS 'Name of the table space //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_TABLESPACES"."NATIVE_SQL" IS 'The SQL used to create this tablespace';
   COMMENT ON COLUMN "HR"."MD_TABLESPACES"."NATIVE_KEY" IS 'A unique identifier for this object at source';
   COMMENT ON TABLE "HR"."MD_TABLESPACES"  IS 'For storing information about tablespaces.';
--------------------------------------------------------
--  DDL for Table MD_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_TRIGGERS" 
   (	"ID" NUMBER, 
	"TABLE_OR_VIEW_ID_FK" NUMBER, 
	"TRIGGER_ON_FLAG" CHAR(1 BYTE), 
	"TRIGGER_NAME" VARCHAR2(4000 BYTE), 
	"TRIGGER_TIMING" VARCHAR2(4000 BYTE), 
	"TRIGGER_OPERATION" VARCHAR2(4000 BYTE), 
	"TRIGGER_EVENT" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"LANGUAGE" VARCHAR2(40 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"LINECOUNT" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_TRIGGERS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_TRIGGERS"."TABLE_OR_VIEW_ID_FK" IS 'Table on which this trigger fires';
   COMMENT ON COLUMN "HR"."MD_TRIGGERS"."TRIGGER_ON_FLAG" IS 'Flag to show iif the trigger is on a table or a view.  If it is a table this should be ''T''. If it is on a view this should be ''V''';
   COMMENT ON COLUMN "HR"."MD_TRIGGERS"."TRIGGER_NAME" IS 'Name of the trigger //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_TRIGGERS"."TRIGGER_TIMING" IS 'before, after ,etc.';
   COMMENT ON COLUMN "HR"."MD_TRIGGERS"."TRIGGER_OPERATION" IS 'insert, delete, etc.';
   COMMENT ON COLUMN "HR"."MD_TRIGGERS"."TRIGGER_EVENT" IS 'The actual trigger that gets fired ';
   COMMENT ON COLUMN "HR"."MD_TRIGGERS"."NATIVE_SQL" IS 'The full definition ';
   COMMENT ON COLUMN "HR"."MD_TRIGGERS"."NATIVE_KEY" IS 'UInique identifer for this object at source';
   COMMENT ON COLUMN "HR"."MD_TRIGGERS"."LANGUAGE" IS '//PUBLIC';
   COMMENT ON TABLE "HR"."MD_TRIGGERS"  IS 'For storing information about triggers.';
--------------------------------------------------------
--  DDL for Table MD_USERS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_USERS" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"USERNAME" VARCHAR2(4000 BYTE), 
	"PASSWORD" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE ) ;

   COMMENT ON COLUMN "HR"."MD_USERS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_USERS"."SCHEMA_ID_FK" IS 'Shema in which this object belongs //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_USERS"."USERNAME" IS 'Username for login //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_USERS"."PASSWORD" IS 'Password for login';
   COMMENT ON COLUMN "HR"."MD_USERS"."NATIVE_SQL" IS 'SQL Used to create this object at source';
   COMMENT ON COLUMN "HR"."MD_USERS"."NATIVE_KEY" IS 'Unique identifier for this object at source.';
   COMMENT ON TABLE "HR"."MD_USERS"  IS 'User information.';
--------------------------------------------------------
--  DDL for Table MD_USER_DEFINED_DATA_TYPES
--------------------------------------------------------

  CREATE TABLE "HR"."MD_USER_DEFINED_DATA_TYPES" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"DATA_TYPE_NAME" VARCHAR2(4000 BYTE), 
	"DEFINITION" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_USER_DEFINED_DATA_TYPES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_USER_DEFINED_DATA_TYPES"."SCHEMA_ID_FK" IS 'Schema to which this object blongs. //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_USER_DEFINED_DATA_TYPES"."DATA_TYPE_NAME" IS 'The name of the data type //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_USER_DEFINED_DATA_TYPES"."DEFINITION" IS 'The definition of the data type';
   COMMENT ON COLUMN "HR"."MD_USER_DEFINED_DATA_TYPES"."NATIVE_SQL" IS 'The native SQL used to create this object';
   COMMENT ON COLUMN "HR"."MD_USER_DEFINED_DATA_TYPES"."NATIVE_KEY" IS 'An unique identifier for this object at source.';
   COMMENT ON TABLE "HR"."MD_USER_DEFINED_DATA_TYPES"  IS 'For storing information on user defined data types.';
--------------------------------------------------------
--  DDL for Table MD_USER_PRIVILEGES
--------------------------------------------------------

  CREATE TABLE "HR"."MD_USER_PRIVILEGES" 
   (	"ID" NUMBER, 
	"USER_ID_FK" NUMBER, 
	"PRIVILEGE_ID_FK" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UDPATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MD_USER_PRIVILEGES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_USER_PRIVILEGES"."USER_ID_FK" IS 'User';
   COMMENT ON COLUMN "HR"."MD_USER_PRIVILEGES"."PRIVILEGE_ID_FK" IS 'Privilege';
   COMMENT ON TABLE "HR"."MD_USER_PRIVILEGES"  IS 'This table stores privileges granted to individual users';
--------------------------------------------------------
--  DDL for Table MD_VIEWS
--------------------------------------------------------

  CREATE TABLE "HR"."MD_VIEWS" 
   (	"ID" NUMBER, 
	"SCHEMA_ID_FK" NUMBER, 
	"VIEW_NAME" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"LANGUAGE" VARCHAR2(40 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"LINECOUNT" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "HR"."MD_VIEWS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MD_VIEWS"."SCHEMA_ID_FK" IS 'The schema to which this obect blongs. //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MD_VIEWS"."VIEW_NAME" IS 'The name of the view //OBJECTNAME';
   COMMENT ON COLUMN "HR"."MD_VIEWS"."NATIVE_SQL" IS 'The SQL used to create this object at source';
   COMMENT ON COLUMN "HR"."MD_VIEWS"."NATIVE_KEY" IS 'An identifier for this object at source.';
   COMMENT ON COLUMN "HR"."MD_VIEWS"."LANGUAGE" IS '//PUBLIC';
   COMMENT ON TABLE "HR"."MD_VIEWS"  IS 'For storing information on views.';
--------------------------------------------------------
--  DDL for Table MIGRLOG
--------------------------------------------------------

  CREATE TABLE "HR"."MIGRLOG" 
   (	"ID" NUMBER, 
	"PARENT_LOG_ID" NUMBER, 
	"LOG_DATE" TIMESTAMP (6), 
	"SEVERITY" NUMBER(4,0), 
	"LOGTEXT" VARCHAR2(4000 BYTE), 
	"PHASE" VARCHAR2(100 BYTE), 
	"REF_OBJECT_ID" NUMBER, 
	"REF_OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"CONNECTION_ID_FK" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MIGR_DATATYPE_TRANSFORM_MAP
--------------------------------------------------------

  CREATE TABLE "HR"."MIGR_DATATYPE_TRANSFORM_MAP" 
   (	"ID" NUMBER, 
	"PROJECT_ID_FK" NUMBER, 
	"MAP_NAME" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MIGR_DATATYPE_TRANSFORM_MAP"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MIGR_DATATYPE_TRANSFORM_MAP"."PROJECT_ID_FK" IS '//PARENTFIELD';
   COMMENT ON COLUMN "HR"."MIGR_DATATYPE_TRANSFORM_MAP"."MAP_NAME" IS 'A name for the map';
   COMMENT ON TABLE "HR"."MIGR_DATATYPE_TRANSFORM_MAP"  IS 'Table for storing data type maps.  A map is simply a collection of rules';
--------------------------------------------------------
--  DDL for Table MIGR_DATATYPE_TRANSFORM_RULE
--------------------------------------------------------

  CREATE TABLE "HR"."MIGR_DATATYPE_TRANSFORM_RULE" 
   (	"ID" NUMBER, 
	"MAP_ID_FK" NUMBER, 
	"SOURCE_DATA_TYPE_NAME" VARCHAR2(4000 BYTE), 
	"SOURCE_PRECISION" NUMBER, 
	"SOURCE_SCALE" NUMBER, 
	"TARGET_DATA_TYPE_NAME" VARCHAR2(4000 BYTE), 
	"TARGET_PRECISION" NUMBER, 
	"TARGET_SCALE" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MIGR_DATATYPE_TRANSFORM_RULE"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "HR"."MIGR_DATATYPE_TRANSFORM_RULE"."MAP_ID_FK" IS 'The map to which this rule belongs //PARENTFIELD';
   COMMENT ON COLUMN "HR"."MIGR_DATATYPE_TRANSFORM_RULE"."SOURCE_DATA_TYPE_NAME" IS 'Source data type';
   COMMENT ON COLUMN "HR"."MIGR_DATATYPE_TRANSFORM_RULE"."SOURCE_PRECISION" IS 'Precison to match';
   COMMENT ON COLUMN "HR"."MIGR_DATATYPE_TRANSFORM_RULE"."SOURCE_SCALE" IS 'scale to match';
   COMMENT ON COLUMN "HR"."MIGR_DATATYPE_TRANSFORM_RULE"."TARGET_DATA_TYPE_NAME" IS 'data type name to transform to';
   COMMENT ON COLUMN "HR"."MIGR_DATATYPE_TRANSFORM_RULE"."TARGET_PRECISION" IS 'precision to map to ';
   COMMENT ON COLUMN "HR"."MIGR_DATATYPE_TRANSFORM_RULE"."TARGET_SCALE" IS 'scale to map to';
--------------------------------------------------------
--  DDL for Table MIGR_GENERATION_ORDER
--------------------------------------------------------

  CREATE TABLE "HR"."MIGR_GENERATION_ORDER" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"OBJECT_ID" NUMBER, 
	"OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"GENERATION_ORDER" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."MIGR_GENERATION_ORDER"."CONNECTION_ID_FK" IS '//PARENTFIELD';
--------------------------------------------------------
--  DDL for Table PERMISOS
--------------------------------------------------------

  CREATE TABLE "HR"."PERMISOS" 
   (	"ID_PERMISOS" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"ID_ROL" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PERSONAL
--------------------------------------------------------

  CREATE TABLE "HR"."PERSONAL" 
   (	"ID_PERSONAL" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"TELEFONO" VARCHAR2(20 BYTE), 
	"CORREO" VARCHAR2(100 BYTE), 
	"ID_DEPARTAMENTO" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REGIONS
--------------------------------------------------------

  CREATE TABLE "HR"."REGIONS" SHARING=METADATA 
   (	"REGION_ID" NUMBER, 
	"REGION_NAME" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ROLES
--------------------------------------------------------

  CREATE TABLE "HR"."ROLES" 
   (	"ID_ROL" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"DESCRIPCION" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table STAGE_MIGRLOG
--------------------------------------------------------

  CREATE TABLE "HR"."STAGE_MIGRLOG" 
   (	"SVRID_FK" NUMBER, 
	"DBID_GEN_FK" NUMBER, 
	"ID" NUMBER, 
	"REF_OBJECT_ID" NUMBER, 
	"REF_OBJECT_TYPE" VARCHAR2(4000 BYTE), 
	"LOG_DATE" TIMESTAMP (6), 
	"SEVERITY" NUMBER(4,0), 
	"LOGTEXT" VARCHAR2(4000 BYTE), 
	"PHASE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View MGV_ALL_CATALOGS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."MGV_ALL_CATALOGS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "DBURL", "CATALOG_ID", "CATALOG_NAME") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name
  FROM md_projects ,
    md_connections,
    md_catalogs
  WHERE md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk   = md_projects.id
WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View MGV_ALL_CONNECTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."MGV_ALL_CONNECTIONS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "CONNECTION_NAME", "HOST", "PORT", "USERNAME", "DBURL") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    MD_CONNECTIONS.ID CONNECTION_ID ,
    MD_CONNECTIONS.NAME CONNECTION_NAME,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl
  FROM md_projects,
    md_connections
  WHERE MD_CONNECTIONS.PROJECT_ID_FK = MD_PROJECTS.ID
WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View MGV_ALL_SCHEMA
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."MGV_ALL_SCHEMA" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "SCHEMA_ID", "SCHEMA_NAME") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_projects
  WHERE md_schemas.catalog_id_fk   = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View MGV_ALL_STORED_PROGRAMS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."MGV_ALL_STORED_PROGRAMS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "SCHEMA_ID", "SCHEMA_NAME", "STORED_PROGRAM_ID", "PROGRAMTYPE", "STORED_PROGRAM_NAME", "PACKAGE_ID_FK") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name ,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_stored_programs.id stored_program_id ,
    md_stored_programs.programtype programtype ,
    md_stored_programs.name stored_program_name,
    md_stored_programs.package_id_fk package_id_fk
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_stored_programs
  WHERE md_stored_programs.schema_id_fk = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id
;
--------------------------------------------------------
--  DDL for View MGV_ALL_TABLES
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."MGV_ALL_TABLES" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "DBURL", "CATALOG_ID", "CATALOG_NAME", "SCHEMA_ID", "SCHEMA_NAME", "TABLE_ID", "TABLE_NAME") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_connections.dburl dburl ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME
  FROM md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_projects
  WHERE md_tables.schema_id_fk     = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View MGV_ALL_TABLE_TRIGGERS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."MGV_ALL_TABLE_TRIGGERS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "DUMMY_FLAG", "SCHEMA_ID", "SCHEMA_NAME", "TABLE_ID", "TABLE_NAME", "TRIGGER_ID", "TRIGGER_NAME") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_tables.id table_id ,
    md_tables.TABLE_NAME TABLE_NAME ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_tables ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_tables.id
  AND md_tables.schema_id_fk            = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id
;
--------------------------------------------------------
--  DDL for View MGV_ALL_VIEWS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."MGV_ALL_VIEWS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "DUMMY_FLAG", "SCHEMA_ID", "SCHEMA_NAME", "VIEW_ID", "VIEW_NAME") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views
  WHERE md_views.schema_id_fk      = md_schemas.id
  AND md_schemas.catalog_id_fk     = md_catalogs.id
  AND md_catalogs.connection_id_fk = md_connections.id
  AND md_connections.project_id_fk = md_projects.id
WITH READ ONLY;

   COMMENT ON TABLE "HR"."MGV_ALL_VIEWS"  IS 'View to iterate over all views in the system'
;
--------------------------------------------------------
--  DDL for View MGV_ALL_VIEW_TRIGGERS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."MGV_ALL_VIEW_TRIGGERS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "DUMMY_FLAG", "SCHEMA_ID", "SCHEMA_NAME", "VIEW_ID", "VIEW_NAME", "TRIGGER_ID", "TRIGGER_NAME") AS 
  SELECT md_projects.id project_id ,
    md_projects.project_name project_name,
    md_connections.id connection_id ,
    md_connections.host host ,
    md_connections.port port ,
    md_connections.username username ,
    md_catalogs.id catalog_id ,
    md_catalogs.catalog_name catalog_name,
    md_catalogs.dummy_flag dummy_flag ,
    md_schemas.id schema_id ,
    md_schemas.name schema_name ,
    md_views.id view_id ,
    md_views.view_name view_name ,
    md_triggers.id trigger_id ,
    md_triggers.trigger_name trigger_name
  FROM md_projects ,
    md_connections,
    md_catalogs ,
    md_schemas ,
    md_views ,
    md_triggers
  WHERE md_triggers.table_or_view_id_fk = md_views.id
  AND md_views.schema_id_fk             = md_schemas.id
  AND md_schemas.catalog_id_fk          = md_catalogs.id
  AND md_catalogs.connection_id_fk      = md_connections.id
  AND md_connections.project_id_fk      = md_projects.id
;
REM INSERTING into HR.CATEGORIAS
SET DEFINE OFF;
REM INSERTING into HR.COUNTRIES
SET DEFINE OFF;
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AR','Argentina',2);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AU','Australia',3);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BE','Belgium',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BR','Brazil',2);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CA','Canada',2);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CH','Switzerland',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CN','China',3);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DE','Germany',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DK','Denmark',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('EG','Egypt',4);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('FR','France',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IL','Israel',4);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IN','India',3);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IT','Italy',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('JP','Japan',3);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('KW','Kuwait',4);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ML','Malaysia',3);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('MX','Mexico',2);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NG','Nigeria',4);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NL','Netherlands',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('SG','Singapore',3);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('UK','United Kingdom',1);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('US','United States of America',2);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZM','Zambia',4);
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZW','Zimbabwe',4);
REM INSERTING into HR.DEPARTAMENTOS
SET DEFINE OFF;
REM INSERTING into HR.DEPARTMENTS
SET DEFINE OFF;
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (10,'Administration',200,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (20,'Marketing',201,1800);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (30,'Purchasing',114,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (40,'Human Resources',203,2400);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (50,'Shipping',121,1500);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (60,'IT',103,1400);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (70,'Public Relations',204,2700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (80,'Sales',145,2500);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (90,'Executive',100,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (100,'Finance',108,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (110,'Accounting',205,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (120,'Treasury',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (130,'Corporate Tax',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (140,'Control And Credit',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (150,'Shareholder Services',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (160,'Benefits',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (170,'Manufacturing',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (180,'Construction',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (190,'Contracting',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (200,'Operations',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (210,'IT Support',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (220,'NOC',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (230,'IT Helpdesk',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (240,'Government Sales',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (250,'Retail Sales',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (260,'Recruiting',null,1700);
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (270,'Payroll',null,1700);
REM INSERTING into HR.EMPLOYEES
SET DEFINE OFF;
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (100,'Steven','King','SKING','515.123.4567',to_date('17-JUN-03','DD-MON-RR'),'AD_PRES',24000,null,null,90);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (101,'Neena','Kochhar','NKOCHHAR','515.123.4568',to_date('21-SEP-05','DD-MON-RR'),'AD_VP',17000,null,100,90);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (102,'Lex','De Haan','LDEHAAN','515.123.4569',to_date('13-JAN-01','DD-MON-RR'),'AD_VP',17000,null,100,90);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (103,'Alexander','Hunold','AHUNOLD','590.423.4567',to_date('03-JAN-06','DD-MON-RR'),'IT_PROG',9000,null,102,60);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (104,'Bruce','Ernst','BERNST','590.423.4568',to_date('21-MAY-07','DD-MON-RR'),'IT_PROG',6000,null,103,60);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (105,'David','Austin','DAUSTIN','590.423.4569',to_date('25-JUN-05','DD-MON-RR'),'IT_PROG',4800,null,103,60);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (106,'Valli','Pataballa','VPATABAL','590.423.4560',to_date('05-FEB-06','DD-MON-RR'),'IT_PROG',4800,null,103,60);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (107,'Diana','Lorentz','DLORENTZ','590.423.5567',to_date('07-FEB-07','DD-MON-RR'),'IT_PROG',4200,null,103,60);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (108,'Nancy','Greenberg','NGREENBE','515.124.4569',to_date('17-AUG-02','DD-MON-RR'),'FI_MGR',12008,null,101,100);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (109,'Daniel','Faviet','DFAVIET','515.124.4169',to_date('16-AUG-02','DD-MON-RR'),'FI_ACCOUNT',9000,null,108,100);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (110,'John','Chen','JCHEN','515.124.4269',to_date('28-SEP-05','DD-MON-RR'),'FI_ACCOUNT',8200,null,108,100);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (111,'Ismael','Sciarra','ISCIARRA','515.124.4369',to_date('30-SEP-05','DD-MON-RR'),'FI_ACCOUNT',7700,null,108,100);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (112,'Jose Manuel','Urman','JMURMAN','515.124.4469',to_date('07-MAR-06','DD-MON-RR'),'FI_ACCOUNT',7800,null,108,100);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (113,'Luis','Popp','LPOPP','515.124.4567',to_date('07-DEC-07','DD-MON-RR'),'FI_ACCOUNT',6900,null,108,100);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (114,'Den','Raphaely','DRAPHEAL','515.127.4561',to_date('07-DEC-02','DD-MON-RR'),'PU_MAN',11000,null,100,30);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (115,'Alexander','Khoo','AKHOO','515.127.4562',to_date('18-MAY-03','DD-MON-RR'),'PU_CLERK',3100,null,114,30);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (116,'Shelli','Baida','SBAIDA','515.127.4563',to_date('24-DEC-05','DD-MON-RR'),'PU_CLERK',2900,null,114,30);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (117,'Sigal','Tobias','STOBIAS','515.127.4564',to_date('24-JUL-05','DD-MON-RR'),'PU_CLERK',2800,null,114,30);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (118,'Guy','Himuro','GHIMURO','515.127.4565',to_date('15-NOV-06','DD-MON-RR'),'PU_CLERK',2600,null,114,30);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (119,'Karen','Colmenares','KCOLMENA','515.127.4566',to_date('10-AUG-07','DD-MON-RR'),'PU_CLERK',2500,null,114,30);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (120,'Matthew','Weiss','MWEISS','650.123.1234',to_date('18-JUL-04','DD-MON-RR'),'ST_MAN',8000,null,100,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (121,'Adam','Fripp','AFRIPP','650.123.2234',to_date('10-APR-05','DD-MON-RR'),'ST_MAN',8200,null,100,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (122,'Payam','Kaufling','PKAUFLIN','650.123.3234',to_date('01-MAY-03','DD-MON-RR'),'ST_MAN',7900,null,100,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (123,'Shanta','Vollman','SVOLLMAN','650.123.4234',to_date('10-OCT-05','DD-MON-RR'),'ST_MAN',6500,null,100,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (124,'Kevin','Mourgos','KMOURGOS','650.123.5234',to_date('16-NOV-07','DD-MON-RR'),'ST_MAN',5800,null,100,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (125,'Julia','Nayer','JNAYER','650.124.1214',to_date('16-JUL-05','DD-MON-RR'),'ST_CLERK',3200,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (126,'Irene','Mikkilineni','IMIKKILI','650.124.1224',to_date('28-SEP-06','DD-MON-RR'),'ST_CLERK',2700,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (127,'James','Landry','JLANDRY','650.124.1334',to_date('14-JAN-07','DD-MON-RR'),'ST_CLERK',2400,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (128,'Steven','Markle','SMARKLE','650.124.1434',to_date('08-MAR-08','DD-MON-RR'),'ST_CLERK',2200,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (129,'Laura','Bissot','LBISSOT','650.124.5234',to_date('20-AUG-05','DD-MON-RR'),'ST_CLERK',3300,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (130,'Mozhe','Atkinson','MATKINSO','650.124.6234',to_date('30-OCT-05','DD-MON-RR'),'ST_CLERK',2800,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (131,'James','Marlow','JAMRLOW','650.124.7234',to_date('16-FEB-05','DD-MON-RR'),'ST_CLERK',2500,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (132,'TJ','Olson','TJOLSON','650.124.8234',to_date('10-APR-07','DD-MON-RR'),'ST_CLERK',2100,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (133,'Jason','Mallin','JMALLIN','650.127.1934',to_date('14-JUN-04','DD-MON-RR'),'ST_CLERK',3300,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (134,'Michael','Rogers','MROGERS','650.127.1834',to_date('26-AUG-06','DD-MON-RR'),'ST_CLERK',2900,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (135,'Ki','Gee','KGEE','650.127.1734',to_date('12-DEC-07','DD-MON-RR'),'ST_CLERK',2400,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (136,'Hazel','Philtanker','HPHILTAN','650.127.1634',to_date('06-FEB-08','DD-MON-RR'),'ST_CLERK',2200,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (137,'Renske','Ladwig','RLADWIG','650.121.1234',to_date('14-JUL-03','DD-MON-RR'),'ST_CLERK',3600,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (138,'Stephen','Stiles','SSTILES','650.121.2034',to_date('26-OCT-05','DD-MON-RR'),'ST_CLERK',3200,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (139,'John','Seo','JSEO','650.121.2019',to_date('12-FEB-06','DD-MON-RR'),'ST_CLERK',2700,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (140,'Joshua','Patel','JPATEL','650.121.1834',to_date('06-APR-06','DD-MON-RR'),'ST_CLERK',2500,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (141,'Trenna','Rajs','TRAJS','650.121.8009',to_date('17-OCT-03','DD-MON-RR'),'ST_CLERK',3500,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (142,'Curtis','Davies','CDAVIES','650.121.2994',to_date('29-JAN-05','DD-MON-RR'),'ST_CLERK',3100,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (143,'Randall','Matos','RMATOS','650.121.2874',to_date('15-MAR-06','DD-MON-RR'),'ST_CLERK',2600,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (144,'Peter','Vargas','PVARGAS','650.121.2004',to_date('09-JUL-06','DD-MON-RR'),'ST_CLERK',2500,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (145,'John','Russell','JRUSSEL','011.44.1344.429268',to_date('01-OCT-04','DD-MON-RR'),'SA_MAN',14000,0.4,100,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (146,'Karen','Partners','KPARTNER','011.44.1344.467268',to_date('05-JAN-05','DD-MON-RR'),'SA_MAN',13500,0.3,100,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278',to_date('10-MAR-05','DD-MON-RR'),'SA_MAN',12000,0.3,100,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268',to_date('15-OCT-07','DD-MON-RR'),'SA_MAN',11000,0.3,100,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',to_date('29-JAN-08','DD-MON-RR'),'SA_MAN',10500,0.2,100,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (150,'Peter','Tucker','PTUCKER','011.44.1344.129268',to_date('30-JAN-05','DD-MON-RR'),'SA_REP',10000,0.3,145,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (151,'David','Bernstein','DBERNSTE','011.44.1344.345268',to_date('24-MAR-05','DD-MON-RR'),'SA_REP',9500,0.25,145,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (152,'Peter','Hall','PHALL','011.44.1344.478968',to_date('20-AUG-05','DD-MON-RR'),'SA_REP',9000,0.25,145,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (153,'Christopher','Olsen','COLSEN','011.44.1344.498718',to_date('30-MAR-06','DD-MON-RR'),'SA_REP',8000,0.2,145,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668',to_date('09-DEC-06','DD-MON-RR'),'SA_REP',7500,0.2,145,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508',to_date('23-NOV-07','DD-MON-RR'),'SA_REP',7000,0.15,145,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (156,'Janette','King','JKING','011.44.1345.429268',to_date('30-JAN-04','DD-MON-RR'),'SA_REP',10000,0.35,146,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (157,'Patrick','Sully','PSULLY','011.44.1345.929268',to_date('04-MAR-04','DD-MON-RR'),'SA_REP',9500,0.35,146,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (158,'Allan','McEwen','AMCEWEN','011.44.1345.829268',to_date('01-AUG-04','DD-MON-RR'),'SA_REP',9000,0.35,146,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (159,'Lindsey','Smith','LSMITH','011.44.1345.729268',to_date('10-MAR-05','DD-MON-RR'),'SA_REP',8000,0.3,146,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (160,'Louise','Doran','LDORAN','011.44.1345.629268',to_date('15-DEC-05','DD-MON-RR'),'SA_REP',7500,0.3,146,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (161,'Sarath','Sewall','SSEWALL','011.44.1345.529268',to_date('03-NOV-06','DD-MON-RR'),'SA_REP',7000,0.25,146,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (162,'Clara','Vishney','CVISHNEY','011.44.1346.129268',to_date('11-NOV-05','DD-MON-RR'),'SA_REP',10500,0.25,147,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (163,'Danielle','Greene','DGREENE','011.44.1346.229268',to_date('19-MAR-07','DD-MON-RR'),'SA_REP',9500,0.15,147,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (164,'Mattea','Marvins','MMARVINS','011.44.1346.329268',to_date('24-JAN-08','DD-MON-RR'),'SA_REP',7200,0.1,147,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (165,'David','Lee','DLEE','011.44.1346.529268',to_date('23-FEB-08','DD-MON-RR'),'SA_REP',6800,0.1,147,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (166,'Sundar','Ande','SANDE','011.44.1346.629268',to_date('24-MAR-08','DD-MON-RR'),'SA_REP',6400,0.1,147,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (167,'Amit','Banda','ABANDA','011.44.1346.729268',to_date('21-APR-08','DD-MON-RR'),'SA_REP',6200,0.1,147,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (168,'Lisa','Ozer','LOZER','011.44.1343.929268',to_date('11-MAR-05','DD-MON-RR'),'SA_REP',11500,0.25,148,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (169,'Harrison','Bloom','HBLOOM','011.44.1343.829268',to_date('23-MAR-06','DD-MON-RR'),'SA_REP',10000,0.2,148,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (170,'Tayler','Fox','TFOX','011.44.1343.729268',to_date('24-JAN-06','DD-MON-RR'),'SA_REP',9600,0.2,148,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (171,'William','Smith','WSMITH','011.44.1343.629268',to_date('23-FEB-07','DD-MON-RR'),'SA_REP',7400,0.15,148,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (172,'Elizabeth','Bates','EBATES','011.44.1343.529268',to_date('24-MAR-07','DD-MON-RR'),'SA_REP',7300,0.15,148,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (173,'Sundita','Kumar','SKUMAR','011.44.1343.329268',to_date('21-APR-08','DD-MON-RR'),'SA_REP',6100,0.1,148,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (174,'Ellen','Abel','EABEL','011.44.1644.429267',to_date('11-MAY-04','DD-MON-RR'),'SA_REP',11000,0.3,149,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266',to_date('19-MAR-05','DD-MON-RR'),'SA_REP',8800,0.25,149,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265',to_date('24-MAR-06','DD-MON-RR'),'SA_REP',8600,0.2,149,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (177,'Jack','Livingston','JLIVINGS','011.44.1644.429264',to_date('23-APR-06','DD-MON-RR'),'SA_REP',8400,0.2,149,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (178,'Kimberely','Grant','KGRANT','011.44.1644.429263',to_date('24-MAY-07','DD-MON-RR'),'SA_REP',7000,0.15,149,null);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (179,'Charles','Johnson','CJOHNSON','011.44.1644.429262',to_date('04-JAN-08','DD-MON-RR'),'SA_REP',6200,0.1,149,80);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (180,'Winston','Taylor','WTAYLOR','650.507.9876',to_date('24-JAN-06','DD-MON-RR'),'SH_CLERK',3200,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (181,'Jean','Fleaur','JFLEAUR','650.507.9877',to_date('23-FEB-06','DD-MON-RR'),'SH_CLERK',3100,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (182,'Martha','Sullivan','MSULLIVA','650.507.9878',to_date('21-JUN-07','DD-MON-RR'),'SH_CLERK',2500,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (183,'Girard','Geoni','GGEONI','650.507.9879',to_date('03-FEB-08','DD-MON-RR'),'SH_CLERK',2800,null,120,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (184,'Nandita','Sarchand','NSARCHAN','650.509.1876',to_date('27-JAN-04','DD-MON-RR'),'SH_CLERK',4200,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (185,'Alexis','Bull','ABULL','650.509.2876',to_date('20-FEB-05','DD-MON-RR'),'SH_CLERK',4100,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (186,'Julia','Dellinger','JDELLING','650.509.3876',to_date('24-JUN-06','DD-MON-RR'),'SH_CLERK',3400,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (187,'Anthony','Cabrio','ACABRIO','650.509.4876',to_date('07-FEB-07','DD-MON-RR'),'SH_CLERK',3000,null,121,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (188,'Kelly','Chung','KCHUNG','650.505.1876',to_date('14-JUN-05','DD-MON-RR'),'SH_CLERK',3800,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (189,'Jennifer','Dilly','JDILLY','650.505.2876',to_date('13-AUG-05','DD-MON-RR'),'SH_CLERK',3600,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (190,'Timothy','Gates','TGATES','650.505.3876',to_date('11-JUL-06','DD-MON-RR'),'SH_CLERK',2900,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (191,'Randall','Perkins','RPERKINS','650.505.4876',to_date('19-DEC-07','DD-MON-RR'),'SH_CLERK',2500,null,122,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (192,'Sarah','Bell','SBELL','650.501.1876',to_date('04-FEB-04','DD-MON-RR'),'SH_CLERK',4000,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (193,'Britney','Everett','BEVERETT','650.501.2876',to_date('03-MAR-05','DD-MON-RR'),'SH_CLERK',3900,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (194,'Samuel','McCain','SMCCAIN','650.501.3876',to_date('01-JUL-06','DD-MON-RR'),'SH_CLERK',3200,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (195,'Vance','Jones','VJONES','650.501.4876',to_date('17-MAR-07','DD-MON-RR'),'SH_CLERK',2800,null,123,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (196,'Alana','Walsh','AWALSH','650.507.9811',to_date('24-APR-06','DD-MON-RR'),'SH_CLERK',3100,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (197,'Kevin','Feeney','KFEENEY','650.507.9822',to_date('23-MAY-06','DD-MON-RR'),'SH_CLERK',3000,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (198,'Donald','OConnell','DOCONNEL','650.507.9833',to_date('21-JUN-07','DD-MON-RR'),'SH_CLERK',2600,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (199,'Douglas','Grant','DGRANT','650.507.9844',to_date('13-JAN-08','DD-MON-RR'),'SH_CLERK',2600,null,124,50);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (200,'Jennifer','Whalen','JWHALEN','515.123.4444',to_date('17-SEP-03','DD-MON-RR'),'AD_ASST',4400,null,101,10);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (201,'Michael','Hartstein','MHARTSTE','515.123.5555',to_date('17-FEB-04','DD-MON-RR'),'MK_MAN',13000,null,100,20);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (202,'Pat','Fay','PFAY','603.123.6666',to_date('17-AUG-05','DD-MON-RR'),'MK_REP',6000,null,201,20);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (203,'Susan','Mavris','SMAVRIS','515.123.7777',to_date('07-JUN-02','DD-MON-RR'),'HR_REP',6500,null,101,40);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (204,'Hermann','Baer','HBAER','515.123.8888',to_date('07-JUN-02','DD-MON-RR'),'PR_REP',10000,null,101,70);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (205,'Shelley','Higgins','SHIGGINS','515.123.8080',to_date('07-JUN-02','DD-MON-RR'),'AC_MGR',12008,null,101,110);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (206,'William','Gietz','WGIETZ','515.123.8181',to_date('07-JUN-02','DD-MON-RR'),'AC_ACCOUNT',8300,null,205,110);
REM INSERTING into HR.EQUIPOS
SET DEFINE OFF;
REM INSERTING into HR.JOBS
SET DEFINE OFF;
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_PRES','President',20080,40000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_VP','Administration Vice President',15000,30000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_ASST','Administration Assistant',3000,6000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_MGR','Finance Manager',8200,16000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_ACCOUNT','Accountant',4200,9000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_MGR','Accounting Manager',8200,16000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_ACCOUNT','Public Accountant',4200,9000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_MAN','Sales Manager',10000,20080);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_REP','Sales Representative',6000,12008);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_MAN','Purchasing Manager',8000,15000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_CLERK','Purchasing Clerk',2500,5500);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_MAN','Stock Manager',5500,8500);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_CLERK','Stock Clerk',2008,5000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SH_CLERK','Shipping Clerk',2500,5500);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('IT_PROG','Programmer',4000,10000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_MAN','Marketing Manager',9000,15000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_REP','Marketing Representative',4000,9000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('HR_REP','Human Resources Representative',4000,9000);
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PR_REP','Public Relations Representative',4500,10500);
REM INSERTING into HR.JOB_HISTORY
SET DEFINE OFF;
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (102,to_date('13-JAN-01','DD-MON-RR'),to_date('24-JUL-06','DD-MON-RR'),'IT_PROG',60);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (101,to_date('21-SEP-97','DD-MON-RR'),to_date('27-OCT-01','DD-MON-RR'),'AC_ACCOUNT',110);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (101,to_date('28-OCT-01','DD-MON-RR'),to_date('15-MAR-05','DD-MON-RR'),'AC_MGR',110);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (201,to_date('17-FEB-04','DD-MON-RR'),to_date('19-DEC-07','DD-MON-RR'),'MK_REP',20);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (114,to_date('24-MAR-06','DD-MON-RR'),to_date('31-DEC-07','DD-MON-RR'),'ST_CLERK',50);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (122,to_date('01-JAN-07','DD-MON-RR'),to_date('31-DEC-07','DD-MON-RR'),'ST_CLERK',50);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (200,to_date('17-SEP-95','DD-MON-RR'),to_date('17-JUN-01','DD-MON-RR'),'AD_ASST',90);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (176,to_date('24-MAR-06','DD-MON-RR'),to_date('31-DEC-06','DD-MON-RR'),'SA_REP',80);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (176,to_date('01-JAN-07','DD-MON-RR'),to_date('31-DEC-07','DD-MON-RR'),'SA_MAN',80);
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (200,to_date('01-JUL-02','DD-MON-RR'),to_date('31-DEC-06','DD-MON-RR'),'AC_ACCOUNT',90);
REM INSERTING into HR.LOCATIONS
SET DEFINE OFF;
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1000,'1297 Via Cola di Rie','00989','Roma',null,'IT');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1100,'93091 Calle della Testa','10934','Venice',null,'IT');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1300,'9450 Kamiya-cho','6823','Hiroshima',null,'JP');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2000,'40-5-12 Laogianggen','190518','Beijing',null,'CN');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2300,'198 Clementi North','540198','Singapore',null,'SG');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2400,'8204 Arthur St',null,'London',null,'UK');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2800,'Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3000,'Murtenstrasse 921','3095','Bern','BE','CH');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
REM INSERTING into HR.MD_ADDITIONAL_PROPERTIES
SET DEFINE OFF;
REM INSERTING into HR.MD_APPLICATIONFILES
SET DEFINE OFF;
REM INSERTING into HR.MD_APPLICATIONS
SET DEFINE OFF;
REM INSERTING into HR.MD_CATALOGS
SET DEFINE OFF;
REM INSERTING into HR.MD_CODE_REGEX
SET DEFINE OFF;
Insert into HR.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values (1,'\#[A-Z1-9\@\#\_]','Temporary tables');
Insert into HR.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values (2,'INSERT','Insert statements');
Insert into HR.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values (3,'SELECT','Select statements');
Insert into HR.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values (4,'UPDATE','Update Statements');
Insert into HR.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values (5,'DELETE','Delete Statements');
REM INSERTING into HR.MD_COLUMNS
SET DEFINE OFF;
REM INSERTING into HR.MD_CONNECTIONS
SET DEFINE OFF;
REM INSERTING into HR.MD_CONSTRAINTS
SET DEFINE OFF;
REM INSERTING into HR.MD_CONSTRAINT_DETAILS
SET DEFINE OFF;
REM INSERTING into HR.MD_DERIVATIVES
SET DEFINE OFF;
REM INSERTING into HR.MD_FILE_ARTIFACTS
SET DEFINE OFF;
REM INSERTING into HR.MD_GROUPS
SET DEFINE OFF;
REM INSERTING into HR.MD_GROUP_MEMBERS
SET DEFINE OFF;
REM INSERTING into HR.MD_GROUP_PRIVILEGES
SET DEFINE OFF;
REM INSERTING into HR.MD_INDEXES
SET DEFINE OFF;
REM INSERTING into HR.MD_INDEX_DETAILS
SET DEFINE OFF;
REM INSERTING into HR.MD_MIGR_DEPENDENCY
SET DEFINE OFF;
REM INSERTING into HR.MD_MIGR_PARAMETER
SET DEFINE OFF;
REM INSERTING into HR.MD_MIGR_WEAKDEP
SET DEFINE OFF;
REM INSERTING into HR.MD_NUMROW$SOURCE
SET DEFINE OFF;
REM INSERTING into HR.MD_NUMROW$TARGET
SET DEFINE OFF;
REM INSERTING into HR.MD_OTHER_OBJECTS
SET DEFINE OFF;
REM INSERTING into HR.MD_PACKAGES
SET DEFINE OFF;
REM INSERTING into HR.MD_PARTITIONS
SET DEFINE OFF;
REM INSERTING into HR.MD_PRIVILEGES
SET DEFINE OFF;
REM INSERTING into HR.MD_PROJECTS
SET DEFINE OFF;
REM INSERTING into HR.MD_REGISTRY
SET DEFINE OFF;
REM INSERTING into HR.MD_REPOVERSIONS
SET DEFINE OFF;
REM INSERTING into HR.MD_SCHEMAS
SET DEFINE OFF;
REM INSERTING into HR.MD_SEQUENCES
SET DEFINE OFF;
REM INSERTING into HR.MD_STORED_PROGRAMS
SET DEFINE OFF;
REM INSERTING into HR.MD_SYNONYMS
SET DEFINE OFF;
REM INSERTING into HR.MD_TABLES
SET DEFINE OFF;
REM INSERTING into HR.MD_TABLESPACES
SET DEFINE OFF;
REM INSERTING into HR.MD_TRIGGERS
SET DEFINE OFF;
REM INSERTING into HR.MD_USERS
SET DEFINE OFF;
REM INSERTING into HR.MD_USER_DEFINED_DATA_TYPES
SET DEFINE OFF;
REM INSERTING into HR.MD_USER_PRIVILEGES
SET DEFINE OFF;
REM INSERTING into HR.MD_VIEWS
SET DEFINE OFF;
REM INSERTING into HR.MIGRLOG
SET DEFINE OFF;
REM INSERTING into HR.MIGR_DATATYPE_TRANSFORM_MAP
SET DEFINE OFF;
REM INSERTING into HR.MIGR_DATATYPE_TRANSFORM_RULE
SET DEFINE OFF;
REM INSERTING into HR.MIGR_GENERATION_ORDER
SET DEFINE OFF;
REM INSERTING into HR.PERMISOS
SET DEFINE OFF;
REM INSERTING into HR.PERSONAL
SET DEFINE OFF;
REM INSERTING into HR.REGIONS
SET DEFINE OFF;
Insert into HR.REGIONS (REGION_ID,REGION_NAME) values (1,'Europe');
Insert into HR.REGIONS (REGION_ID,REGION_NAME) values (2,'Americas');
Insert into HR.REGIONS (REGION_ID,REGION_NAME) values (3,'Asia');
Insert into HR.REGIONS (REGION_ID,REGION_NAME) values (4,'Middle East and Africa');
REM INSERTING into HR.ROLES
SET DEFINE OFF;
REM INSERTING into HR.STAGE_MIGRLOG
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index MIGR_GENERATION_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MIGR_GENERATION_ORDER_PK" ON "HR"."MIGR_GENERATION_ORDER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_DEPARTMENT_IX" ON "HR"."EMPLOYEES" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_PROJECTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_PROJECTS_PK" ON "HR"."MD_PROJECTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_FILE_ARTIFACTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_FILE_ARTIFACTS_PK" ON "HR"."MD_FILE_ARTIFACTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_TABLES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_TABLES_PK" ON "HR"."MD_TABLES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_APPLICATIONFILES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_APPLICATIONFILES_PK" ON "HR"."MD_APPLICATIONFILES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."DEPT_ID_PK" ON "HR"."DEPARTMENTS" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REG_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."REG_ID_PK" ON "HR"."REGIONS" ("REGION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_VIEWS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_VIEWS_PK" ON "HR"."MD_VIEWS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_TRIGGERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_TRIGGERS_PK" ON "HR"."MD_TRIGGERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_USER_DEFINED_DATA_TYPES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_USER_DEFINED_DATA_TYPES_PK" ON "HR"."MD_USER_DEFINED_DATA_TYPES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_GROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_GROUPS_PK" ON "HR"."MD_GROUPS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_INDEX_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_INDEX_DETAILS_PK" ON "HR"."MD_INDEX_DETAILS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_TABLESPACES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_TABLESPACES_PK" ON "HR"."MD_TABLESPACES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index STAGE_MIGRLOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."STAGE_MIGRLOG_PK" ON "HR"."STAGE_MIGRLOG" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_STATE_PROVINCE_IX
--------------------------------------------------------

  CREATE INDEX "HR"."LOC_STATE_PROVINCE_IX" ON "HR"."LOCATIONS" ("STATE_PROVINCE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_USERS_PK" ON "HR"."MD_USERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MIGRDREIVATIVES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MIGRDREIVATIVES_PK" ON "HR"."MD_DERIVATIVES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_REGISTRY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_REGISTRY_PK" ON "HR"."MD_REGISTRY" ("OBJECT_TYPE", "OBJECT_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_STORED_PROGRAMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_STORED_PROGRAMS_PK" ON "HR"."MD_STORED_PROGRAMS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MIGR_DEPENDENCY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MIGR_DEPENDENCY_PK" ON "HR"."MD_MIGR_DEPENDENCY" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_SEQUENCES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_SEQUENCES_PK" ON "HR"."MD_SEQUENCES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_OTHER_OBJECTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_OTHER_OBJECTS_PK" ON "HR"."MD_OTHER_OBJECTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_NAME_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_NAME_IX" ON "HR"."EMPLOYEES" ("LAST_NAME", "FIRST_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_CATALOGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_CATALOGS_PK" ON "HR"."MD_CATALOGS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MIGR_DATATYPE_TRANSFORM_R_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MIGR_DATATYPE_TRANSFORM_R_PK" ON "HR"."MIGR_DATATYPE_TRANSFORM_RULE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_CONSTRAINT_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_CONSTRAINT_DETAILS_PK" ON "HR"."MD_CONSTRAINT_DETAILS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."LOC_ID_PK" ON "HR"."LOCATIONS" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_CONSTRAINTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_CONSTRAINTS_PK" ON "HR"."MD_CONSTRAINTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_APP_FILE_TYPE_IDX
--------------------------------------------------------

  CREATE INDEX "HR"."MD_APP_FILE_TYPE_IDX" ON "HR"."MD_APPLICATIONFILES" ("TYPE", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_SYNONYMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_SYNONYMS_PK" ON "HR"."MD_SYNONYMS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MIGR_DATATYPE_TRANSFORM_M_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MIGR_DATATYPE_TRANSFORM_M_PK" ON "HR"."MIGR_DATATYPE_TRANSFORM_MAP" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_EMP_ID_ST_DATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."JHIST_EMP_ID_ST_DATE_PK" ON "HR"."JOB_HISTORY" ("EMPLOYEE_ID", "START_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MIGR_GENERATION_ORDER_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MIGR_GENERATION_ORDER_UK" ON "HR"."MIGR_GENERATION_ORDER" ("OBJECT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_INDEXES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_INDEXES_PK" ON "HR"."MD_INDEXES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_SCHEMAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_SCHEMAS_PK" ON "HR"."MD_SCHEMAS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_STATE_TYPE__ID
--------------------------------------------------------

  CREATE INDEX "HR"."MD_STATE_TYPE__ID" ON "HR"."MD_APPLICATIONFILES" ("STATE", "TYPE", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_GROUP_PRIVILEGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_GROUP_PRIVILEGES_PK" ON "HR"."MD_GROUP_PRIVILEGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MIGR_PARAMETER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MIGR_PARAMETER_PK" ON "HR"."MD_MIGR_PARAMETER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_PRIVILEGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_PRIVILEGES_PK" ON "HR"."MD_PRIVILEGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_JOB_IX
--------------------------------------------------------

  CREATE INDEX "HR"."JHIST_JOB_IX" ON "HR"."JOB_HISTORY" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JOB_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."JOB_ID_PK" ON "HR"."JOBS" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_COLUMNS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_COLUMNS_PK" ON "HR"."MD_COLUMNS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPT_LOCATION_IX
--------------------------------------------------------

  CREATE INDEX "HR"."DEPT_LOCATION_IX" ON "HR"."DEPARTMENTS" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_EMPLOYEE_IX
--------------------------------------------------------

  CREATE INDEX "HR"."JHIST_EMPLOYEE_IX" ON "HR"."JOB_HISTORY" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_PACKAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_PACKAGES_PK" ON "HR"."MD_PACKAGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "HR"."JHIST_DEPARTMENT_IX" ON "HR"."JOB_HISTORY" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_PARTITIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_PARTITIONS_PK" ON "HR"."MD_PARTITIONS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COUNTRY_C_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."COUNTRY_C_ID_PK" ON "HR"."COUNTRIES" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_COUNTRY_IX
--------------------------------------------------------

  CREATE INDEX "HR"."LOC_COUNTRY_IX" ON "HR"."LOCATIONS" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_GROUP_MEMBERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_GROUP_MEMBERS_PK" ON "HR"."MD_GROUP_MEMBERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_MANAGER_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_MANAGER_IX" ON "HR"."EMPLOYEES" ("MANAGER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_APPLICATIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_APPLICATIONS_PK" ON "HR"."MD_APPLICATIONS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_USER_PRIVILEGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_USER_PRIVILEGES_PK" ON "HR"."MD_USER_PRIVILEGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_EMP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMP_EMP_ID_PK" ON "HR"."EMPLOYEES" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_ADDITIONAL_PROPERTIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_ADDITIONAL_PROPERTIES_PK" ON "HR"."MD_ADDITIONAL_PROPERTIES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_EMAIL_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMP_EMAIL_UK" ON "HR"."EMPLOYEES" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MIGRLOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MIGRLOG_PK" ON "HR"."MIGRLOG" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MIGR_WEAKDEP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MIGR_WEAKDEP_PK" ON "HR"."MD_MIGR_WEAKDEP" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_JOB_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_JOB_IX" ON "HR"."EMPLOYEES" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_CITY_IX
--------------------------------------------------------

  CREATE INDEX "HR"."LOC_CITY_IX" ON "HR"."LOCATIONS" ("CITY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MD_CONNECTIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MD_CONNECTIONS_PK" ON "HR"."MD_CONNECTIONS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger SECURE_EMPLOYEES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "HR"."SECURE_EMPLOYEES" 
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;
/
ALTER TRIGGER "HR"."SECURE_EMPLOYEES" DISABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_JOB_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "HR"."UPDATE_JOB_HISTORY" 
  AFTER UPDATE OF job_id, department_id ON employees
  FOR EACH ROW
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END;
/
ALTER TRIGGER "HR"."UPDATE_JOB_HISTORY" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HR"."ADD_JOB_HISTORY" 
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;

/
--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HR"."SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/
--------------------------------------------------------
--  Constraints for Table STAGE_MIGRLOG
--------------------------------------------------------

  ALTER TABLE "HR"."STAGE_MIGRLOG" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."STAGE_MIGRLOG" MODIFY ("LOG_DATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."STAGE_MIGRLOG" MODIFY ("SEVERITY" NOT NULL ENABLE);
  ALTER TABLE "HR"."STAGE_MIGRLOG" ADD CONSTRAINT "STAGE_MIGRLOG_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MIGR_DATATYPE_TRANSFORM_RULE
--------------------------------------------------------

  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("MAP_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("SOURCE_DATA_TYPE_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("TARGET_DATA_TYPE_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_RULE" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_R_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_STORED_PROGRAMS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_STORED_PROGRAMS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_STORED_PROGRAMS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_STORED_PROGRAMS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_STORED_PROGRAMS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_STORED_PROGRAMS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_STORED_PROGRAMS" ADD CONSTRAINT "MD_STORED_PROGRAMS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_TRIGGERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TRIGGERS" MODIFY ("TABLE_OR_VIEW_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TRIGGERS" MODIFY ("TRIGGER_ON_FLAG" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TRIGGERS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TRIGGERS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TRIGGERS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TRIGGERS" ADD CONSTRAINT "MD_TRIGGERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REGIONS
--------------------------------------------------------

  ALTER TABLE "HR"."REGIONS" MODIFY ("REGION_ID" CONSTRAINT "REGION_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."REGIONS" ADD CONSTRAINT "REG_ID_PK" PRIMARY KEY ("REGION_ID")
  USING INDEX "HR"."REG_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_CATALOGS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_CATALOGS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CATALOGS" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CATALOGS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CATALOGS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CATALOGS" ADD CONSTRAINT "MD_CATALOGS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_INDEXES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_INDEXES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_INDEXES" MODIFY ("TABLE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_INDEXES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_INDEXES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_INDEXES" ADD CONSTRAINT "MD_INDEXES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_TABLES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_TABLES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TABLES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TABLES" MODIFY ("TABLE_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TABLES" MODIFY ("QUALIFIED_NATIVE_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TABLES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TABLES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TABLES" ADD CONSTRAINT "MD_TABLES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CATEGORIAS
--------------------------------------------------------

  ALTER TABLE "HR"."CATEGORIAS" ADD PRIMARY KEY ("ID_CATEGORIA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_INDEX_DETAILS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_INDEX_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_INDEX_DETAILS" MODIFY ("INDEX_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_INDEX_DETAILS" MODIFY ("COLUMN_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_INDEX_DETAILS" MODIFY ("DETAIL_ORDER" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_INDEX_DETAILS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_INDEX_DETAILS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_INDEX_DETAILS" ADD CONSTRAINT "MD_INDEX_DETAILS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_PRIVILEGES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PRIVILEGES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PRIVILEGES" MODIFY ("PRIVILEGE_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PRIVILEGES" MODIFY ("PRIVELEGEOBJECTTYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PRIVILEGES" MODIFY ("PRIVELEGE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PRIVILEGES" MODIFY ("NATIVE_SQL" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PRIVILEGES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PRIVILEGES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PRIVILEGES" ADD CONSTRAINT "MD_PRIVILEGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_REGISTRY
--------------------------------------------------------

  ALTER TABLE "HR"."MD_REGISTRY" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_REGISTRY" MODIFY ("OBJECT_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_REGISTRY" ADD CONSTRAINT "MD_REGISTRY_PK" PRIMARY KEY ("OBJECT_TYPE", "OBJECT_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PERMISOS
--------------------------------------------------------

  ALTER TABLE "HR"."PERMISOS" ADD PRIMARY KEY ("ID_PERMISOS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "HR"."COUNTRIES" MODIFY ("COUNTRY_ID" CONSTRAINT "COUNTRY_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."COUNTRIES" ADD CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "HR"."LOCATIONS" MODIFY ("CITY" CONSTRAINT "LOC_CITY_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."LOCATIONS" ADD CONSTRAINT "LOC_ID_PK" PRIMARY KEY ("LOCATION_ID")
  USING INDEX "HR"."LOC_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_GROUPS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_GROUPS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUPS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUPS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUPS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUPS" ADD CONSTRAINT "MD_GROUPS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("EMPLOYEE_ID" CONSTRAINT "JHIST_EMPLOYEE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("START_DATE" CONSTRAINT "JHIST_START_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("END_DATE" CONSTRAINT "JHIST_END_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("JOB_ID" CONSTRAINT "JHIST_JOB_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_DATE_INTERVAL" CHECK (end_date > start_date) ENABLE;
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_ID_ST_DATE_PK" PRIMARY KEY ("EMPLOYEE_ID", "START_DATE")
  USING INDEX "HR"."JHIST_EMP_ID_ST_DATE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_CONSTRAINTS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_CONSTRAINTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONSTRAINTS" MODIFY ("TABLE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONSTRAINTS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONSTRAINTS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONSTRAINTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONSTRAINTS" ADD CONSTRAINT "MD_CONSTRAINTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_APPLICATIONS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_APPLICATIONS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_APPLICATIONS" MODIFY ("PROJECT_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_APPLICATIONS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_APPLICATIONS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_APPLICATIONS" ADD CONSTRAINT "MD_APPLICATIONS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_PROJECTS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_PROJECTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PROJECTS" MODIFY ("PROJECT_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PROJECTS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PROJECTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PROJECTS" ADD CONSTRAINT "MD_PROJECTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_TABLESPACES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_TABLESPACES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TABLESPACES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TABLESPACES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TABLESPACES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_TABLESPACES" ADD CONSTRAINT "MD_TABLESPACES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_APPLICATIONFILES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_APPLICATIONFILES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_APPLICATIONFILES" MODIFY ("APPLICATIONS_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_APPLICATIONFILES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_APPLICATIONFILES" MODIFY ("URI" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_APPLICATIONFILES" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_APPLICATIONFILES" MODIFY ("STATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_APPLICATIONFILES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_APPLICATIONFILES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_APPLICATIONFILES" ADD CONSTRAINT "MD_APPLICATIONFILES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_FILE_ARTIFACTS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_FILE_ARTIFACTS" MODIFY ("ID" CONSTRAINT "MD_APP_FILE_ART_NONULL" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_FILE_ARTIFACTS" MODIFY ("APPLICATIONFILES_ID" CONSTRAINT "MD_APPL_FILE_FK_NONULL" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_FILE_ARTIFACTS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_FILE_ARTIFACTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_FILE_ARTIFACTS" ADD CONSTRAINT "MD_FILE_ARTIFACTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_SEQUENCES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_SEQUENCES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SEQUENCES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SEQUENCES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SEQUENCES" MODIFY ("SEQ_START" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SEQUENCES" MODIFY ("INCR" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SEQUENCES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SEQUENCES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SEQUENCES" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SEQUENCES" ADD CONSTRAINT "MD_SEQUENCES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_MIGR_WEAKDEP
--------------------------------------------------------

  ALTER TABLE "HR"."MD_MIGR_WEAKDEP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_WEAKDEP" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_WEAKDEP" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_WEAKDEP" MODIFY ("PARENT_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_WEAKDEP" MODIFY ("CHILD_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_WEAKDEP" MODIFY ("PARENT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_WEAKDEP" MODIFY ("CHILD_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_WEAKDEP" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_WEAKDEP" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_WEAKDEP" ADD CONSTRAINT "MIGR_WEAKDEP_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_SCHEMAS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_SCHEMAS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SCHEMAS" MODIFY ("CATALOG_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SCHEMAS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SCHEMAS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SCHEMAS" ADD CONSTRAINT "MD_SCHEMAS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_USER_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_USER_PRIVILEGES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USER_PRIVILEGES" MODIFY ("USER_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USER_PRIVILEGES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USER_PRIVILEGES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USER_PRIVILEGES" ADD CONSTRAINT "MD_USER_PRIVILEGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_REPOVERSIONS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_REPOVERSIONS" MODIFY ("REVISION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROLES
--------------------------------------------------------

  ALTER TABLE "HR"."ROLES" ADD PRIMARY KEY ("ID_ROL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MIGR_DATATYPE_TRANSFORM_MAP
--------------------------------------------------------

  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_MAP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_MAP" MODIFY ("PROJECT_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_MAP" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_MAP" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_MAP" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_M_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_CONSTRAINT_DETAILS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_CONSTRAINT_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONSTRAINT_DETAILS" MODIFY ("CONSTRAINT_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONSTRAINT_DETAILS" MODIFY ("DETAIL_ORDER" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONSTRAINT_DETAILS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONSTRAINT_DETAILS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONSTRAINT_DETAILS" ADD CONSTRAINT "MD_CONSTRAINT_DETAILS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_USER_DEFINED_DATA_TYPES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("DATA_TYPE_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("DEFINITION" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("NATIVE_SQL" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USER_DEFINED_DATA_TYPES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USER_DEFINED_DATA_TYPES" ADD CONSTRAINT "MD_USER_DEFINED_DATA_TYPES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_OTHER_OBJECTS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_OTHER_OBJECTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_OTHER_OBJECTS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_OTHER_OBJECTS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_OTHER_OBJECTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_OTHER_OBJECTS" ADD CONSTRAINT "MD_OTHER_OBJECTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTAMENTOS
--------------------------------------------------------

  ALTER TABLE "HR"."DEPARTAMENTOS" ADD PRIMARY KEY ("ID_DEPARTAMENTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_USERS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_USERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USERS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USERS" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USERS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USERS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_USERS" ADD CONSTRAINT "MD_USERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MIGRLOG
--------------------------------------------------------

  ALTER TABLE "HR"."MIGRLOG" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGRLOG" MODIFY ("LOG_DATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGRLOG" MODIFY ("SEVERITY" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGRLOG" ADD CONSTRAINT "MIGRLOG_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_CODE_REGEX
--------------------------------------------------------

  ALTER TABLE "HR"."MD_CODE_REGEX" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CODE_REGEX" MODIFY ("REGEX" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CODE_REGEX" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_ADDITIONAL_PROPERTIES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_ADDITIONAL_PROPERTIES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_ADDITIONAL_PROPERTIES" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_ADDITIONAL_PROPERTIES" MODIFY ("REF_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_ADDITIONAL_PROPERTIES" MODIFY ("REF_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_ADDITIONAL_PROPERTIES" MODIFY ("PROP_KEY" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_ADDITIONAL_PROPERTIES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_ADDITIONAL_PROPERTIES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_ADDITIONAL_PROPERTIES" ADD CONSTRAINT "MD_ADDITIONAL_PROPERTIES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EQUIPOS
--------------------------------------------------------

  ALTER TABLE "HR"."EQUIPOS" ADD PRIMARY KEY ("ID_EQUIPO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_CONNECTIONS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_CONNECTIONS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONNECTIONS" MODIFY ("PROJECT_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONNECTIONS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONNECTIONS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_CONNECTIONS" ADD CONSTRAINT "MD_CONNECTIONS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_DERIVATIVES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_DERIVATIVES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_DERIVATIVES" MODIFY ("SRC_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_DERIVATIVES" MODIFY ("DERIVED_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_DERIVATIVES" MODIFY ("DERIVED_CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_DERIVATIVES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_DERIVATIVES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_DERIVATIVES" ADD CONSTRAINT "MIGRDER_CHK" CHECK (ENABLED = 'Y' OR ENABLED = 'y' OR ENABLED = 'N' OR  ENABLED = 'n') ENABLE;
  ALTER TABLE "HR"."MD_DERIVATIVES" ADD CONSTRAINT "MIGRDREIVATIVES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_MIGR_PARAMETER
--------------------------------------------------------

  ALTER TABLE "HR"."MD_MIGR_PARAMETER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_PARAMETER" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_PARAMETER" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_PARAMETER" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_PARAMETER" MODIFY ("PARAM_EXISTING" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_PARAMETER" MODIFY ("PARAM_ORDER" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_PARAMETER" MODIFY ("PARAM_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_PARAMETER" MODIFY ("PARAM_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_PARAMETER" MODIFY ("PARAM_DATA_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_PARAMETER" MODIFY ("NULLABLE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_PARAMETER" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_PARAMETER" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_PARAMETER" ADD CONSTRAINT "MIGR_PARAMETER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "HR"."DEPARTMENTS" MODIFY ("DEPARTMENT_NAME" CONSTRAINT "DEPT_NAME_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX "HR"."DEPT_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_GROUP_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_GROUP_PRIVILEGES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUP_PRIVILEGES" MODIFY ("GROUP_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUP_PRIVILEGES" MODIFY ("PRIVILEGE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUP_PRIVILEGES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUP_PRIVILEGES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUP_PRIVILEGES" ADD CONSTRAINT "MD_GROUP_PRIVILEGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PERSONAL
--------------------------------------------------------

  ALTER TABLE "HR"."PERSONAL" ADD PRIMARY KEY ("ID_PERSONAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table JOBS
--------------------------------------------------------

  ALTER TABLE "HR"."JOBS" MODIFY ("JOB_TITLE" CONSTRAINT "JOB_TITLE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOBS" ADD CONSTRAINT "JOB_ID_PK" PRIMARY KEY ("JOB_ID")
  USING INDEX "HR"."JOB_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_PACKAGES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_PACKAGES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PACKAGES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PACKAGES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PACKAGES" MODIFY ("LANGUAGE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PACKAGES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PACKAGES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PACKAGES" ADD CONSTRAINT "MD_PACKAGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_COLUMNS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_COLUMNS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_COLUMNS" MODIFY ("TABLE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_COLUMNS" MODIFY ("COLUMN_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_COLUMNS" MODIFY ("COLUMN_ORDER" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_COLUMNS" MODIFY ("NULLABLE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_COLUMNS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_COLUMNS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_COLUMNS" ADD CONSTRAINT "MD_COLUMNS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."MD_COLUMNS" ADD CONSTRAINT "MD_COLUMNS_NULLABLE_Y_N" CHECK ((UPPER(NULLABLE) IN ('Y','N'))) ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("LAST_NAME" CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("EMAIL" CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("HIRE_DATE" CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("JOB_ID" CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX "HR"."EMP_EMP_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_MIGR_DEPENDENCY
--------------------------------------------------------

  ALTER TABLE "HR"."MD_MIGR_DEPENDENCY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_DEPENDENCY" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_DEPENDENCY" MODIFY ("PARENT_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_DEPENDENCY" MODIFY ("CHILD_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_DEPENDENCY" MODIFY ("PARENT_OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_DEPENDENCY" MODIFY ("CHILD_OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_DEPENDENCY" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_DEPENDENCY" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_MIGR_DEPENDENCY" ADD CONSTRAINT "MIGR_DEPENDENCY_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_SYNONYMS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_SYNONYMS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SYNONYMS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SYNONYMS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SYNONYMS" MODIFY ("SYNONYM_FOR_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SYNONYMS" MODIFY ("FOR_OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SYNONYMS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SYNONYMS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_SYNONYMS" ADD CONSTRAINT "MD_SYNONYMS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MIGR_GENERATION_ORDER
--------------------------------------------------------

  ALTER TABLE "HR"."MIGR_GENERATION_ORDER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_GENERATION_ORDER" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_GENERATION_ORDER" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_GENERATION_ORDER" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_GENERATION_ORDER" MODIFY ("GENERATION_ORDER" NOT NULL ENABLE);
  ALTER TABLE "HR"."MIGR_GENERATION_ORDER" ADD CONSTRAINT "MIGR_GENERATION_ORDER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."MIGR_GENERATION_ORDER" ADD CONSTRAINT "MIGR_GENERATION_ORDER_UK" UNIQUE ("OBJECT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_PARTITIONS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_PARTITIONS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PARTITIONS" MODIFY ("TABLE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PARTITIONS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PARTITIONS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_PARTITIONS" ADD CONSTRAINT "MD_PARTITIONS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_VIEWS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_VIEWS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_VIEWS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_VIEWS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_VIEWS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_VIEWS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_VIEWS" ADD CONSTRAINT "MD_VIEWS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_GROUP_MEMBERS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_GROUP_MEMBERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUP_MEMBERS" MODIFY ("GROUP_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUP_MEMBERS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUP_MEMBERS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "HR"."MD_GROUP_MEMBERS" ADD CONSTRAINT "MD_GROUP_MEMBERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "HR"."COUNTRIES" ADD CONSTRAINT "COUNTR_REG_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "HR"."REGIONS" ("REGION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_LOC_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "HR"."LOCATIONS" ("LOCATION_ID") ENABLE;
  ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_MGR_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "HR"."JOBS" ("JOB_ID") ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_MANAGER_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EQUIPOS
--------------------------------------------------------

  ALTER TABLE "HR"."EQUIPOS" ADD FOREIGN KEY ("CATEGORIA")
	  REFERENCES "HR"."CATEGORIAS" ("ID_CATEGORIA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "HR"."JOBS" ("JOB_ID") ENABLE;
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_FK" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "HR"."LOCATIONS" ADD CONSTRAINT "LOC_C_ID_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "HR"."COUNTRIES" ("COUNTRY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_ADDITIONAL_PROPERTIES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_ADDITIONAL_PROPERTIES" ADD CONSTRAINT "MD_ADDITIONAL_PROPERTIES__FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "HR"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_APPLICATIONFILES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_APPLICATIONFILES" ADD CONSTRAINT "MD_FILE_APP_FK" FOREIGN KEY ("APPLICATIONS_ID_FK")
	  REFERENCES "HR"."MD_APPLICATIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_APPLICATIONS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_APPLICATIONS" ADD CONSTRAINT "MD_APP_PROJ_FK" FOREIGN KEY ("PROJECT_ID_FK")
	  REFERENCES "HR"."MD_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_CATALOGS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_CATALOGS" ADD CONSTRAINT "MD_CATALOGS_MD_CONNECTION_FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "HR"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_COLUMNS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_COLUMNS" ADD CONSTRAINT "MD_COLUMNS_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "HR"."MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_CONNECTIONS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_CONNECTIONS" ADD CONSTRAINT "MD_CONNECTIONS_MD_PROJECT_FK1" FOREIGN KEY ("PROJECT_ID_FK")
	  REFERENCES "HR"."MD_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_CONSTRAINTS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_CONSTRAINTS" ADD CONSTRAINT "MD_CONSTRAINTS_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "HR"."MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_CONSTRAINT_DETAILS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_CONSTRAINT_DETAILS" ADD CONSTRAINT "MD_CONSTRAINT_DETAILS_MD__FK2" FOREIGN KEY ("COLUMN_ID_FK")
	  REFERENCES "HR"."MD_COLUMNS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HR"."MD_CONSTRAINT_DETAILS" ADD CONSTRAINT "MD_CONSTRAINT_DETAILS_MD__FK1" FOREIGN KEY ("CONSTRAINT_ID_FK")
	  REFERENCES "HR"."MD_CONSTRAINTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_DERIVATIVES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_DERIVATIVES" ADD CONSTRAINT "MD_DERIVATIVES_MD_CONNECT_FK1" FOREIGN KEY ("DERIVED_CONNECTION_ID_FK")
	  REFERENCES "HR"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_FILE_ARTIFACTS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_FILE_ARTIFACTS" ADD CONSTRAINT "MD_ARTIFACT_FILE_FK" FOREIGN KEY ("APPLICATIONFILES_ID")
	  REFERENCES "HR"."MD_APPLICATIONFILES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_GROUPS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_GROUPS" ADD CONSTRAINT "MD_GROUPS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_GROUP_MEMBERS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_GROUP_MEMBERS" ADD CONSTRAINT "MD_GROUPMEMBERS_MD_USERS_FK1" FOREIGN KEY ("USER_ID_FK")
	  REFERENCES "HR"."MD_USERS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HR"."MD_GROUP_MEMBERS" ADD CONSTRAINT "MD_GROUPMEMBERS_MD_GROUPS_FK2" FOREIGN KEY ("GROUP_MEMBER_ID_FK")
	  REFERENCES "HR"."MD_GROUPS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HR"."MD_GROUP_MEMBERS" ADD CONSTRAINT "MD_GROUPMEMBERS_MD_GROUPS_FK1" FOREIGN KEY ("GROUP_ID_FK")
	  REFERENCES "HR"."MD_GROUPS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_GROUP_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_GROUP_PRIVILEGES" ADD CONSTRAINT "MD_GROUP_PRIVILEGES_MD_GR_FK1" FOREIGN KEY ("GROUP_ID_FK")
	  REFERENCES "HR"."MD_GROUPS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HR"."MD_GROUP_PRIVILEGES" ADD CONSTRAINT "MD_GROUP_PRIVILEGES_MD_PR_FK1" FOREIGN KEY ("PRIVILEGE_ID_FK")
	  REFERENCES "HR"."MD_PRIVILEGES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_INDEXES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_INDEXES" ADD CONSTRAINT "MD_INDEXES_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "HR"."MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_INDEX_DETAILS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_INDEX_DETAILS" ADD CONSTRAINT "MD_INDEX_DETAILS_MD_COLUM_FK1" FOREIGN KEY ("COLUMN_ID_FK")
	  REFERENCES "HR"."MD_COLUMNS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HR"."MD_INDEX_DETAILS" ADD CONSTRAINT "MD_INDEX_DETAILS_MD_INDEX_FK1" FOREIGN KEY ("INDEX_ID_FK")
	  REFERENCES "HR"."MD_INDEXES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_MIGR_DEPENDENCY
--------------------------------------------------------

  ALTER TABLE "HR"."MD_MIGR_DEPENDENCY" ADD CONSTRAINT "MIGR_DEPENDENCY_FK" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "HR"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_MIGR_PARAMETER
--------------------------------------------------------

  ALTER TABLE "HR"."MD_MIGR_PARAMETER" ADD CONSTRAINT "MIGR_PARAMETER_FK" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "HR"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_MIGR_WEAKDEP
--------------------------------------------------------

  ALTER TABLE "HR"."MD_MIGR_WEAKDEP" ADD CONSTRAINT "MIGR_WEAKDEP_FK2" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HR"."MD_MIGR_WEAKDEP" ADD CONSTRAINT "MIGR_WEAKDEP_FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "HR"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OTHER_OBJECTS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_OTHER_OBJECTS" ADD CONSTRAINT "MD_OTHER_OBJECTS_MD_SCHEM_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_PACKAGES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_PACKAGES" ADD CONSTRAINT "MD_PACKAGES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_PARTITIONS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_PARTITIONS" ADD CONSTRAINT "MD_PARTITIONS_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "HR"."MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_PRIVILEGES" ADD CONSTRAINT "MD_PRIVILEGES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_SCHEMAS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_SCHEMAS" ADD CONSTRAINT "MD_SCHEMAS_MD_CATALOGS_FK1" FOREIGN KEY ("CATALOG_ID_FK")
	  REFERENCES "HR"."MD_CATALOGS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_SEQUENCES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_SEQUENCES" ADD CONSTRAINT "MD_SEQUENCES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_STORED_PROGRAMS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_STORED_PROGRAMS" ADD CONSTRAINT "MD_STORED_PROGRAMS_MD_SCH_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HR"."MD_STORED_PROGRAMS" ADD CONSTRAINT "MD_STORED_PROGRAMS_MD_PAC_FK1" FOREIGN KEY ("PACKAGE_ID_FK")
	  REFERENCES "HR"."MD_PACKAGES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_SYNONYMS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_SYNONYMS" ADD CONSTRAINT "MD_SYNONYMS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_TABLES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_TABLES" ADD CONSTRAINT "MD_TABLES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_TABLESPACES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_TABLESPACES" ADD CONSTRAINT "MD_TABLESPACES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_USERS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_USERS" ADD CONSTRAINT "MD_USERS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_USER_DEFINED_DATA_TYPES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_USER_DEFINED_DATA_TYPES" ADD CONSTRAINT "MD_USER_DEFINED_DATA_TYPE_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_USER_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "HR"."MD_USER_PRIVILEGES" ADD CONSTRAINT "MD_USER_PRIVILEGES_MD_PRI_FK1" FOREIGN KEY ("PRIVILEGE_ID_FK")
	  REFERENCES "HR"."MD_PRIVILEGES" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "HR"."MD_USER_PRIVILEGES" ADD CONSTRAINT "MD_USER_PRIVILEGES_MD_USE_FK1" FOREIGN KEY ("USER_ID_FK")
	  REFERENCES "HR"."MD_USERS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_VIEWS
--------------------------------------------------------

  ALTER TABLE "HR"."MD_VIEWS" ADD CONSTRAINT "MD_VIEWS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "HR"."MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MIGRLOG
--------------------------------------------------------

  ALTER TABLE "HR"."MIGRLOG" ADD CONSTRAINT "MIGR_MIGRLOG_FK" FOREIGN KEY ("PARENT_LOG_ID")
	  REFERENCES "HR"."MIGRLOG" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MIGR_DATATYPE_TRANSFORM_MAP
--------------------------------------------------------

  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_MAP" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_M_FK1" FOREIGN KEY ("PROJECT_ID_FK")
	  REFERENCES "HR"."MD_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MIGR_DATATYPE_TRANSFORM_RULE
--------------------------------------------------------

  ALTER TABLE "HR"."MIGR_DATATYPE_TRANSFORM_RULE" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_R_FK1" FOREIGN KEY ("MAP_ID_FK")
	  REFERENCES "HR"."MIGR_DATATYPE_TRANSFORM_MAP" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MIGR_GENERATION_ORDER
--------------------------------------------------------

  ALTER TABLE "HR"."MIGR_GENERATION_ORDER" ADD CONSTRAINT "MIGR_GENERATION_ORDER_MD__FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "HR"."MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PERMISOS
--------------------------------------------------------

  ALTER TABLE "HR"."PERMISOS" ADD FOREIGN KEY ("ID_ROL")
	  REFERENCES "HR"."ROLES" ("ID_ROL") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PERSONAL
--------------------------------------------------------

  ALTER TABLE "HR"."PERSONAL" ADD FOREIGN KEY ("ID_DEPARTAMENTO")
	  REFERENCES "HR"."DEPARTAMENTOS" ("ID_DEPARTAMENTO") ENABLE;
