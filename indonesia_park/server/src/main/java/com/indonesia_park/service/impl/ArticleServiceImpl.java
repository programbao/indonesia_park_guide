package com.indonesia_park.service.impl;

import com.indonesia_park.entity.Article;
import com.indonesia_park.mapper.ArticleMapper;
import com.indonesia_park.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;
    @Override
    public Article getArticle(Integer tagId, Integer parkId) {
        return articleMapper.getArticle(tagId, parkId);
    }
}
