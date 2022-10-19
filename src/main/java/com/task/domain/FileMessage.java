package com.task.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.domain
 * @date 2022/10/18 12:56
 */
public class FileMessage {
    private Integer id;
    private String realName;
    private String pathName;
    private Date uploadTime;
    private double fileSize;
    private Integer fid;
    private FileType fileType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPathName() {
        return pathName;
    }

    public void setPathName(String pathName) {
        this.pathName = pathName;
    }

    //    @JsonSerialize(using = JsonDateTypeConvert.class)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public double getFileSize() {
        return fileSize;
    }

    public void setFileSize(double fileSize) {
        this.fileSize = fileSize;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public FileType getFileType() {
        return fileType;
    }

    public void setFileType(FileType fileType) {
        this.fileType = fileType;
    }

    @Override
    public String toString() {
        return "FileMessage{" +
                "id=" + id +
                ", realName='" + realName + '\'' +
                ", pathName='" + pathName + '\'' +
                ", uploadTime=" + uploadTime +
                ", fileSize=" + fileSize +
                ", fid=" + fid +
                ", fileType=" + fileType +
                '}';
    }

    public FileMessage() {
    }

    public FileMessage(Integer id, String realName, String pathName, Date uploadTime, double fileSize, Integer fid, FileType fileType) {
        this.id = id;
        this.realName = realName;
        this.pathName = pathName;
        this.uploadTime = uploadTime;
        this.fileSize = fileSize;
        this.fid = fid;
        this.fileType = fileType;
    }
}
