package com.indonesia_park.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TagVO implements Serializable {
    private Long id;
    private Long categoryId;
    private String name;
    private String image;
    private String icon;
    private Integer sort;
    private Integer status;
}
