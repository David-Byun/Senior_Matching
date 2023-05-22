package com.kbstar.controller;

import com.kbstar.dto.Order;
import com.kbstar.service.CartService;
import com.kbstar.service.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartApiController {

    private final CartService cartService;
    private final OrderService orderService;

    @PostMapping("/delete")
    public ResponseEntity<String> deleteItem(int memberId, int itemId, HttpSession session) {
        cartService.deleteItem(memberId, itemId);
        List<Order> order = orderService.getOrder(memberId);
        if (order.isEmpty()) {
            session.setAttribute("mycart", 0);
        }
        return ResponseEntity.ok().body("item delete complete");
    }



    @GetMapping("/info")
    public ResponseEntity<Map<String, Integer>> infoItem(int id) {
        Map<String, Integer> result = cartService.calculate(id);
        System.out.println("result ============== " + result);
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/decrease")
    public ResponseEntity<Map<String, Integer>> decreaseItem(int id) {
        Map<String, Integer> result = cartService.calculate(id);
        return ResponseEntity.ok().body(result);
    }

    @GetMapping("/increase")
    public ResponseEntity<Map<String, Integer>> increaseItem(int id) {
        Map<String, Integer> result = cartService.calculate(id);
        return ResponseEntity.ok().body(result);
    }
}
