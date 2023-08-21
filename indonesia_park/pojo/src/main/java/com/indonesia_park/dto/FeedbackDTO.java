package com.indonesia_park.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class FeedbackDTO {
    private Long parkId;
    private String parkName;
    private Long tagId;
    private String tagName;
    private String feedbackContent;
    private LocalDateTime createTime; //创建时间
    private LocalDateTime updateTime; //修改时间
    private Integer createUser;
    private Integer updateUser;
}
