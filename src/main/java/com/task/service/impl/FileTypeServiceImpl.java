package com.task.service.impl;

import com.task.dao.FileTypeDao;
import com.task.domain.FileType;
import com.task.service.FileTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.service.impl
 * @date 2022/10/18 13:01
 */
@Service
public class FileTypeServiceImpl implements FileTypeService {
    @Autowired
    private FileTypeDao fileTypeDao;
    @Override
    public FileType getFileTypeById(int id) {
        return fileTypeDao.getFileTypeById(id);
    }



    @Override
    public List<FileType> getFileType() {
        return fileTypeDao.getFileType();
    }
}
