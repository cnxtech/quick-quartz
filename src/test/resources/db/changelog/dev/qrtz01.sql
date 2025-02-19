DROP TABLE IF EXISTS  qrtz_fired_triggers;
DROP TABLE IF EXISTS  QRTZ_PAUSED_TRIGGER_GRPS;
DROP TABLE IF EXISTS  QRTZ_SCHEDULER_STATE;
DROP TABLE IF EXISTS  QRTZ_LOCKS;
DROP TABLE IF EXISTS  qrtz_simple_triggers;
DROP TABLE IF EXISTS  qrtz_cron_triggers;
DROP TABLE IF EXISTS  qrtz_simprop_triggers;
DROP TABLE IF EXISTS  QRTZ_BLOB_TRIGGERS;
DROP TABLE IF EXISTS  qrtz_triggers;
DROP TABLE IF EXISTS  qrtz_job_details;
DROP TABLE IF EXISTS  qrtz_calendars;

CREATE TABLE qrtz_job_details
(
    SCHED_NAME TEXT NOT NULL,
    JOB_NAME  TEXT NOT NULL,
    JOB_GROUP TEXT NOT NULL,
    DESCRIPTION TEXT NULL,
    JOB_CLASS_NAME   TEXT NOT NULL,
    IS_DURABLE BOOL NOT NULL,
    IS_NONCONCURRENT BOOL NOT NULL,
    IS_UPDATE_DATA BOOL NOT NULL,
    REQUESTS_RECOVERY BOOL NOT NULL,
    JOB_DATA JSONB NULL,
    PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE qrtz_triggers
(
    SCHED_NAME TEXT NOT NULL,
    TRIGGER_NAME TEXT NOT NULL,
    TRIGGER_GROUP TEXT NOT NULL,
    JOB_NAME  TEXT NOT NULL,
    JOB_GROUP TEXT NOT NULL,
    DESCRIPTION TEXT NULL,
    NEXT_FIRE_TIME BIGINT NULL,
    PREV_FIRE_TIME BIGINT NULL,
    PRIORITY INTEGER NULL,
    TRIGGER_STATE TEXT NOT NULL,
    TRIGGER_TYPE TEXT NOT NULL,
    START_TIME BIGINT NOT NULL,
    END_TIME BIGINT NULL,
    CALENDAR_NAME TEXT NULL,
    MISFIRE_INSTR SMALLINT NULL,
    JOB_DATA JSONB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
        REFERENCES QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP)
);


CREATE TABLE qrtz_fired_triggers
(
    SCHED_NAME TEXT NOT NULL,
    ENTRY_ID TEXT NOT NULL,
    TRIGGER_NAME TEXT NOT NULL,
    TRIGGER_GROUP TEXT NOT NULL,
    INSTANCE_NAME TEXT NOT NULL,
    FIRED_TIME BIGINT NOT NULL,
    SCHED_TIME BIGINT NOT NULL,
    PRIORITY INTEGER NOT NULL,
    STATE TEXT NOT NULL,
    JOB_NAME TEXT NULL,
    JOB_GROUP TEXT NULL,
    IS_NONCONCURRENT BOOL NULL,
    REQUESTS_RECOVERY BOOL NULL,
    PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);