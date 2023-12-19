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
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message = "First name is required.")
	@Size(min = 1, max = 30, message = "First name must be between 3 and 30 characters")
	@Column(name = "first_name")
	private String firstName;
	@NotEmpty(message= "Last name is required.")
	@Size(min=1, max=30, message= "Last name must be between 3 and 30 characters")
	@Column(name = "last_name")
	private String lastName;

	@NotEmpty(message = "Email is required!")
	@Email(message = "Please enter a valid email!")
	private String email;
	@NotEmpty(message = "Address is required.")
	@Size(min=1, max=50, message = "Address must be between 3 and 50 characters")
	private String address;
	@NotEmpty(message = "City is required.")
	private String city;


	private String state;
	@NotEmpty(message = "Password is required!")
	@Size(min = 5, max = 128, message = "Password must be between 8 and 128 characters")
	private String password;

	@Transient
	@NotEmpty(message = "Confirm Password is required!")
	@Size(min = 5, max = 128, message = "Confirm Password must be between 8 and 128 characters")
	private String confirm;
	private String bio;
    private String skills;
	private String frames;
    @Column(updatable=false, name="created_at")
    private Date createdAt;
    @Column(updatable=false, name="updated_at")
    private Date updatedAt;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "organization_id")
    private Organization organization;


	public User() {
	}
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
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
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getFrames() {
		return frames;
	}
	public void setFrames(String frames) {
		this.frames = frames;
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