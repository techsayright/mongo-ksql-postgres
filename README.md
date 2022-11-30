# mongo-ksql-postgres

To run : ./start.sh
          ./ksql.sh
         
some Details:

in mongo source json file, i have used as it avro format which i have mentioned in yml file at connect source
Avro format is encoded by json schema and postgres sink need schema without schema it will through error 

now in postgres sink json file, i have mentioned topic name as demo.class.class_boost
so postgres take this as demo means database, class means schema name (you have to create in postgres) and class_boost will be automatically created in postgres as table name
so create your topic as db_name.class_name.table_name          
