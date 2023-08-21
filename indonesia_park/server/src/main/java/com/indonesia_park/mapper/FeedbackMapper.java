package com.indonesia_park.mapper;

import com.indonesia_park.dto.FeedbackDTO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FeedbackMapper {
    @Insert("insert into feedback(park_id, park_name, tag_id, tag_name, feedback_content, create_time, update_time, create_user, update_user)" +
            "values(#{parkId}, #{parkName}, #{tagId}, #{tagName}, #{feedbackContent}, #{createTime}, #{updateTime}, #{createUser}, #{updateUser})")
    void addFeedback(FeedbackDTO feedbackDTO);
}
