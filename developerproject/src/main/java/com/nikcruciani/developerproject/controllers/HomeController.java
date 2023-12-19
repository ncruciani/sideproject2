package com.nikcruciani.developerproject.controllers;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nikcruciani.developerproject.models.LoginOrganization;
import com.nikcruciani.developerproject.models.LoginUser;
import com.nikcruciani.developerproject.models.Organization;
import com.nikcruciani.developerproject.models.Position;
import com.nikcruciani.developerproject.models.User;
import com.nikcruciani.developerproject.services.OrganizationService;
import com.nikcruciani.developerproject.services.PositionService;
import com.nikcruciani.developerproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
@Controller
public class HomeController {
@Autowired
private UserService userservice;
@Autowired
private OrganizationService organizationservice;
@Autowired
private PositionService positionservice;
@GetMapping("/")
public String index(Model model) {
    model.addAttribute("newUser", new User());
    model.addAttribute("newLogin", new LoginUser());
    return "index.jsp";
}

@PostMapping("/register")
public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
    if (result.hasErrors()) {
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }

    session.setAttribute("user", newUser);

    return "redirect:/language";
}

@GetMapping("/language")
public String language(Model model) {
    model.addAttribute("newUser", new User());
    model.addAttribute("skills", "");
    return "add_languages.jsp";
}

@PostMapping("/language")
public String processLanguage(@RequestParam String skills, @RequestParam String bio, HttpSession session) {
    System.out.println("Skills: " + skills);
    System.out.println("Bio: " + bio);

    session.setAttribute("skills", skills);
    session.setAttribute("bio", bio);

    return "redirect:/framework";
}

@GetMapping("/framework")
public String framework(Model model, HttpSession session) {
    User user = (User) session.getAttribute("user");
    String bio = (String) session.getAttribute("bio");

    if (user == null) {
        user = new User();
        session.setAttribute("user", user);
    }

    user.setBio(bio);

    model.addAttribute("newUser", user);
    model.addAttribute("frames", "");
    return "addskills.jsp";
}

@PostMapping("/framework")
public String processFrame(@RequestParam String frames, HttpSession session) {
    System.out.println("Frames: " + frames);

    session.setAttribute("frames", frames);

    User user = (User) session.getAttribute("user");
    if (user == null) {
        System.out.println("User is null");
    } else {
        
        user.setFrames(frames);
        
       
        String skills = (String) session.getAttribute("skills");
        user.setSkills(skills);

        userservice.saveUser(user);
    }

    return "redirect:/home";
}




@GetMapping("/login")
public String showLoginForm(Model model) {
   model.addAttribute("newLogin", new LoginUser());
   return "dev_login.jsp";
}


@PostMapping("/login")
public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
    User user = userservice.login(newLogin, result);

    if (result.hasErrors()) {
        model.addAttribute("newUser", new User());
        return "dev_login.jsp";
    }

    session.setAttribute("userId", user.getId());

    return "redirect:/home";
}

@GetMapping("/org")
public String organizationindex(Model model) {
model.addAttribute("newOrganization", new Organization());
model.addAttribute("newLoginOrganization", new LoginOrganization());
return "registerorg.jsp";
}

@PostMapping("/register/organization")
public String registerorg(@Valid @ModelAttribute("newOrganization") Organization newOrganization, BindingResult result, Model model,
HttpSession session) {
organizationservice.register(newOrganization, result);

if (result.hasErrors()) {
model.addAttribute("newLoginOrganization", new LoginOrganization());
return "redirect:/";
}

session.setAttribute("organizationId", newOrganization.getId());

return "redirect:/home";
}
@GetMapping("/login/organization")
public String showOrgLoginForm(Model model) {
   model.addAttribute("newLoginOrganization", new LoginOrganization());
   return "org_login.jsp";
}


@PostMapping("/login/organization")
public String login(@Valid @ModelAttribute("newLoginOrganization") LoginOrganization newLoginOrganization, BindingResult result, Model model, HttpSession session) {
    Organization organization = organizationservice.login(newLoginOrganization, result);

    if (result.hasErrors()) {
        model.addAttribute("newOrganization", new Organization());
        return "org_login.jsp";
    }

    session.setAttribute("organizationId", organization.getId());

    return "redirect:/home";
}

@PostMapping("/logout")
public String logout(HttpSession session) {
session.invalidate();
return "redirect:/";
}
@GetMapping("/home")
public String welcome(Model model, HttpSession session) {
    Long userId = (Long) session.getAttribute("userId");
    User user = userId != null ? userservice.findById(userId) : new User();
    List<User> allUsers = userservice.findAllUsers();
    model.addAttribute("user", user);
    model.addAttribute("allUsers", allUsers);
    model.addAttribute("positions", positionservice.findAllPositions());

    
    Long organizationId = (Long) session.getAttribute("organizationId");
    if (organizationId != null) {
        Organization organization = organizationservice.findById(organizationId);
        model.addAttribute("organization", organization);
    }

    return "dashboard.jsp";
}

@GetMapping("/new/position")
public String position(Model model, HttpSession session) {
    
    
    Long organizationId = (Long) session.getAttribute("organizationId");
    if (organizationId == null) {
        return "redirect:/org";
    }

    Organization organization = organizationservice.findById(organizationId);


    model.addAttribute("organization", organization);
    model.addAttribute("positions", new Position());

    return "position.jsp";
}


@PostMapping("/new/position")
public String addPosition(@Valid @ModelAttribute("positions") Position newPosition,
                          BindingResult result,
                          HttpSession session) {
    if (result.hasErrors()) {
        return "position.jsp";
    }

    Long organizationId = (Long) session.getAttribute("organizationId");

    if (organizationId == null) {
        return "redirect:/";
    }

    Organization organization = organizationservice.findById(organizationId);

    newPosition.setOrganization(organization);
    positionservice.create(newPosition);

    return "redirect:/home";
}

@GetMapping("/jobs/{id}")
public String available(Model model, HttpSession session) {
   

   
    List<User> allUsers = userservice.findAllUsers();
    
    model.addAttribute("allUsers", allUsers);


   
    List<Position> positions = positionservice.findAllPositions();
    
    model.addAttribute("positions", positionservice.findAllPositions());

    return "jobs.jsp";
}

}