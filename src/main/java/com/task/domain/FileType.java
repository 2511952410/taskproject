package com.task.domain;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.domain
 * @date 2022/10/18 12:57
 */
public class FileType {
    private Integer id;
    private String name;

    public FileType() {
    }

    public FileType(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
