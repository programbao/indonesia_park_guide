package com.indonesia_park.mapper;

import com.indonesia_park.entity.Park;
import com.indonesia_park.vo.ParkVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ParkMapper {

    @Select("select * from park")
    List<ParkVO> list();

    @Select("select * from park where id = #{id}")
    Park getById(Integer id);
}
