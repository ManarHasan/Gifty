package com.axsos.gifty.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.axsos.gifty.models.Cart;
import com.axsos.gifty.models.FileUploadUtil;
import com.axsos.gifty.models.Item;
import com.axsos.gifty.models.Product;
import com.axsos.gifty.models.Provider;
import com.axsos.gifty.models.User;
import com.axsos.gifty.services.AppService;

import com.axsos.gifty.services.UserService;


@Controller
public class AppController {
	private final AppService aService;
	private final UserService uService;
	
	public AppController (AppService aService, UserService uService) {
		this.aService = aService;
		this.uService = uService;
	}
	@RequestMapping("/")
    public String home(Model model) {
		List<Product> products = aService.findAllProducts();
        model.addAttribute("products", products);
        return "homePage.jsp";
    }
	@RequestMapping("/home")
	public String home(Model model, HttpSession session) {
		if(session.getAttribute("cartQuantity") == null) {
			session.setAttribute("cartQuantity", 0);
		}
		if(session.getAttribute("user_id") == null) {
			session.setAttribute("user_id", 0);
		}
		List<Product> products = aService.findAllProducts();
	    model.addAttribute("products", products);
	    User user = uService.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
	    session.setAttribute("user_id", user.getId());
	    session.setAttribute("role", user.getRoles().get(0).getName());
	    System.out.println(session.getAttribute("role"));
	    return "homePage.jsp";
	}
	

	@RequestMapping("/product/{id}")
	public String productProfile(Model model, @PathVariable("id") Long id) {
		Product product = aService.findProductById(id);
		model.addAttribute("product",product);
		return "product.jsp";
	}
	@GetMapping("/add/product/{id}/cart")
	public String addProductToCart(@PathVariable("id") Long id, HttpSession session, @RequestParam("price") int price) {
		if(session.getAttribute("cartQuantity") == null) {
			session.setAttribute("cartQuantity", 0);
		}
		System.out.println(session.getAttribute("cartQuantity"));
		User user = uService.findById((Long)session.getAttribute("user_id"));
		Cart cart = user.getCart();
		Product product = aService.findProductById(id);
		Item newItem = new Item(price, cart, product);
		aService.createItem(newItem);
		List<Product> cartItems = cart.getProducts();
		cartItems.add(product);
//		cart.setProducts(cartItems);
//		int newCart = (int) session.getAttribute("cart") + 1;
//		session.setAttribute("cartQuantity", newCart);
		return "redirect:/cart";
		
	}
	@RequestMapping("/cart")
	public String cart(Model model, HttpSession session) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/login";
		}
		User user = uService.findById((Long) session.getAttribute("user_id"));
		Cart cart = user.getCart();
		int cartProductsTotal = aService.getCartTotal(cart);
		List<Item> items = aService.findByCartContaining(cart);
		model.addAttribute("user", user);
		model.addAttribute("items", items);
		model.addAttribute("cartProductsTotal",cartProductsTotal);
		return "cart.jsp";
	}
	@GetMapping("/checkout")
	public String checkout(Model model, HttpSession session) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/login";
		}
		User user = uService.findById((Long) session.getAttribute("user_id"));
		Cart cart = user.getCart();
		List<Product> thisCartProducts = cart.getProducts();
		for(int i = 0;i<thisCartProducts.size();i++) {
			aService.deleteProductFromCart(cart, user);
		}
		aService.deleteCart(cart);
		return "redirect:/thanks";
	}
	@RequestMapping("/product/{id}/edit")
	public String editProductForm(@PathVariable("id") Long id, Model model, HttpSession session ) {
		if(session.getAttribute("user_id") == null)
			return "redirect:/";
		Product product = aService.findProductById(id);
		model.addAttribute("product", product);
		return "editProduct.jsp";
		
	}
	@PostMapping("/product/{id}/edit/action")
	public String editProduct(@PathVariable("id") Long id,@ModelAttribute("product") Product product, HttpSession session ) {
		if(session.getAttribute("user_id") == null)
			return "redirect:/";
		aService.updateProduct(product.getId(), product.getTitle(), product.getDescription());
		return "redirect:/admin";
	}
	@RequestMapping("/provider/{id}/edit")
	public String editProviderForm(@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("user_id") == null)
			return "redirect:/";
		Provider provider = aService.findProviderById(id);
		
		model.addAttribute("provider", provider);
		return "editProvider.jsp";
		
	}
	@PostMapping("/provider/{id}/edit/action")
	public String editProvider(@PathVariable("id") Long id,@ModelAttribute("provider") Provider provider, HttpSession session, @RequestParam("image") MultipartFile multipartFile) throws IOException {
		if(session.getAttribute("user_id") == null)
			return "redirect:/";
		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		FileUploadUtil.saveFile("user-photos/"+provider.getId(), fileName, multipartFile);
		aService.updateProvider(provider.getId(), provider.getName());
		return "redirect:/admin";
	}
	@RequestMapping(value="/delete/{id}", method = RequestMethod.DELETE)
	public String deleteProduct(@PathVariable("id") Long id) {
		aService.deleteProduct(id);
		return "redirect:/admin";
	}
	@RequestMapping(value="/delete/provider/{id}", method = RequestMethod.DELETE)
	public String deleteProvider(@PathVariable("id") Long id) {
		aService.deleteProvider(id);
		return "redirect:/admin";
	}
	@RequestMapping(value="/remove/item/{id}", method = RequestMethod.DELETE)
	public String removeItemFromCart(@PathVariable("id") Long id) {
		aService.deleteItem(id);
		return "redirect:/cart";
	}
	@RequestMapping("/aboutus")
	public String aboutUs() {
		return "aboutUs.jsp";
	}
	@RequestMapping("/thanks")
	public String thanks() {
		return "thanks.jsp";
	}

}
