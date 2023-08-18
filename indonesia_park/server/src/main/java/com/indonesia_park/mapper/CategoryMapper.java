package com.indonesia_park.mapper;

import com.indonesia_park.entity.Category;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CategoryMapper {

    @Select("select * from category order by sort")
    List<Category> list();
}
