package com.task.service;

import com.task.domain.FileType;

import java.util.List;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.service
 * @date 2022/10/18 13:01
 */
public interface FileTypeService {
    FileType getFileTypeById(int id);

    List<FileType> getFileType();
}
