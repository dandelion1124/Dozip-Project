package com.dozip.utils;

import org.jetbrains.annotations.NotNull;

public class ConvertAddr {
    private String addr;
    public ConvertAddr(String addr) {
        this.addr=addr;
    }

    public String convert() {
        return getString();
    }//주소 변환 출력용
    public String convert_db() {
        return "%"+getString()+"%";
    }//주소 변환 db검색용

    @NotNull
    private String getString() {
        String str[] = addr.split(" ");
        if (addr.contains("서울") || addr.contains("부산") || addr.contains("대구") || addr.contains("인천") || addr.contains("광주") ||
                addr.contains("대전") || addr.contains("울산") || addr.contains("부산") || addr.contains("세종")) {
            addr = str[0] + " " + str[1];
        } else {
            addr = str[1] + " " + str[2];
        }
        return addr;
    }
}



