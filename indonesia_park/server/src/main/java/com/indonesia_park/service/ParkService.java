package com.indonesia_park.service;

import com.indonesia_park.entity.Park;
import com.indonesia_park.vo.ParkVO;

import java.util.List;

public interface ParkService {
    List<ParkVO> list();

    Park getById(Integer id);
}
