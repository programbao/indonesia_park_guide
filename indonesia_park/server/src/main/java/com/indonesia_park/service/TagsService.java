package com.indonesia_park.service;

import com.indonesia_park.entity.CategoryWithTags;
import com.indonesia_park.vo.TagVO;

import java.util.List;
import java.util.Map;

public interface TagsService {
    List<CategoryWithTags> getCategoriesWithTags();
}
