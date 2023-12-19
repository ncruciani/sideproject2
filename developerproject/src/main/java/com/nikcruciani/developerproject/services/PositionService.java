package com.nikcruciani.developerproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nikcruciani.developerproject.models.Position;
import com.nikcruciani.developerproject.repositories.PositionRepository;

@Service
public class PositionService {
	@Autowired
	private PositionRepository positionRepo;
	public Position findById(Long id) {
		Optional<Position> potentialPosition = positionRepo.findById(id);

		if (potentialPosition.isPresent()) {
			return potentialPosition.get();
		} else {
			return null;
		}
	}

	public Position create(Position position) {
		return positionRepo.save(position);
	}

	public List<Position> findAllPositions() {
		return positionRepo.findAll();
	}

}
