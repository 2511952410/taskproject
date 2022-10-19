package com.task.service;

import com.task.domain.FileMessage;

import java.util.List;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.service
 * @date 2022/10/18 13:00
 */
public interface FileMessageService {
    int addFile(FileMessage file);

    List<FileMessage> getAllFiles();
    public int getCount();
    FileMessage getFileById(int id);
    List<FileMessage> getAllFile(int pageInteger, int limitInteger);
    List<FileMessage> getFileByType(int fid);
    int deleteFile(Integer id);
}
