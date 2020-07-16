
-- auto-generated definition
create user summer identified by 1234;
grant create user, create table, create sequence, create view, create session to summer;
alter user summer default tablespace users;
alter user summer quota unlimited on users;



create table MEMBERSHIP
(
    MEMBER_ID           VARCHAR2(15) not null
        primary key,
    MEMBER_PW           VARCHAR2(24),
    MEMBER_NAME         VARCHAR2(10),
    MEMBER_AGE          VARCHAR2(3),
    MEMBER_GENDER       VARCHAR2(3),
    MEMBER_ADDRESS      VARCHAR2(50),
    MEMBER_PHONE        VARCHAR2(15),
    MEMBER_EMAIL        VARCHAR2(40),
    MEMBER_INTEREST     VARCHAR2(50),
    MEMBER_RECENT_LOGIN DATE         not null,
    MEMBER_ROLE         NUMBER,
    MEMBER_NOTIFY_COUNT VARCHAR2(10)
);
alter table membership add(MEMBER_NOTIFY_COUNT VARCHAR2(10));

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
    BOARD_FILE1     VARCHAR2(100),
    BOARD_FILE2     VARCHAR2(100),
    BOARD_FILE3     VARCHAR2(100),
    BOARD_STATE     VARCHAR2(10),
    BOARD_REFUND    VARCHAR2(5),
    BOARD_DELIVERY  VARCHAR2(8),
    BOARD_AREA      VARCHAR2(30),
    BOARD_RE_REF    NUMBER,
    BOARD_RE_LEV    NUMBER,
    BOARD_RE_SEQ    NUMBER,
    BOARD_READCOUNT NUMBER,
     board_sold_out varchar2(5),
    BOARD_OR_FILE1 VARCHAR2(100),
    BOARD_OR_FILE2 VARCHAR2(100),
    BOARD_OR_FILE3 VARCHAR2(100)
)
;

create sequence BBSNUM
increment by 1
start with 1;

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
);

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
;


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
