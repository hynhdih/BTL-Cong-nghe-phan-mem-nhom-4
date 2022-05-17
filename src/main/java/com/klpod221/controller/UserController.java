package com.klpod221.controller;

import java.util.List;

import com.klpod221.model.EventModel;
import com.klpod221.service.EventService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    @Autowired
    private EventService eventService;
// Trang home
    @RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
    public String home() {
        return "home";
    }
// Danh sach su kien
    @RequestMapping(value = "/events", method = RequestMethod.GET)
    public String events(Model model) {
        List<EventModel> events = eventService.userPageGetAllEvent();
        model.addAttribute("events", events);
        return "events";
    }
// Tim kiem o phia user
    @RequestMapping(value = "/events/search", method = RequestMethod.GET)
    public String users(String search, Model model) {
        List<EventModel> events = eventService.userPageSearchEvent(search);
        model.addAttribute("events", events);
        model.addAttribute("search", search);
        return "events";
    }
}
