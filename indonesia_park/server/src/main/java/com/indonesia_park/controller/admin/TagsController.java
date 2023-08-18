package com.indonesia_park.controller.admin;

import com.indonesia_park.entity.CategoryWithTags;
import com.indonesia_park.result.Result;
import com.indonesia_park.service.TagsService;
import com.indonesia_park.vo.TagVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/tags")
public class TagsController {

    @Autowired
    private TagsService tagsService;

    @GetMapping("/getCategoriesWithTags")
    public Result<List<CategoryWithTags>> list() {
        List<CategoryWithTags> data = tagsService.getCategoriesWithTags();
        return Result.success(data);
    }
}
