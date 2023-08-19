package com.indonesia_park.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

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
    private String parkIds;

    public List<Integer> getParkIds() {
        if (parkIds == null || parkIds.isEmpty()) {
            return new ArrayList<>();
        }
        return Arrays.stream(parkIds.split(","))
                .map(Integer::valueOf)
                .collect(Collectors.toList());
    }
}
