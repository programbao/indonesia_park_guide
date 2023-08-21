package com.indonesia_park.controller.admin;

import com.indonesia_park.dto.FeedbackDTO;
import com.indonesia_park.result.Result;
import com.indonesia_park.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    @PostMapping("/addFeedback")
    public Result addFeedback(@RequestBody FeedbackDTO feedbackDTO){
        feedbackService.addFeedback(feedbackDTO);
        return Result.success();
    };
}
