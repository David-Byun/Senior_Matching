package com.kbstar;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Value("${imgdir}")
    String imgdir;
//    @Value("${logdir}")
//    String logdir;
//
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/uimg/**").addResourceLocations(imgdir);
//        registry.addResourceHandler("/logs/**").addResourceLocations(logdir);
    }
}