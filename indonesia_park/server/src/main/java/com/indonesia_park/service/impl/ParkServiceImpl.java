package com.indonesia_park.service.impl;

import com.indonesia_park.entity.Park;
import com.indonesia_park.mapper.ParkMapper;
import com.indonesia_park.service.ParkService;
import com.indonesia_park.vo.ParkVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParkServiceImpl implements ParkService {

    @Autowired
    private ParkMapper parkMapper;
    @Override
    public List<ParkVO> list() {
        return parkMapper.list();
    }

    @Override
    public Park getById(Integer id) {
        return parkMapper.getById(id);
    }
}
