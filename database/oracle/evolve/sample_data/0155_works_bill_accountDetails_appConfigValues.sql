#UP
INSERT
INTO EG_APPCONFIG_VALUES
  (
    ID,
    KEY_ID,
    EFFECTIVE_FROM,
    VALUE
  )
  VALUES
  (
    SEQ_EG_APPCONFIG_VALUES.nextval,
    (SELECT ID FROM EG_APPCONFIG WHERE KEY_NAME='WORKS_CWIP_CODE'
    ),
    TO_Date( '04/08/2009 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM'),
    '16'
  );

INSERT
INTO EG_APPCONFIG_VALUES
  (
    ID,
    KEY_ID,
    EFFECTIVE_FROM,
    VALUE
  )
  VALUES
  (
    SEQ_EG_APPCONFIG_VALUES.nextval,
    (SELECT ID FROM EG_APPCONFIG WHERE KEY_NAME='WORKS_DEPOSIT_OTHER_WORKS'
    ),
    TO_Date( '04/08/2009 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM'),
    '61'
  );
INSERT
INTO EG_APPCONFIG_VALUES
  (
    ID,
    KEY_ID,
    EFFECTIVE_FROM,
    VALUE
  )
  VALUES
  (
    SEQ_EG_APPCONFIG_VALUES.nextval,
    (SELECT ID FROM EG_APPCONFIG WHERE KEY_NAME='WORKS_REPAIRS_AND_MAINTENANCE'
    ),
    TO_Date( '04/08/2009 12:00:00 AM', 'MM/DD/YYYY HH:MI:SS AM'),
    '62'
  );
#DOWN
Delete from EG_APPCONFIG_VALUES where key_id=(SELECT ID FROM EG_APPCONFIG WHERE KEY_NAME='WORKS_REPAIRS_AND_MAINTENANCE');
Delete from EG_APPCONFIG_VALUES where key_id=(SELECT ID FROM EG_APPCONFIG WHERE KEY_NAME='WORKS_DEPOSIT_OTHER_WORKS');
Delete from EG_APPCONFIG_VALUES where key_id=(SELECT ID FROM EG_APPCONFIG WHERE KEY_NAME='WORKS_CWIP_CODE');
