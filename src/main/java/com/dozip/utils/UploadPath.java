package com.dozip.utils;

public class UploadPath {

//#hochul home PC
private String uploadpath="D:\\workspace\\dozip\\src\\main\\resources\\static\\upload\\";
//# hochul laptop PC
// ploadPath=C:\\workspace\\dozip\\src\\main\\resources\\static\\upload\\
//#Yangjihye upload Path
//#uploadPath =C:\\DEV\\IntelliJ_work\\dozip\\src\\main\\resources\\static\\upload\\
//#minwoo photo path
//#uploadPath = C:\\bootcamp\\project\\dozip\\src\\main\\resources\\static\\upload\\
//#uploadPath=C:\\DoZip\\src\\main\\resources\\static\\upload\\
    //private String uploadpath="C:\\workspace\\dozip\\src\\main\\resources\\static\\upload\\";//호철
//    private String uploadpath="C:\\DEV\\IntelliJ_work\\dozip\\src\\main\\resources\\static\\upload\\";//지혜
    public String getPath(){
         this.uploadpath = uploadpath;
        return uploadpath;
    }
}
