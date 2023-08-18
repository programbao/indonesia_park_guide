package com.indonesia_park.service;

import com.indonesia_park.entity.Category;

import java.util.List;

public interface CategoryService {
    /**
     * 分类列表
     * @return
     */
    List<Category> list();
}
