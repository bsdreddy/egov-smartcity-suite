#UP
INSERT INTO EG_APPCONFIG_VALUES ( ID, KEY_ID, EFFECTIVE_FROM, VALUE ) VALUES
(SEQ_EG_APPCONFIG_VALUES.NEXTVAL, (SELECT ID FROM EG_APPCONFIG WHERE KEY_NAME='coa_subminorcode_length'),  SYSDATE, '3'); 

#DOWN
delete from EG_APPCONFIG_VALUES where  KEY_ID in (SELECT ID FROM EG_APPCONFIG WHERE KEY_NAME='coa_subminorcode_length')