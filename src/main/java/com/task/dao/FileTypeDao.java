package com.task.dao;

import com.task.domain.FileType;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.dao
 * @date 2022/10/18 12:59
 */
public interface FileTypeDao {
    @Select("select * from filetype where id = #{fid}")
    @Results(value = {
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "name",property = "name"),
    })
    FileType getFileTypeById(@Param("fid") int id);

    @Select("select * from filetype")
    List<FileType> getFileType();
}
