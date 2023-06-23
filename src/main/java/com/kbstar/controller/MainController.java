package com.kbstar.controller;

import com.kbstar.dto.ItemReview;
import com.kbstar.firebase.FirebaseInit;
import com.kbstar.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MainController {

    private final ReviewService reviewService;
    private final FirebaseInit init;

    @RequestMapping("/chat")
    public String test1(Model model, HttpSession session) {
        model.addAttribute("center", "chat");
        return "index";
    }

    @RequestMapping("/matelocation")
    public String matelocation(Model model) {
        model.addAttribute("center", "matelocation");
        return "index";
    }

    @RequestMapping("/chatgpt")
    public String chatgpt(Model model) {
        model.addAttribute("center", "chatgpt");
        return "index";
    }


    @RequestMapping("/callchat")
    public String callchat() {
        return "callchat";
    }

    @RequestMapping("/")
    public String main(Model model, HttpSession session) {
        init.init();
        if ((session.getAttribute("mycart") == null)) {
            session.setAttribute("mycart", 0);
        }
        if ((session.getAttribute("myreserve") == null)) {
            session.setAttribute("myreserve", 0);
        }
        return "index";
    }


    @RequestMapping("/404")
    public String errorPage(Model model) {
        model.addAttribute("center", "404");
        return "index";
    }

    @RequestMapping("/blog")
    public String blog(Model model) {
        model.addAttribute("center", "blog");
        return "index";
    }

    @RequestMapping("/shop")
    public String shop(Model model, Integer k) {
        model.addAttribute("center", "shop");
        return "index";
    }

    @RequestMapping("/mycoupon")
    public String mycoupon(Model model, Integer k) {
        model.addAttribute("center", "mycoupon");
        return "index";
    }

    @RequestMapping("/video")
    public String video(Model model, Integer k) {
        model.addAttribute("center", "videotest");
        return "index";
    }

    @RequestMapping("/contact")
    public String contact(Model model) {
        model.addAttribute("center", "contact");
        return "index";
    }

    @RequestMapping("/signin")
    public String signin(Model model) {
        model.addAttribute("center", "signin");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/checkout")
    public String checkout(Model model) {
        model.addAttribute("center", "checkout");
        return "index";
    }

    @RequestMapping("/cart")
    public String cart(Model model) {
        model.addAttribute("center", "shopping-cart");
        return "index";
    }

    @RequestMapping("/reserve")
    public String reserve(Model model) {
        model.addAttribute("center", "shopping-reserve");
        return "index";
    }


    @RequestMapping("/shop-details")
    public String shopdetails(Model model) {
        model.addAttribute("center", "shop-details");
        return "index";
    }

    @RequestMapping("/shopping-cart")
    public String shoppingcart(Model model) {
        model.addAttribute("center", "shopping-cart");
        return "index";
    }

    @RequestMapping("/faq")
    public String faq(Model model) {
        model.addAttribute("center", "faq");
        return "index";
    }

    @RequestMapping("/reviewmate")
    public String reviewmate(Model model) {
        return "matereview";
    }

    @RequestMapping("/review")
    public String review(Model model) {
        model.addAttribute("center", "review");
        return "index";
    }

    @RequestMapping("/reviewall")
    public String reviewall(Model model) {
        List<ItemReview> list = null;
        try {
            list = reviewService.get();
        } catch (Exception e) {
            throw new RuntimeException("리뷰 목록을 불러오지 못하였습니다.");
        }
        model.addAttribute("center", "reviewall");
        model.addAttribute("reviewlist", list);

        return "index";
    }

    @RequestMapping("/websocket")
    public String chatbot(Model model) {
        model.addAttribute("center", "websocket");
        return "index";
    }

    @RequestMapping("/goldenlife")
    public String goldenlife(Model model) {
        model.addAttribute("center", "goldenlife");
        return "index";
    }

    @RequestMapping("/matereviews")
    public String matereviews(Model model) {
        return "match/matereview";
    }


}
