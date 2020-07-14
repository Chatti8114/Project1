package net.member.db;

import java.sql.Date;

public class MemberBean {
    private String MEMBER_ID;
    private String MEMBER_PW;
    private String MEMBER_NAME;
    private int MEMBER_AGE;
    private String MEMBER_GENDER;
    private String MEMBER_ADDRESS;
    private String MEMBER_PHONE; /* String으로 줘야한다 (int로 줄 시 앞글자 0으로 못불러옴) */
    private String MEMBER_EMAIL;
    private String MEMBER_INTEREST;
    private Date MEMBER_RECENT_LOGIN;
    private int MEMBER_ROLE;
    private int MEMBER_NOTIFY_COUNT;


    public String getMEMBER_PHONE() {
        return MEMBER_PHONE;
    }

    public void setMEMBER_PHONE(String MEMBER_PHONE) {
        this.MEMBER_PHONE = MEMBER_PHONE;
    }

    public int getMEMBER_NOTIFY_COUNT() {
        return MEMBER_NOTIFY_COUNT;
    }

    public void setMEMBER_NOTIFY_COUNT(int MEMBER_NOTIFY_COUNT) {
        this.MEMBER_NOTIFY_COUNT = MEMBER_NOTIFY_COUNT;
    }

    public int getMEMBER_ROLE() {
        return MEMBER_ROLE;
    }

    public void setMEMBER_ROLE(int MEMBER_ROLE) {
        this.MEMBER_ROLE = MEMBER_ROLE;
    }

    public String getMEMBER_ID() {
        return MEMBER_ID;
    }

    public void setMEMBER_ID(String MEMBER_ID) {
        this.MEMBER_ID = MEMBER_ID;
    }

    public String getMEMBER_PW() {
        return MEMBER_PW;
    }

    public void setMEMBER_PW(String MEMBER_PW) {
        this.MEMBER_PW = MEMBER_PW;
    }

    public String getMEMBER_NAME() {
        return MEMBER_NAME;
    }

    public void setMEMBER_NAME(String MEMBER_NAME) {
        this.MEMBER_NAME = MEMBER_NAME;
    }

    public int getMEMBER_AGE() {
        return MEMBER_AGE;
    }

    public void setMEMBER_AGE(int MEMBER_AGE) {
        this.MEMBER_AGE = MEMBER_AGE;
    }

    public String getMEMBER_GENDER() {
        return MEMBER_GENDER;
    }

    public void setMEMBER_GENDER(String MEMBER_GENDER) {
        this.MEMBER_GENDER = MEMBER_GENDER;
    }

    public String getMEMBER_ADDRESS() {
        return MEMBER_ADDRESS;
    }

    public void setMEMBER_ADDRESS(String MEMBER_ADDRESS) {
        this.MEMBER_ADDRESS = MEMBER_ADDRESS;
    }


    public String getMEMBER_EMAIL() {
        return MEMBER_EMAIL;
    }

    public void setMEMBER_EMAIL(String MEMBER_EMAIL) {
        this.MEMBER_EMAIL = MEMBER_EMAIL;
    }

    public String getMEMBER_INTEREST() {
        return MEMBER_INTEREST;
    }

    public void setMEMBER_INTEREST(String MEMBER_INTEREST) {
        this.MEMBER_INTEREST = MEMBER_INTEREST;
    }

    public Date getMEMBER_RECENT_LOGIN() {
        return MEMBER_RECENT_LOGIN;
    }

    public void setMEMBER_RECENT_LOGIN(Date MEMBER_RECENT_LOGIN) {
        this.MEMBER_RECENT_LOGIN = MEMBER_RECENT_LOGIN;
    }
}
