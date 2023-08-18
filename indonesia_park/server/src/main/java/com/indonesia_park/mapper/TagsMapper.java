package com.indonesia_park.mapper;

import com.indonesia_park.vo.TagVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TagsMapper {

    @Select("select * from tags")
    List<TagVO> getAllTags();
}
