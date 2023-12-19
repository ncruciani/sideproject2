package com.nikcruciani.developerproject.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.nikcruciani.developerproject.models.LoginOrganization;
import com.nikcruciani.developerproject.models.Organization;
import com.nikcruciani.developerproject.repositories.OrganizationRepository;

@Service
public class OrganizationService {
    @Autowired
    private OrganizationRepository organizationRepo;

    public Organization register(Organization newOrganization, BindingResult result) {
        Optional<Organization> existingOrganization = organizationRepo.findByEmail(newOrganization.getEmail());
        if (existingOrganization.isPresent()) {
            result.rejectValue("email", "Matches", "Another Organization already has this email.");
        } else {
            if (!newOrganization.getPassword().equals(newOrganization.getConfirm())) {
                result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
            }

            if (result.hasErrors()) {
                return null;
            } else {

                String hashed = BCrypt.hashpw(newOrganization.getPassword(), BCrypt.gensalt());
                newOrganization.setPassword(hashed);
                Organization savedOrganization = organizationRepo.save(newOrganization);
                return savedOrganization != null ? savedOrganization : null;
            }
        }
        return null;
    }

    public Organization login(LoginOrganization newLoginOrganization, BindingResult result) {
        Optional<Organization> existingOrganization = organizationRepo.findByEmail(newLoginOrganization.getEmail());

        if (!existingOrganization.isPresent()) {
            result.rejectValue("email", "Not Found", "Organization not found!");
            return null;
        } else {
        	Organization organization = existingOrganization.get();

            if (!BCrypt.checkpw(newLoginOrganization.getPassword(), organization.getPassword())) {
                result.rejectValue("password", "Invalid", "Invalid Password!");
                return null;
            } else {
                return organization;
            }
        }
    }

    public Organization findById(Long id) {
        Optional<Organization> potentialOrganization = organizationRepo.findById(id);

        if (potentialOrganization.isPresent()) {
            return potentialOrganization.get();
        } else {
            return null;
        }
    }
    
}