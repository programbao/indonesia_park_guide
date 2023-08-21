package com.indonesia_park.service.impl;

import com.indonesia_park.dto.FeedbackDTO;
import com.indonesia_park.mapper.FeedbackMapper;
import com.indonesia_park.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackMapper feedbackMapper;

    @Override
    public void addFeedback(FeedbackDTO feedbackDTO) {
        feedbackDTO.setCreateTime(LocalDateTime.now());
        feedbackDTO.setUpdateTime(LocalDateTime.now());
        feedbackDTO.setCreateUser(1);
        feedbackDTO.setUpdateUser(1);
        feedbackMapper.addFeedback(feedbackDTO);
    }
}
