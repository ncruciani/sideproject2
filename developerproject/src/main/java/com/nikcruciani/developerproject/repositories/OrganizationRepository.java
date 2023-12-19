package com.nikcruciani.developerproject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.nikcruciani.developerproject.models.Organization;

public interface OrganizationRepository extends CrudRepository<Organization, Long> {
    Optional<Organization> findByEmail(String email);
    
	List<Organization> findByUsersId(Long usersId);
	List<Organization> findByPositionsId(Long positionsId);

}