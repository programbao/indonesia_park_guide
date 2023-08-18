package com.indonesia_park.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ParkVO implements Serializable {
    private Long id;
    private String name;
    private String image;
    private String description;
    private Integer status;
    private String infoSource;
}
