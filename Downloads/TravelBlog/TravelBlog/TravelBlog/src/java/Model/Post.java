/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class Post {
    int postId;
    String tittle;
    Date createdDate;
    String description;
    String imageLink;
    Account account;
    Category cate;
    Vehicle vehicle;
    List<Service> services;
    String content;
    List<Comment> comments;

    public Post(int postId, String tittle, Date createdDate, String description, String imageLink, Account account, Category cate, Vehicle vehicle, List<Service> services, String content, List<Comment> comments) {
        this.postId = postId;
        this.tittle = tittle;
        this.createdDate = createdDate;
        this.description = description;
        this.imageLink = imageLink;
        this.account = account;
        this.cate = cate;
        this.vehicle = vehicle;
        this.services = services;
        this.content = content;
        this.comments = comments;
    }
    
    public ArrayList getServicesId(){
        ArrayList ids = new ArrayList();
        for(Service s : services){
            ids.add(s.getServiceId());
        }
        return ids;
    }

    public Post() {
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    
    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    
    
    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Category getCate() {
        return cate;
    }

    public void setCate(Category cate) {
        this.cate = cate;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public List<Service> getServices() {
        return services;
    }

    public void setServices(List<Service> services) {
        this.services = services;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    
}
