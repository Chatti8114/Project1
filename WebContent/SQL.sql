
-- auto-generated definition
create table MEMBERSHIP
(
    MEMBER_ID           VARCHAR2(15) not null
        primary key,
    MEMBER_PW           VARCHAR2(15),
    MEMBER_NAME         VARCHAR2(10),
    MEMBER_AGE          VARCHAR2(3),
    MEMBER_GENDER       VARCHAR2(3),
    MEMBER_ADDRESS      VARCHAR2(50),
    MEMBER_PHONE        VARCHAR2(15),
    MEMBER_EMAIL        VARCHAR2(40),
    MEMBER_INTEREST     VARCHAR2(50),
    MEMBER_RECENT_LOGIN DATE         not null,
    MEMBER_ROLE         NUMBER
);

-- auto-generated definition
create table BOARDTABLE
(
    BOARD_NUM       NUMBER       not null
        primary key,
    BOARD_TITLE     VARCHAR2(40),
    BOARD_CONTENT   VARCHAR2(300),
    BOARD_ID        VARCHAR2(15) not null
        constraint BOARD_ID_PK
            references MEMBERSHIP
                on delete cascade,
    BOARD_DATE      DATE,
    BOARD_CATEGORY  VARCHAR2(50),
    BOARD_PRICE     VARCHAR2(15),
    BOARD_FILE1     VARCHAR2(40),
    BOARD_FILE2     VARCHAR2(40),
    BOARD_FILE3     VARCHAR2(40),
    BOARD_STATE     VARCHAR2(10),
    BOARD_REFUND    VARCHAR2(5),
    BOARD_DELIVERY  VARCHAR2(8),
    BOARD_AREA      VARCHAR2(30),
    BOARD_RE_REF    NUMBER,
    BOARD_RE_LEV    NUMBER,
    BOARD_RE_SEQ    NUMBER,
    BOARD_READCOUNT NUMBER
)
;

create table COMMENTBOARD
(
    CB_NUM     NUMBER not null
        constraint COMMENTBOARD_PK
            primary key,
    CB_ID      VARCHAR2(15),
    CB_CONTENT VARCHAR2(100),
    CB_DATE    DATE,
    CB_RE_SEQ  NUMBER,
    CB_RE_REF  NUMBER,
    CB_RE_LEV  NUMBER
)/

create table NOTIFY_BOARD
(
    NB_NUM      NUMBER       not null
        constraint NOTIFY_BOARD_PK
            primary key,
    NB_CONTENT  VARCHAR2(300),
    NB_ID       VARCHAR2(15) not null,
    NB_DATE     DATE,
    NB_RE_REF   NUMBER
        constraint NOTIFY_BOARD_FK
            references BOARDTABLE
                on delete cascade,
    NB_PROGRESS VARCHAR2(5),
    NB_REASON   VARCHAR2(50)
)
/

-- 256 암호화 적용하기
-- UPDATE MEMBERSHIP SET MEMBER_PW = ? WHERE MEMBER_PW = ?

UPDATE BOARDTABLE SET (BOARD_OG_FILE1) = (SELECT BOARD_FILE1 FROM BOARDTABLE WHERE BOARD_OG_FILE1 is null) WHERE BOARD_OG_FILE1 is null;
-- submit 필수

UPDATE BOARDTABLE SET BOARD_OG_FILE2 = (SELECT BOARD_FILE2 FROM BOARDTABLE WHERE BOARD_OG_FILE2 is null) WHERE BOARD_OG_FILE2 is null;
-- submit 필수

UPDATE BOARDTABLE SET BOARD_OG_FILE3 = (SELECT BOARD_FILE3 FROM BOARDTABLE WHERE BOARD_OG_FILE3 is null) WHERE BOARD_OG_FILE3 is null;
-- submit 필수


-- String sql ="";select BOARD_NUM, BOARD_FILE1, BOARD_TITLE from BOARDTABLE where rownum<=? and BOARD_CATEGORY= ? and BOARD_DATE>sysdate - ? order by BOARD_READCOUNT desc




create table COMMENTBOARD
(
    CB_NUM     NUMBER,
    CB_ID      VARCHAR2(15),
    CB_CONTENT VARCHAR2(100),
    CB_DATE    DATE,
    CB_RE_REF  NUMBER
        constraint COMMENTBOARD_PK
            references BOARDTABLE,
    CB_RE_LEV  NUMBER,
    CB_RE_SEQ  NUMBER,
    primary key (CB_NUM)
)
/