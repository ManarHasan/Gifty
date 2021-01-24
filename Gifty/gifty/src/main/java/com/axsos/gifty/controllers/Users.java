package com.axsos.gifty.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.axsos.gifty.models.Cart;
import com.axsos.gifty.models.FileUploadUtil;
import com.axsos.gifty.models.Price;
import com.axsos.gifty.models.Product;
import com.axsos.gifty.models.Provider;
import com.axsos.gifty.models.User;
import com.axsos.gifty.repositories.ProductRepository;
import com.axsos.gifty.repositories.ProviderRepository;
import com.axsos.gifty.services.AppService;
import com.axsos.gifty.services.UserService;

@Controller
public class Users {
    private UserService userService;
    private final ProviderRepository providerRepo;
    private final AppService aService;
    private final ProductRepository productRepo;
    
    
    public Users(UserService userService, ProviderRepository providerRepo, AppService aService, ProductRepository productRepo) {
        this.userService = userService;
        this.providerRepo = providerRepo;
        this.aService = aService;
        this.productRepo = productRepo;
    }
    
    @RequestMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "registrationPage.jsp";
    }
    
    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, @RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("passwordConfirmation") String confirm, Model model, HttpSession session) {
        if (result.hasErrors()) {
            return "registrationPage.jsp";
        }
        List<User> users = userService.findAll();
        for(int i = 0; i<users.size();i++) {
        	if(users.get(i).getEmail().equals(email)) {
            	model.addAttribute("errors", "This email already exists!");
            	 return "registrationPage.jsp";
            }
        }
        if(password.length() < 5) {
        	model.addAttribute("errors", "This password is too short");
        	return "registrationPage.jsp";
        }
        if(!password.equals(confirm)) {
        	model.addAttribute("errors", "Passwords dont match!");
        	return "registrationPage.jsp";
        }
        Cart cart = new Cart();
        aService.createCart(cart);
        user.setCart(cart);
        userService.saveUserWithAdminRole(user);
        cart.setUser(user);
        aService.createCart(cart);
        session.setAttribute("user_id", user.getId());
        return "redirect:/login";
    }
    @RequestMapping("/admin")
    public String adminPage(@ModelAttribute("product") Product product, @ModelAttribute("provider") Provider provider, Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        List<Provider> providers = (List<Provider>) providerRepo.findAll();
        List<Product> products = productRepo.findAll();
        model.addAttribute("providers", providers);
        model.addAttribute("products", products);
        return "adminPage.jsp";
    }
    @PostMapping("/add/product")
    public String addProduct(@ModelAttribute("product") Product product) {
    	aService.createProduct(product);
    	Price price_1 = new Price(10, product, 10);
    	aService.createPrice(price_1);
    	Price price_2 = new Price(20, product, 10);
    	aService.createPrice(price_2);
    	Price price_3 = new Price(50, product, 10);
    	aService.createPrice(price_3);
    	Price price_4 = new Price(100, product, 10);
    	aService.createPrice(price_4);
    	
    	return "redirect:/admin";
    }
    @PostMapping("/add/provider")
    public String addProvider(@ModelAttribute("provider") Provider provider, @RequestParam("image") MultipartFile multipartFile) throws IOException {
    	String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        provider.setPhotos(fileName);
        Provider thisProvider = aService.createProvider(provider);
        String uploadDir = "user-photos/" + thisProvider.getId();
        FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
    	aService.createProvider(provider);
    	return "redirect:/admin";
    }
    @RequestMapping("/login")
    public String login(HttpSession session, @RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "loginPage.jsp";
    }

}