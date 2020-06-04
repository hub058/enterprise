package com.enterprise.controller.front;

import com.enterprise.cache.FrontCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 招聘
 */
@Controller("recruitmentActionController")
@RequestMapping("/")
public class RecruitmentAction {

    @Autowired
    private FrontCache frontCache;

    /**
     * 跳转到“招聘”页面
     * @return
     * @throws Exception
     */
    @RequestMapping("recruitment")
    public String recruitment() throws Exception {
        return frontCache.getSyle() + "/recruitment/recruitmentList";
    }
}
