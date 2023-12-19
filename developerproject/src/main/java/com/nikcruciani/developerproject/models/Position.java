package com.nikcruciani.developerproject.models;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "positions")
public class Position {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotEmpty(message = "Name is required")
	@Size(min = 3, max = 50, message = "Name must be between 3 and 50 characters")
	private String name;
	@NotEmpty(message = "Description is required")
	@Size(min = 3, max = 100, message = "Description must be between 3 and 100 characters")
	private String description;
    @Column(updatable=false, name="created_at")
    private Date createdAt;
    @Column(updatable=false, name="updated_at")
    private Date updatedAt;
	private String skill;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "organization_id")
	private Organization organization;
	public Position() {
	}
	
	public Position(Long id, String name, String description, Date createdAt, Date updatedAt, String skill) {
	    this.id = id;
	    this.name = name;
	    this.description = description;
	    this.createdAt = createdAt;
	    this.updatedAt = updatedAt;
	    this.skill = skill;
	}

	@PrePersist
	protected void onCreate() {
	    Date now = new Date();
	    this.createdAt = now;
	    this.updatedAt = now;
	}
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}


    
    
}