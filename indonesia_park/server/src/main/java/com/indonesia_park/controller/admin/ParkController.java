package com.indonesia_park.controller.admin;

import com.indonesia_park.entity.Park;
import com.indonesia_park.result.Result;
import com.indonesia_park.service.ParkService;
import com.indonesia_park.vo.ParkVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RequestMapping("/park")
@RestController
public class ParkController {
    @Autowired
    private ParkService parkService;

    // @RequestMapping(value = "/depts", method = RequestMethod.GET) // 指定请求方式get
    @GetMapping("/list") // 指定请求方式get
    public Result<List<ParkVO>> list() {
        log.info("获取全部园区数据");

        // 调用service查询部门信息
        List<ParkVO> list = parkService.list();

        return Result.success(list);
    }


    /**
     * 获取当个园区信息
     */
    @GetMapping("/{id}")
    public Result<Park> get(@PathVariable Integer id) {
        Park park = parkService.getById(id);
        return Result.success(park);
    }

    /**
     * 内容提示
     */
    @GetMapping("/contentTips")
    public Result<String> contentTips() {
        return Result.success("说明：信息来源来自小红书，贴吧，聊天微信群等渠道；仅供参考。<br>" +
                "<view style='color: #e6a23c;'>期待您的投递内容到2962631411@qq.com<br/>" +
                "能够帮助更多人了解各园区的**情况</view>");
    }
}
