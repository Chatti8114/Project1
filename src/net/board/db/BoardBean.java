package net.board.db;


import java.sql.Date;

public class BoardBean {
    private int BOARD_NUM;
    private String BOARD_ID;
    private String BOARD_TITLE;
    private String BOARD_CATEGORY;
    private String BOARD_SUBJECT;
    private String BOARD_AREA;
    private String BOARD_STATE;
    private String BOARD_PRICE;
    private String BOARD_REFUND;
    private String BOARD_DELIVERY;
    private String BOARD_CONTENT;
    private String BOARD_SOLD_OUT;

    private String BOARD_FILE1;
    private String BOARD_FILE2;
    private String BOARD_FILE3;
    private String BOARD_OG_FILE1;
    private String BOARD_OG_FILE2;
    private String BOARD_OG_FILE3;

    private int BOARD_RE_REF;
    private int BOARD_RE_LEV;
    private int BOARD_RE_SEQ;
    private int BOARD_READCOUNT;
    private String BOARD_OG_FILE;
    private Date BOARD_DATE;

    private String BOARD_MEMBER_NAME;
    private String BOARD_MEMBER_AGE;
    private String BOARD_MEMBER_PHONE;
    private int BOARD_NOTIFY_COUNT;
    private Date BOARD_PRINT_DATE;

   

    public String getBOARD_MEMBER_PHONE() {
		return BOARD_MEMBER_PHONE;
	}

	public void setBOARD_MEMBER_PHONE(String bOARD_MEMBER_PHONE) {
		BOARD_MEMBER_PHONE = bOARD_MEMBER_PHONE;
	}

	public Date getBOARD_PRINT_DATE() {
		return BOARD_PRINT_DATE;
	}

	public void setBOARD_PRINT_DATE(Date bOARD_PRINT_DATE) {
		BOARD_PRINT_DATE = bOARD_PRINT_DATE;
	}

	public String getBOARD_OG_FILE1() {
        return BOARD_OG_FILE1;
    }

    public void setBOARD_OG_FILE1(String BOARD_OG_FILE1) {
        this.BOARD_OG_FILE1 = BOARD_OG_FILE1;
    }

    public String getBOARD_OG_FILE2() {
        return BOARD_OG_FILE2;
    }

    public void setBOARD_OG_FILE2(String BOARD_OG_FILE2) {
        this.BOARD_OG_FILE2 = BOARD_OG_FILE2;
    }

    public String getBOARD_OG_FILE3() {
        return BOARD_OG_FILE3;
    }

    public void setBOARD_OG_FILE3(String BOARD_OG_FILE3) {
        this.BOARD_OG_FILE3 = BOARD_OG_FILE3;
    }

    public int getBOARD_NOTIFY_COUNT() {
        return BOARD_NOTIFY_COUNT;
    }

    public void setBOARD_NOTIFY_COUNT(int BOARD_NOTIFY_COUNT) {
        this.BOARD_NOTIFY_COUNT = BOARD_NOTIFY_COUNT;
    }

    public String getBOARD_SOLD_OUT() {
        return BOARD_SOLD_OUT;
    }

    public void setBOARD_SOLD_OUT(String BOARD_SOLD_OUT) {
        this.BOARD_SOLD_OUT = BOARD_SOLD_OUT;
    }

    public String getBOARD_MEMBER_NAME() {
        return BOARD_MEMBER_NAME;
    }

    public void setBOARD_MEMBER_NAME(String BOARD_MEMBER_NAME) {
        this.BOARD_MEMBER_NAME = BOARD_MEMBER_NAME;
    }

    public String getBOARD_MEMBER_AGE() {
        return BOARD_MEMBER_AGE;
    }

    public void setBOARD_MEMBER_AGE(String BOARD_MEMBER_AGE) {
        this.BOARD_MEMBER_AGE = BOARD_MEMBER_AGE;
    }

    
    public String getBOARD_FILE1() {
        return BOARD_FILE1;
    }

    public void setBOARD_FILE1(String BOARD_FILE1) {
        this.BOARD_FILE1 = BOARD_FILE1;
    }

    public String getBOARD_FILE2() {
        return BOARD_FILE2;
    }

