package com.axsos.gifty.services;

import java.security.SecureRandom;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axsos.gifty.models.Cart;
import com.axsos.gifty.models.Item;
import com.axsos.gifty.models.Price;
import com.axsos.gifty.models.Product;
import com.axsos.gifty.models.Provider;
import com.axsos.gifty.models.User;
import com.axsos.gifty.repositories.CartRepository;
import com.axsos.gifty.repositories.ItemRepository;
import com.axsos.gifty.repositories.PriceRepository;
import com.axsos.gifty.repositories.ProductRepository;
import com.axsos.gifty.repositories.ProviderRepository;
import com.axsos.gifty.repositories.RoleRepository;
import com.axsos.gifty.repositories.UserRepository;


@Service
public class AppService {
	@Autowired
	private SendEmailService sendEmailService;
	private final CartRepository cRepo;
	private final PriceRepository priceRepo;
	private final ProductRepository productRepo;
	private final ProviderRepository providerRepo;
	private final RoleRepository roleRepo;
	private final UserRepository uRepo;
	private final ItemRepository iRepo;
	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	static SecureRandom rnd = new SecureRandom();
	
	public AppService(CartRepository cRepo, PriceRepository priceRepo, ProductRepository productRepo,
			ProviderRepository providerRepo, RoleRepository roleRepo, UserRepository uRepo, ItemRepository iRepo, SendEmailService sendEmailService) {
		this.cRepo = cRepo;
		this.priceRepo = priceRepo;
		this.productRepo = productRepo;
		this.providerRepo = providerRepo;
		this.roleRepo = roleRepo;
		this.uRepo = uRepo;
		this.iRepo = iRepo;
		this.sendEmailService = sendEmailService;
	}
	public Product findProductById(Long id) {
        Optional<Product> optionalProduct = productRepo.findById(id);

        if(optionalProduct.isPresent()) {
            return optionalProduct.get();
        } else {
            return null;
        }
    }
	public Provider findProviderById(Long id) {
		 Optional<Provider> optionalProvider = providerRepo.findById(id);

	        if(optionalProvider.isPresent()) {
	            return optionalProvider.get();
	        } else {
	            return null;
	        }
	}
	public List<Product> findAllProducts() {
        return productRepo.findAll();
    }
	public Product createProduct(Product product) {
		product.setCode(randomString(10));
		return productRepo.save(product);
	}
	public Provider createProvider(Provider provider) {
		return providerRepo.save(provider);
	}
	public Price createPrice(Price price) {
		return priceRepo.save(price);
	}
	public Item createItem(Item item) {
		return iRepo.save(item);
	}
	public Cart createCart(Cart cart) {
		return cRepo.save(cart);
	}
	
	public void deleteProduct(Long id) {
		productRepo.deleteById(id);
	}
	public void deleteProvider(Long id) {
		providerRepo.deleteById(id);
	}
	public void deleteItem(Long id) {
		iRepo.deleteById(id);
	}

	public void deleteProductFromCart(Cart cart, User user) {
		List<Product> products = cart.getProducts();
		List<Item> items = iRepo.findByCartContaining(cart);
		for(int i = 0;i<items.size();i++) {
			System.out.println(items.get(i).getProduct().getTitle());
			Product product = items.get(i).getProduct();
			Price thisPrice = priceRepo.findPriceByProductandPriceTag(product, items.get(i).getPrice());
			thisPrice.setQuantity(thisPrice.getQuantity() - 1);
			sendEmailService.sendEmail(user.getEmail(), "Here is your gift card QR code, scan to recieve your code: https://api.qrserver.com/v1/create-qr-code/?size=150x150&data="+product.getCode(), "No Reply Gifty QR Code");
			products.remove(product);
		}
		cart.setProducts(products);
	}
	public Product updateProduct(Long id, String title, String description) {
		Optional<Product> optionalProduct = productRepo.findById(id);
		 if(optionalProduct.isPresent()) {
	            Product product = optionalProduct.get();
	            product.setTitle(title);
	            product.setDescription(description);
	            productRepo.save(product);
	            return product;
	        } else {
	            return null;
	        }
	}
	public Provider updateProvider(Long id, String name) {
		Optional<Provider> optionalProvider = providerRepo.findById(id);
		 if(optionalProvider.isPresent()) {
	            Provider provider = optionalProvider.get();
	            provider.setName(name);
	            providerRepo.save(provider);
	            return provider;
	        } else {
	            return null;
	        }
	}
	public void deleteCart(Cart cart) {
		cRepo.delete(cart);
	}

	public String randomString( int len ){
	   StringBuilder sb = new StringBuilder( len );
	   for( int i = 0; i < len; i++ ) 
	      sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
	   return sb.toString();
	}
	public List<Item> findByCartContaining(Cart cart){
		return iRepo.findByCartContaining(cart);
	}
	public int getCartTotal(Cart cart) {
		int cartProductsTotal = 0;
		List<Item> items = iRepo.findByCartContaining(cart);
		for(int i = 0; i<items.size();i++) {
			cartProductsTotal += items.get(i).getPrice();
		}
		return cartProductsTotal;
	}
}
