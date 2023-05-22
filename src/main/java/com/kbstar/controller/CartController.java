package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.dto.Member;
import com.kbstar.service.CartService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;


    @PostMapping("/add")
    public void addCart(int memberId, int itemId, HttpSession session) {
        cartService.addCart(memberId, itemId);
        Member member = (Member) session.getAttribute("loginmember");
        List<Item> items = cartService.myCart(memberId);
        if (!items.isEmpty()) {
            session.setAttribute("mycart", 1);
        }
    }

    /*
        개수 조정하고 결제 탭으로 진행할 때 shopping cart 개별 cnt를 한번에 조정한다.
        결제가 완료되고 나서는 해당 유저의 장바구니를 삭제한다
     */

    @GetMapping("/{memberId}")
    public String myCart(@PathVariable int memberId, Model model) {
        List<Item> myCart = cartService.myCart(memberId);
        int sum = 0;
        for (Item item : myCart) {
            sum += item.getCnt() * item.getPrice();
        }
        System.out.println("sum = " + sum);
        model.addAttribute("sum", sum);
        model.addAttribute("myCart", myCart);
        model.addAttribute("center", "shopping-cart");
        return "index";
    }

}
