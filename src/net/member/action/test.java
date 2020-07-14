package net.member.action;

import net.member.base64.base64;

public class test {
    public static void main(String[] args) {
        String a = "1234";
        System.out.println(base64.encrypt64(a));
        a = "1234";
        System.out.println(base64.encrypt256(a,"fiveTeam"));
    }
}
