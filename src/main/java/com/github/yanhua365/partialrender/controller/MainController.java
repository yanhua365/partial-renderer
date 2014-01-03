package com.github.yanhua365.partialrender.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

/**
 * 控制器
 */
@Controller
public class MainController {

    public static final String PARTIAL_RENDER_ATTR_OBJECT = "object";

    @RequestMapping("/")
    public String main(ModelMap modelMap){
        modelMap.addAttribute("books", Book.getBooks());
        return "main";
    }

    @RequestMapping("/detail/{id}")
    public String detail(@PathVariable("id") String id,ModelMap modelMap){
        modelMap.addAttribute(PARTIAL_RENDER_ATTR_OBJECT, Book.getBook(id));
        return "_detail";
    }


   public static class Book{

       private static final List<Book> books = new ArrayList<Book>();

       static {
           books.add(
                   new Book(
                           "1",
                           "算法导论",
                           "http://img5.douban.com/lpic/s1959967.jpg",
                            "这本书深入浅出，全面地介绍了计算机算法。对每一个算法的分析既易于理解又十分有趣，并保持了数学严谨性。"
                   )
           );

           books.add(
                   new Book(
                           "2",
                           "代码大全",
                           "http://img5.douban.com/lpic/s1495029.jpg",
                           "史蒂夫·迈克康奈尔（Steve McConnell）被公认为软件开发社区中的首要作者和发言人之一。"
                   )
           );
       }

       public static  List<Book> getBooks(){
         return books;
       }

       public static Book getBook(String id){
           for(Book book : books){
               if(book.getId().equalsIgnoreCase(id)){
                   return book;
               }
           }
           return null;
       }

       public Book(String id, String name, String picUrl, String desc) {
           this.id = id;
           this.name = name;
           this.picUrl = picUrl;
           this.desc = desc;
       }

       public String getId() {
           return id;
       }

       public void setId(String id) {
           this.id = id;
       }

       public String getName() {
           return name;
       }

       public void setName(String name) {
           this.name = name;
       }

       public String getPicUrl() {
           return picUrl;
       }

       public void setPicUrl(String picUrl) {
           this.picUrl = picUrl;
       }

       public String getDesc() {
           return desc;
       }

       public void setDesc(String desc) {
           this.desc = desc;
       }

       private String id;
       private String name;
       private String picUrl;
       private String desc;
   }
}
