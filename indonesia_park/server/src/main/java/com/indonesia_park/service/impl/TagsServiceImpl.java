package com.indonesia_park.service.impl;

import com.indonesia_park.entity.Category;
import com.indonesia_park.entity.CategoryWithTags;
import com.indonesia_park.mapper.CategoryMapper;
import com.indonesia_park.mapper.TagsMapper;
import com.indonesia_park.service.TagsService;
import com.indonesia_park.vo.TagVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class TagsServiceImpl implements TagsService {
    @Autowired
    private TagsMapper tagsMapper;

    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public List<CategoryWithTags> getCategoriesWithTags() {
        List<Category> categories = categoryMapper.list();
        List<TagVO> tags = tagsMapper.getAllTags(); // 使用TagVO

        List<CategoryWithTags> result = new ArrayList<>();
        for (Category category : categories) {
            List<TagVO> categoryTags = tags.stream()
                    .filter(tag -> tag.getCategoryId().equals(category.getId()))
                    .collect(Collectors.toList());

            CategoryWithTags categoryWithTags = new CategoryWithTags(category.getName(), categoryTags);
            result.add(categoryWithTags);
        }

        return result;
    }
}
