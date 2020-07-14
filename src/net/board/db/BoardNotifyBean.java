package net.board.db;

import java.sql.Date;

public class BoardNotifyBean {
    private int NB_NUM;
    private String NB_CONTENT;
    private String NB_ID;
    private Date NB_DATE;
    private int NB_RE_REF;
    private String NB_PROGRESS;
    private String NB_REASON;
    private String NB_TARGET_ID;

    public String getNB_TARGET_ID() {
        return NB_TARGET_ID;
    }

    public void setNB_TARGET_ID(String NB_TARGET_ID) {
        this.NB_TARGET_ID = NB_TARGET_ID;
    }

    public int getNB_NUM() {
        return NB_NUM;
    }

    public void setNB_NUM(int NB_NUM) {
        this.NB_NUM = NB_NUM;
    }

    public String getNB_CONTENT() {
        return NB_CONTENT;
    }

    public void setNB_CONTENT(String NB_CONTENT) {
        this.NB_CONTENT = NB_CONTENT;
    }

    public String getNB_ID() {
        return NB_ID;
    }

    public void setNB_ID(String NB_ID) {
        this.NB_ID = NB_ID;
    }

    public Date getNB_DATE() {
        return NB_DATE;
    }

    public void setNB_DATE(Date NB_DATE) {
        this.NB_DATE = NB_DATE;
    }

    public int getNB_RE_REF() {
        return NB_RE_REF;
    }

    public void setNB_RE_REF(int NB_RE_REF) {
        this.NB_RE_REF = NB_RE_REF;
    }

    public String getNB_PROGRESS() {
        return NB_PROGRESS;
    }

    public void setNB_PROGRESS(String NB_PROGRESS) {
        this.NB_PROGRESS = NB_PROGRESS;
    }

    public String getNB_REASON() {
        return NB_REASON;
    }

    public void setNB_REASON(String NB_REASON) {
        this.NB_REASON = NB_REASON;
    }
}
