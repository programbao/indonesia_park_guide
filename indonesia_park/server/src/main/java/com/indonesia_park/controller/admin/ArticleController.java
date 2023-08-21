package com.indonesia_park.controller.admin;

import com.indonesia_park.dto.ArticleDTO;
import com.indonesia_park.entity.Article;
import com.indonesia_park.result.Result;
import com.indonesia_park.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @GetMapping("/getArticle")
    public Result getArticle(Integer tagId, Integer parkId) {
        Article result = articleService.getArticle(tagId, parkId);
        return Result.success(result);
    }
}
