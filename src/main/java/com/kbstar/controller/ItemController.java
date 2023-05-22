package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Item;
import com.kbstar.dto.Review;
import com.kbstar.dto.ReviewRate;
import com.kbstar.service.ItemService;
import com.kbstar.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/shop")
public class ItemController {

    private final ItemService itemService;
    @Autowired
    ReviewService reviewService;

    @GetMapping("")
    public String shop(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<Item> p;
        p = new PageInfo<>(itemService.getAllItems(pageNo), 5);

        List<ReviewRate> list = new ArrayList<>();
        for ( Item item : p.getList()) {
            int itemId = item.getId();
            List<ReviewRate> itemRates = reviewService.rate(itemId);
            list.addAll(itemRates);
        }
        System.out.println("================================================"+list);

        model.addAttribute("rlist",list);
        model.addAttribute("cpage", p);
        model.addAttribute("center", "shop");
        return "index";
    }

    @GetMapping("/{id}/detail")
    public String shopDetail(@PathVariable Integer id, Model model) throws Exception {
        Item item = itemService.getItemById(id);
        List<Review> itemReview = reviewService.getByItemId(id);
        model.addAttribute("item", item);
        model.addAttribute("itemReview", itemReview);
        model.addAttribute("center", "shop-details");
        return "index";
    }

}
