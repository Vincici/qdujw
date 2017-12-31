package com.jw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author mioko
 */
@Controller
public class frame {

    @RequestMapping(value = "/top/{userName}/{token}")
    public ModelAndView top(@PathVariable("userName") String userName, @PathVariable("token") String token) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("userName", userName);
        mav.addObject("token", token);
        mav.setViewName("commons/topbar");
        return mav;
    }

    @RequestMapping(value = "/index/{userName}/{token}")
    public ModelAndView index(@PathVariable("userName") String userName, @PathVariable("token") String token) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("userName", userName);
        mav.addObject("token", token);
        mav.setViewName("commons/index");
        return mav;
    }


    @RequestMapping(value = "/loading")
    public ModelAndView loading() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("commons/loading");
        return mav;
    }

    @RequestMapping(value = "/footer")
    public ModelAndView footer() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("commons/footer");
        return mav;
    }
}
