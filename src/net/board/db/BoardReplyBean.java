package net.board.db;

import java.sql.Date;

public class BoardReplyBean {
    private int CB_NUM;
    private String CB_ID;
    private String CB_CONTENT;
    private Date CB_DATE;
    private java.util.Date CB_PRINT_DATE;
    private int CB_RE_REF;
    private int CB_RE_LEV;
    private int CB_RE_SEQ;

    public int getCB_NUM() {
        return CB_NUM;
    }

    public void setCB_NUM(int CB_NUM) {
        this.CB_NUM = CB_NUM;
    }

    public String getCB_ID() {
        return CB_ID;
    }

    public void setCB_ID(String CB_ID) {
        this.CB_ID = CB_ID;
    }

    public String getCB_CONTENT() {
        return CB_CONTENT;
    }

    public void setCB_CONTENT(String CB_CONTENT) {
        this.CB_CONTENT = CB_CONTENT;
    }

    public Date getCB_DATE() {
        return CB_DATE;
    }

    public void setCB_DATE(Date CB_DATE) {
        this.CB_DATE = CB_DATE;
    }

    public java.util.Date getCB_PRINT_DATE() {
        return CB_PRINT_DATE;
    }

    public void setCB_PRINT_DATE(java.util.Date CB_PRINT_DATE) {
        this.CB_PRINT_DATE = CB_PRINT_DATE;
    }

    public int getCB_RE_REF() {
        return CB_RE_REF;
    }

    public void setCB_RE_REF(int CB_RE_REF) {
        this.CB_RE_REF = CB_RE_REF;
    }

    public int getCB_RE_LEV() {
        return CB_RE_LEV;
    }

    public void setCB_RE_LEV(int CB_RE_LEV) {
        this.CB_RE_LEV = CB_RE_LEV;
    }

    public int getCB_RE_SEQ() {
        return CB_RE_SEQ;
    }

    public void setCB_RE_SEQ(int CB_RE_SEQ) {
        this.CB_RE_SEQ = CB_RE_SEQ;
    }
}
