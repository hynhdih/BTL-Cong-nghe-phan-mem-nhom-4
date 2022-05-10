package com.klpod221.controller;

import java.util.List;

import com.klpod221.model.EventModel;
import com.klpod221.service.EventService;
import com.klpod221.service.SecurityService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
    @Autowired
    private SecurityService securityService;

    @Autowired
    private EventService eventService;

    @RequestMapping(value = { "/admin", "/admin/home" }, method = RequestMethod.GET)
    public String home(Model model) {
        if (securityService.isLoggedIn()) {
            List<EventModel> events = eventService.findAll();
            model.addAttribute("events", events);
            return "admin/home";
        } else {
            return "redirect:/admin/login";
        }
    }

    @RequestMapping(value = "/admin/events/create", method = RequestMethod.GET)
    public String events(EventModel request, Model model) {
        if (securityService.isLoggedIn()) {
            try {
                if (request.getName() == null)
                    return "redirect:/admin/home";
                eventService.save(request);
                model.addAttribute("response", "Event created successfully!");
                return "redirect:/admin/home";
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("error", "Error creating event!");
                return "redirect:/admin/home";
            }
        } else {
            return "redirect:/admin/login";
        }
    }

    @RequestMapping(value = "/admin/events/search", method = RequestMethod.GET)
    public String search(String search, int searchStatus, Model model) {
        if (securityService.isLoggedIn()) {
            List<EventModel> events = eventService.search(search, searchStatus);
            model.addAttribute("events", events);
            model.addAttribute("search", search);
            model.addAttribute("searchStatus", searchStatus);
            return "admin/home";
        } else {
            return "redirect:/admin/login";
        }
    }

    @RequestMapping(value = "/admin/events/delete", method = RequestMethod.GET)
    public String delete(Long id, Model model) {
        if (securityService.isLoggedIn()) {
            try {
                eventService.delete(id);
                model.addAttribute("response", "Event deleted successfully!");
                return "redirect:/admin/home";
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("error", "Error deleting event!");
                return "redirect:/admin/home";
            }
        } else {
            return "redirect:/admin/login";
        }
    }

    @RequestMapping(value = "/admin/events/edit", method = RequestMethod.GET)
    public String edit(EventModel request, Model model) {
        if (securityService.isLoggedIn()) {
            try {
                EventModel event = eventService.findOne(request.getId());
                if(event == null){
                    model.addAttribute("error", "Event not found!");
                } else{
                    if (request.getImageUrl().equals(""))
                        request.setImageUrl(event.getImageUrl());
                    eventService.update(request);
                    model.addAttribute("response", "Event updated successfully!");
                }
                return "redirect:/admin/home";
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("error", "Error editing event!");
                return "redirect:/admin/home";
            }
        } else {
            return "redirect:/admin/login";
        }
    }
}
