package com.nikcruciani.developerproject.repositories;


import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nikcruciani.developerproject.models.Position;

public interface PositionRepository extends CrudRepository<Position , Long> {

	List<Position> findAll();



}