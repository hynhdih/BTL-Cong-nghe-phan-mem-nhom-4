package com.klpod221.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@Entity
@Table(name = "events")
@EnableJpaAuditing
public class EventModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "start_datetime")
    private String startDatetime;

    @Column(name = "end_datetime")
    private String endDatetime;

    @Column(name = "location")
    private String location;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "famous_person")
    private String famousPerson;

    @Column(name = "free_food")
    private String freeFood;

    @Column(name = "is_active")
    private int isActive;

    public EventModel() {
    }

    public EventModel(Long id, String name, String description, String startDatetime, String endDatetime,
            String location, String imageUrl, String famousPerson, String freeFood, int isActive) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.startDatetime = startDatetime;
        this.endDatetime = endDatetime;
        this.location = location;
        this.imageUrl = imageUrl;
        this.famousPerson = famousPerson;
        this.freeFood = freeFood;
        this.isActive = isActive;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStartDatetime() {
        return this.startDatetime;
    }

    public void setStartDatetime(String startDatetime) {
        this.startDatetime = startDatetime;
    }

    public String getEndDatetime() {
        return this.endDatetime;
    }

    public void setEndDatetime(String endDatetime) {
        this.endDatetime = endDatetime;
    }

    public String getLocation() {
        return this.location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getImageUrl() {
        return this.imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getFamousPerson() {
        return this.famousPerson;
    }

    public void setFamousPerson(String famousPerson) {
        this.famousPerson = famousPerson;
    }

    public String getFreeFood() {
        return this.freeFood;
    }

    public void setFreeFood(String freeFood) {
        this.freeFood = freeFood;
    }

    public int getIsActive() {
        return this.isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public EventModel id(Long id) {
        setId(id);
        return this;
    }

    public EventModel name(String name) {
        setName(name);
        return this;
    }

    public EventModel description(String description) {
        setDescription(description);
        return this;
    }

    public EventModel startDatetime(String startDatetime) {
        setStartDatetime(startDatetime);
        return this;
    }

    public EventModel endDatetime(String endDatetime) {
        setEndDatetime(endDatetime);
        return this;
    }

    public EventModel location(String location) {
        setLocation(location);
        return this;
    }

    public EventModel imageUrl(String imageUrl) {
        setImageUrl(imageUrl);
        return this;
    }

    public EventModel famousPerson(String famousPerson) {
        setFamousPerson(famousPerson);
        return this;
    }

    public EventModel freeFood(String freeFood) {
        setFreeFood(freeFood);
        return this;
    }

    public EventModel isActive(int isActive) {
        setIsActive(isActive);
        return this;
    }
}
