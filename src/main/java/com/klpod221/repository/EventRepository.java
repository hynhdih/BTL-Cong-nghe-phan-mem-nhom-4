package com.klpod221.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.klpod221.model.EventModel;

@Repository
public interface EventRepository extends CrudRepository<EventModel, Long> {
    List<EventModel> findAll();

    List<EventModel> findByOrderById();

    List<EventModel> findByOrderByIdDesc();

    List<EventModel> findByIsActiveOrderByIdDesc(int status);

    @Query(value="SELECT * FROM events u WHERE ((u.name LIKE %:search%) OR (u.description LIKE %:search%) OR (u.location LIKE %:search%) OR (u.famous_person LIKE %:search%) OR (u.free_food LIKE %:search%)) ORDER BY id DESC", nativeQuery = true)
    List<EventModel> customSearchOnly(@Param("search") String search);

    @Query(value="SELECT * FROM events u WHERE ((u.name LIKE %:search%) OR (u.description LIKE %:search%) OR (u.location LIKE %:search%) OR (u.famous_person LIKE %:search%) OR (u.free_food LIKE %:search%)) AND (u.is_active = :status) ORDER BY id DESC", nativeQuery = true)
    List<EventModel> customSearchWithStatus(@Param("search") String search, @Param("status") int searchStatus);

    @Query(value="SELECT * FROM events u WHERE ((u.name LIKE %:search%) OR (u.description LIKE %:search%) OR (u.location LIKE %:search%) OR (u.famous_person LIKE %:search%) OR (u.free_food LIKE %:search%)) AND (u.is_active = 1) ORDER BY id DESC", nativeQuery = true)
    List<EventModel> userCustomSearch(@Param("search") String search);
}
