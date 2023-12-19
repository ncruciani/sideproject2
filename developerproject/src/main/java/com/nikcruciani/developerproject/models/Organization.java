package com.nikcruciani.developerproject.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "organizations")
public class Organization {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotEmpty(message = "Name is required")
	@Size(min = 3, max = 50, message = "Name must be between 3 and 50 characters")
	private String name;
	@NotEmpty(message = "First name is required.")
	@Size(min = 3, max = 30, message = "First name must be between 3 and 30 characters")
	@Column(name = "first_name")
	private String firstName;
	@NotEmpty(message= "Last name is required.")
	@Size(min=3, max=30, message= "Last name must be between 3 and 30 characters")
	@Column(name = "last_name")
	private String lastName;

	@NotEmpty(message = "Email is required!")
	@Email(message = "Please enter a valid email!")
	private String email;
	@NotEmpty(message = "Address is required.")
	@Size(min=3, max=50, message = "Address must be between 3 and 50 characters")
	private String address;
	@NotEmpty(message = "City is required.")
	@Size(min=3, max=30, message = "City must be between 3 and 30 characters")
	private String city;

	@NotEmpty(message = "State is required.")
	private String state;
	@NotEmpty(message = "Password is required!")
	@Size(min = 5, max = 128, message = "Password must be between 8 and 128 characters")
	private String password;

	@Transient
	@NotEmpty(message = "Confirm Password is required!")
	@Size(min = 5, max = 128, message = "Confirm Password must be between 8 and 128 characters")
	private String confirm;
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @OneToMany(mappedBy = "organization", fetch = FetchType.LAZY)
    private List<User> users;

    @OneToMany(mappedBy = "organization", fetch = FetchType.LAZY)
    private List<Position> positions;

    public Organization() {
    	
    	
    }
    
    public Organization(Long id , String name , String FirstName , String lastName , String email , String address,  String city , String State , String password , String confirm , Date createdAt , Date updatedAt, @NotEmpty(message = "First name is required.") @Size(min = 3, max = 30, message = "First name must be between 3 and 30 characters") String firstName, @NotEmpty(message = "State is required.") String state) {
    	this.id = id;
    	this.name = name;
    	this.firstName = firstName;
    	this.lastName = lastName;
    	this.email = email;
    	this.address = address;
    	this.city = city;
    	this.state = state;
    	this.password = password;
    	this.confirm = confirm;
    	this.createdAt = createdAt;
    	this.updatedAt = updatedAt;
    	
    }
    
    @PrePersist
    protected void onCreate(){
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

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<Position> getPositions() {
		return positions;
	}

	public void setPositions(List<Position> positions) {
		this.positions = positions;
	}



    
}