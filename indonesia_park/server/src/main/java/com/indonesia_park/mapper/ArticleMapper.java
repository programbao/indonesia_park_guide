package com.indonesia_park.mapper;

import com.indonesia_park.entity.Article;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ArticleMapper {

    @Select("select * from article where tag_id = #{tagId} and park_id = #{parkId}")
    Article getArticle(Integer tagId, Integer parkId);
}
