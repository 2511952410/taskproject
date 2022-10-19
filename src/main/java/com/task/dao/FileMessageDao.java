package com.task.dao;

import com.task.domain.FileMessage;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.dao
 * @date 2022/10/18 12:58
 */
public interface FileMessageDao {
    @Insert("insert into filemessage(real_name,path_name,upload_time,file_size,filetype_id) values(#{realName},#{pathName},#{uploadTime},#{fileSize},#{fid})")
    int addFile(FileMessage file);

    @Select("select * from filemessage")
    @Results(value = {
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "real_name",property = "realName"),
            @Result(column = "path_name",property = "pathName"),
            @Result(column = "upload_time",property = "uploadTime"),
            @Result(column = "file_size",property = "fileSize"),
            @Result(column = "filetype_id",property = "fid"),
            @Result(property = "fileType",column = "filetype_id",one = @One(select = "com.task.dao.FileTypeDao.getFileTypeById",fetchType = FetchType.DEFAULT)),
    })
    List<FileMessage> getAllFiles();
    @Select("select * from filemessage limit #{param1},#{param2}")
    @Results(value = {
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "real_name",property = "realName"),
            @Result(column = "path_name",property = "pathName"),
            @Result(column = "upload_time",property = "uploadTime"),
            @Result(column = "file_size",property = "fileSize"),
            @Result(column = "filetype_id",property = "fid"),
            @Result(property = "fileType",column = "filetype_id",one = @One(select = "com.task.dao.FileTypeDao.getFileTypeById",fetchType = FetchType.DEFAULT)),
    })
    List<FileMessage> getAllFile(int pageIndex, int pageSize);

    @Select("select * from filemessage where id=#{id}")
    FileMessage getFileById(@Param("id") int id);


    @Select(" select count(*) from filemessage ")
    public int getCount();

    @Select("select * from filemessage where filetype_id=#{fid}")
    List<FileMessage> getFileByType(@Param("fid") int fid);

    @Delete("delete from filemessage where id=#{id}")
    int deleteFile(Integer id);




}
