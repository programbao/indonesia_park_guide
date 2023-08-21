package com.indonesia_park.service;

import com.indonesia_park.entity.Article;

public interface ArticleService {
    Article getArticle(Integer tagId, Integer parkId);
}
