package com.indonesia_park.service.impl;

import com.indonesia_park.entity.Category;
import com.indonesia_park.mapper.CategoryMapper;
import com.indonesia_park.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public List<Category> list() {
        return categoryMapper.list();
    }
}