    public void setBOARD_FILE2(String BOARD_FILE2) {
        this.BOARD_FILE2 = BOARD_FILE2;
    }

    public String getBOARD_FILE3() {
        return BOARD_FILE3;
    }

    public void setBOARD_FILE3(String BOARD_FILE3) {
        this.BOARD_FILE3 = BOARD_FILE3;
    }

    public String getBOARD_DELIVERY() {
        return BOARD_DELIVERY;
    }

    public void setBOARD_DELIVERY(String BOARD_DELIVERY) {
        this.BOARD_DELIVERY = BOARD_DELIVERY;
    }

    public String getBOARD_REFUND() {
        return BOARD_REFUND;
    }

    public void setBOARD_REFUND(String BOARD_REFUND) {
        this.BOARD_REFUND = BOARD_REFUND;
    }

    public String getBOARD_PRICE() {
        return BOARD_PRICE;
    }

    public void setBOARD_PRICE(String BOARD_PRICE) {
        this.BOARD_PRICE = BOARD_PRICE;
    }

    public String getBOARD_STATE() {
        return BOARD_STATE;
    }

    public void setBOARD_STATE(String BOARD_STATE) {
        this.BOARD_STATE = BOARD_STATE;
    }

    public String getBOARD_AREA() {
        return BOARD_AREA;
    }

    public void setBOARD_AREA(String BOARD_AREA) {
        this.BOARD_AREA = BOARD_AREA;
    }

    public String getBOARD_TITLE() {
        return BOARD_TITLE;
    }

    public void setBOARD_TITLE(String BOARD_TITLE) {
        this.BOARD_TITLE = BOARD_TITLE;
    }

    public String getBOARD_CATEGORY() {
        return BOARD_CATEGORY;
    }

    public void setBOARD_CATEGORY(String BOARD_CATEGORY) {
        this.BOARD_CATEGORY = BOARD_CATEGORY;
    }

    public String getBOARD_OG_FILE() {
		return BOARD_OG_FILE;
	}

	public void setBOARD_OG_FILE(String bOARD_OG_FILE) {
		BOARD_OG_FILE = bOARD_OG_FILE;
	}
    public int getBOARD_NUM() {
        return BOARD_NUM;
    }

    public void setBOARD_NUM(int BOARD_NUM) {
        this.BOARD_NUM = BOARD_NUM;
    }

    public String getBOARD_ID() {
        return BOARD_ID;
    }

    public void setBOARD_ID(String BOARD_ID) {
        this.BOARD_ID = BOARD_ID;
    }

    public String getBOARD_SUBJECT() {
        return BOARD_SUBJECT;
    }

    public void setBOARD_SUBJECT(String BOARD_SUBJECT) {
        this.BOARD_SUBJECT = BOARD_SUBJECT;
    }

    public String getBOARD_CONTENT() {
        return BOARD_CONTENT;
    }

    public void setBOARD_CONTENT(String BOARD_CONTENT) {
        this.BOARD_CONTENT = BOARD_CONTENT;
    }

    public int getBOARD_RE_REF() {
        return BOARD_RE_REF;
    }

    public void setBOARD_RE_REF(int BOARD_RE_REF) {
        this.BOARD_RE_REF = BOARD_RE_REF;
    }

    public int getBOARD_RE_LEV() {
        return BOARD_RE_LEV;
    }

    public void setBOARD_RE_LEV(int BOARD_RE_LEV) {
        this.BOARD_RE_LEV = BOARD_RE_LEV;
    }

    public int getBOARD_RE_SEQ() {
        return BOARD_RE_SEQ;
    }

    public void setBOARD_RE_SEQ(int BOARD_RE_SEQ) {
        this.BOARD_RE_SEQ = BOARD_RE_SEQ;
    }

    public int getBOARD_READCOUNT() {
        return BOARD_READCOUNT;
    }

    public void setBOARD_READCOUNT(int BOARD_READCOUNT) { this.BOARD_READCOUNT = BOARD_READCOUNT; }

    public Date getBOARD_DATE() { return BOARD_DATE; }

    public void setBOARD_DATE(Date BOARD_DATE) { this.BOARD_DATE = BOARD_DATE; }
}
