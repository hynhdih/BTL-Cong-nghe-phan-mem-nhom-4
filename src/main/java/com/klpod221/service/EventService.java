package com.klpod221.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.klpod221.model.EventModel;
import com.klpod221.repository.EventRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EventService {
    
    @Autowired
    private EventRepository eventRepository;

    public void save(EventModel event) {
        event.setIsActive(1);
        eventRepository.save(event);
    }

    public void update(EventModel event) {
        eventRepository.save(event);
    }

    public List<EventModel> findAll() {
        this.disableOutdatedEvent();
        return (List<EventModel>) eventRepository.findByOrderByIdDesc();
    }

    public EventModel findOne(Long id) {
        return eventRepository.findOne(id);
    }

    public List<EventModel> search(String search, int searchStatus) {
        this.disableOutdatedEvent();
        if(search.equals(""))
            if(searchStatus == -1)
                return (List<EventModel>) eventRepository.findByOrderByIdDesc();
            else
                return (List<EventModel>) eventRepository.findByIsActiveOrderByIdDesc(searchStatus);
        else
            if(searchStatus == -1)
                return (List<EventModel>) eventRepository.customSearchOnly(search);
            else
                return (List<EventModel>) eventRepository.customSearchWithStatus(search, searchStatus);
    }

    public void delete(Long id) {
        eventRepository.delete(id);
    }

    public List<EventModel> userPageGetAllEvent() {
        this.disableOutdatedEvent();
        return (List<EventModel>) eventRepository.findByIsActiveOrderByIdDesc(1);
    }

    public List<EventModel> userPageSearchEvent(String search) {
        this.disableOutdatedEvent();
        return (List<EventModel>) eventRepository.userCustomSearch(search);
    }

    private void disableOutdatedEvent() {
        List<EventModel> events = eventRepository.findByOrderByIdDesc();
        for (EventModel event : events) {
            if (this.parseDatetimeAndCompareWithToday(event.getEndDatetime())){
                event.setIsActive(0);
                eventRepository.save(event);
            }
        }
    }


    private Boolean parseDatetimeAndCompareWithToday(String datetime) {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm dd/MM/yyyy");
        try {
            Date getDate = sdf.parse(datetime);
            Date today = new Date();
            return getDate.before(today);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return true;
    }
}
