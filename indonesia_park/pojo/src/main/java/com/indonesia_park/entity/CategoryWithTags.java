package com.indonesia_park.entity;

import com.indonesia_park.vo.TagVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryWithTags implements Serializable {

    private static final long serialVersionUID = 1L;

    private String categoryName;
    private List<TagVO> tags;
}