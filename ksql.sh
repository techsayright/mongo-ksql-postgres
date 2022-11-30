docker-compose exec -T ksqldb-cli ksql http://ksqldb-server:8088 <<-EOF
    show topics;

    set 'commit.interval.ms'='5000';
    set 'cache.max.bytes.buffering'='10000000';
    set 'auto.offset.reset'='earliest';


    CREATE STREAM courses_src WITH (KAFKA_TOPIC='demo.class.courses', VALUE_FORMAT='AVRO');

    CREATE STREAM courses1 WITH (KAFKA_TOPIC='demo.class.courses', VALUE_FORMAT='AVRO');

    CREATE OR REPLACE STREAM class_boost WITH (
    kafka_topic = 'demo.class.class_boost',
    VALUE_FORMAT='AVRO'
)   AS
    SELECT *, rowtime AS time FROM courses1
    EMIT CHANGES;


EOF
