package com.kbstar.controller;

import com.kbstar.dto.ItemReview;
import com.kbstar.service.ReviewService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class MainController {

    @Autowired
    ReviewService reviewService;

    @RequestMapping("/chat")
    public String test1(Model model, HttpSession session) {
        model.addAttribute("center", "chat");
        return "index";
    }

    @RequestMapping("/first")
    public String test1() {
        return "first";
    }

    @RequestMapping("/")
    public String main(Model model, HttpSession session) {
        if ((session.getAttribute("mycart") == null)) {
            session.setAttribute("mycart", 0);
        }
        if ((session.getAttribute("myreserve") == null)) {
            session.setAttribute("myreserve", 0);
        }
        return "index";
    }

    @RequestMapping("/match")
    public String match(Model model, HttpSession session) {
        model.addAttribute("center", "match");
        return "index";
    }


    @RequestMapping("/404")
    public String errorPage(Model model) {
        model.addAttribute("center", "404");
        return "index";
    }


    @RequestMapping("/shop")
    public String shop(Model model, Integer k) {

        model.addAttribute("center","shop");
        return "index";
    }

    @RequestMapping("/contact")
    public String contact(Model model) {
        model.addAttribute("center","contact");
        return "index";
    }

    @RequestMapping("/signin")
    public String signin(Model model) {
        model.addAttribute("center","signin");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center","login");
        return "index";
    }

    @RequestMapping("/checkout")
    public String checkout(Model model) {
        model.addAttribute("center","checkout");
        return "index";
    }

    @RequestMapping("/cart")
    public String cart(Model model) {
        model.addAttribute("center","shopping-cart");
        return "index";
    }

    @RequestMapping("/reserve")
    public String reserve(Model model) {
        model.addAttribute("center","shopping-reserve");
        return "index";
    }

    @RequestMapping("/about")
    public String about(Model model) {
        model.addAttribute("center","about");
        return "index";
    }

    @RequestMapping("/blog-details")
    public String blogdetails(Model model) {
        model.addAttribute("center","blog-details");
        return "index";
    }
    
    @RequestMapping("/blog")
    public String blog(Model model) {
        model.addAttribute("center","blog");
        return "index";
    }

    @RequestMapping("/shop-details")
    public String shopdetails(Model model) {
        model.addAttribute("center","shop-details");
        return "index";
    }

    @RequestMapping("/shopping-cart")
    public String shoppingcart(Model model) {
        model.addAttribute("center","shopping-cart");
        return "index";
    }

    @RequestMapping("/faq")
    public String faq(Model model) {
        model.addAttribute("center","faq");
        return "index";
    }

    @RequestMapping("/review")
    public String review(Model model) {
        model.addAttribute("center","review");
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
        model.addAttribute("center","reviewall");
        model.addAttribute("reviewlist",list);

        return "index";
    }

    @RequestMapping("/chatbot")
    public String chatbot(Model model) {
        model.addAttribute("center", "chatbot");
        return "index";
    }

    @RequestMapping("/memberdetail")
    public String memberdetail(Model model) {
        model.addAttribute("center", "memberdetail");
        return "index";
    }
    
        @RequestMapping("/goldenlife")
    public String goldenlife(Model model) {
        model.addAttribute("center", "goldenlife");
        return "index";
    }
    
        @RequestMapping("/matereviews")
    public String matereviews(Model model) {
        model.addAttribute("center", "matereviews");
        return "index";
    }
}
