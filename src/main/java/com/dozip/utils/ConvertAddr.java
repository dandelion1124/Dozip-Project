package com.dozip.utils;

import org.jetbrains.annotations.NotNull;

public class ConvertAddr {
    private String est_addr;
    public ConvertAddr(String est_addr) {
        this.est_addr=est_addr;
    }

    public String convert() {
        return getString();
    }//주소 변환 출력용
    public String convert_db() {
        return getString();
    }//주소 변환 db검색용

    @NotNull
    private String getString() {
        String str[] = est_addr.split(" ");
        if (est_addr.contains("서울") || est_addr.contains("부산") || est_addr.contains("대구") || est_addr.contains("인천") || est_addr.contains("광주") ||
                est_addr.contains("대전") || est_addr.contains("울산") || est_addr.contains("부산") || est_addr.contains("세종")) {
            est_addr = str[0] + " " + str[1];
        } else {
            est_addr = str[1] + " " + str[2];
        }
        return est_addr;
    }
}



