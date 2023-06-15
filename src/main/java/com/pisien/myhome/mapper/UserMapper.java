package com.pisien.myhome.mapper;

import com.pisien.myhome.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {

    List<User> getUsers(@Param("text") String text);

}
