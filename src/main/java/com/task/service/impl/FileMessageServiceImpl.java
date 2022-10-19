package com.task.service.impl;

import com.task.dao.FileMessageDao;
import com.task.domain.FileMessage;
import com.task.service.FileMessageService;
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
public class FileMessageServiceImpl implements FileMessageService {
    @Autowired
    private FileMessageDao fileMessageDao;

    @Override
    public int addFile(FileMessage file) {
        return fileMessageDao.addFile(file);
    }

    @Override
    public List<FileMessage> getAllFiles() {
        return fileMessageDao.getAllFiles();
    }

    @Override
    public int getCount() {
        return fileMessageDao.getCount();
    }

    @Override
    public FileMessage getFileById(int id) {
        return fileMessageDao.getFileById(id);
    }

    @Override
    public List<FileMessage> getAllFile(int pageInteger, int limitInteger) {
        int pageIndex = (pageInteger - 1) * limitInteger;
        int pageSize = limitInteger;
        return fileMessageDao.getAllFile(pageIndex, pageSize);
    }

    @Override
    public List<FileMessage> getFileByType(int fid) {
        return fileMessageDao.getFileByType(fid);
    }

    @Override
    public int deleteFile(Integer id) {
        return fileMessageDao.deleteFile(id);
    }
}
