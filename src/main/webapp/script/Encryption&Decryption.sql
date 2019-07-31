/*AES 256 암/복호화 처리를 오라클 내부적으로 Package 를 활용하여 처리할 수 있다.*/
/*암/복호화 처리를 오라클 내부적으로 Package 를 활용하여 처리할 수 있다.*/

/*SYSDBA 권한으로 해당 유저에게 권한을 부여한다*/
GRANT EXECUTE ON DBMS_OBFUSCATION_TOOLKIT TO HOSPITAL;
GRANT EXECUTE ON DBMS_CRYPTO TO HOSPITAL;

/*Head 패키지를 선언 해 준다.*/
create or replace PACKAGE CRYPTO_AES256
IS
        /********************************************************************************
        encryption
        ********************************************************************************/
        FUNCTION ENC_AES(input_string IN VARCHAR2)
                RETURN VARCHAR2;
        /********************************************************************************
        decryption
        ********************************************************************************/
        FUNCTION DEC_AES(encrypted_raw IN VARCHAR2)
                RETURN VARCHAR2;
END CRYPTO_AES256;

/*Body 패키지를 선언 해 준다.*/
create or replace PACKAGE BODY CRYPTO_AES256
IS
        /********************************************************************************
        encryption
        ********************************************************************************/
        FUNCTION ENC_AES(input_string IN VARCHAR2)
                RETURN VARCHAR2
        IS
                return_base256 VARCHAR2(256);
                encrypted_raw RAW (2000);      -- encryption raw type date
                key_bytes_raw RAW (32);        -- encryption key (32raw => 32byte => 256bit)
                encryption_type PLS_INTEGER := -- encryption
                DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5;
        BEGIN
                IF input_string       IS NOT NULL THEN
                        key_bytes_raw := UTL_I18N.STRING_TO_RAW('WKAF3xv7y,d5SZpzT8ftJR).shEQn#%@', 'AL32UTF8');
                        encrypted_raw := DBMS_CRYPTO.ENCRYPT ( src => UTL_I18N.STRING_TO_RAW(input_string, 'AL32UTF8'), typ => encryption_type, KEY => key_bytes_raw );
                        -- ORA-06502: PL/SQL: numeric or value error: hex to raw conversion error
                        return_base256 := UTL_RAW.CAST_TO_VARCHAR2(UTL_ENCODE.BASE64_ENCODE(encrypted_raw));
                END IF;
                RETURN return_base256;
        END ENC_AES;
     
    /********************************************************************************
    decryption
    ********************************************************************************/
        FUNCTION DEC_AES(encrypted_raw IN VARCHAR2)
                RETURN VARCHAR2
        IS
                output_string VARCHAR2 (200);
                decrypted_raw RAW (2000);      -- decryption raw type date
                key_bytes_raw RAW (32);        -- 256bit decryption key
                encryption_type PLS_INTEGER := -- decryption
                DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5;
        BEGIN
                IF encrypted_raw      IS NOT NULL THEN
                        key_bytes_raw := UTL_I18N.STRING_TO_RAW('WKAF3xv7y,d5SZpzT8ftJR).shEQn#%@', 'AL32UTF8');
                        decrypted_raw := DBMS_CRYPTO.DECRYPT (
                        -- ORA-06502: PL/SQL: numeric or value error: hex to raw conversion error
                        src => UTL_ENCODE.BASE64_DECODE(UTL_RAW.CAST_TO_RAW(encrypted_raw)), typ => encryption_type, KEY => key_bytes_raw );
                        output_string := UTL_I18N.RAW_TO_CHAR(decrypted_raw, 'AL32UTF8');
                END IF;
                RETURN output_string;
        END DEC_AES;
END CRYPTO_AES256;

commit;

/*사용 방법*/
-- AES256 암호화
SELECT DISTINCT CRYPTO_AES256.ENC_AES(res_reg_num) FROM MEMBER;
 
-- AES256 복호화
SELECT DISTINCT CRYPTO_AES256.DEC_AES(res_reg_num) FROM MEMBER;