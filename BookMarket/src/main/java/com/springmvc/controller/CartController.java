package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.springmvc.domain.Book;
import com.springmvc.domain.Cart;
import com.springmvc.domain.CartItem;
import com.springmvc.exception.BookIdException;
import com.springmvc.service.BookService;
import com.springmvc.service.CartService;

@Controller
@RequestMapping(value="/cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private BookService bookService;
	
	//	requestCartId는 웹 요청 URL이 /BookMarket/cart/일 떄 요청 처리 메소드로 사용자 요청을 처리하고 세션 ID 값을 가져오하서 URI cart/sessionId로 리다리렉션합니다.
	@GetMapping
	public String requestCartId(HttpServletRequest request) {
		String sessionid = request.getSession(true).getId();
		return "redirect:/cart/" + sessionid;
	}
	
	//	Cart클래스 정보를 HTTP 요청 body로 전달받아 장바구니를 새로 생성하고 HTTP응답 body로 전달합니다.
	@PostMapping
	public @ResponseBody Cart create(@RequestBody Cart cart) {
		return cartService.create(cart);
	}
	
	//	요청URL에서 경로변수 cartId에 대해 장바구니에 등록된 모든 정보를 읽어와 커맨드 객체 cart속성에 등록하고 뷰이름을 cart로 반환하여 cart.jsp가 된다.
	@GetMapping("/{cartId}")
	public String requestCartList(@PathVariable(value="cartId") String cartId, Model model) {
		Cart cart = cartService.read(cartId);
		model.addAttribute("cart",cart);
		return "cart";
	}
	
	//	요청URL에서 경로 변수인 장바구니 ID에 대해 장바구니에 등록된 모든 정보를 가져옵니다.
	@PutMapping("/{cartId}")
	public @ResponseBody Cart read(@PathVariable(value="cartId") String cartId) {
		return cartService.read(cartId);
	}
	
	@PutMapping("/add/{bookId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void addCartByNewItem(@PathVariable String bookId, HttpServletRequest request) {
		String sessionId = request.getSession(true).getId();
		Cart cart = cartService.read(sessionId);
		if(cart==null) {
			cart = cartService.create(new Cart(sessionId));
		}
		Book book = bookService.getBookById(bookId);
		if (book == null) {
			throw new IllegalArgumentException(new BookIdException(bookId));
		}
		cart.addCartItem(new CartItem(book));
		cartService.update(sessionId, cart);
	}
}
