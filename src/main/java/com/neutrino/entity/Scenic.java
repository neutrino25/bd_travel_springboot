package com.neutrino.entity;

import java.util.List;

public class Scenic {
    /*
  `id` int not null auto_increment,
  `name` varchar(200) default null,
  `theme` varchar(200) default null,
  `addr` varchar(200) default null,
  `feature` varchar(500) default null,
  `pic` varchar(200) default null,
  `sales` int default 0
    */
    private Integer id;
    private String name;
    private String theme;
    private String addr;
    private String feature;
    private String pic;
    private Integer sales;
    private double cheapestPrice;
    private List<Ticket> ticketList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }

    public List<Ticket> getTicketList() {
        return ticketList;
    }

    public void setTicketList(List<Ticket> ticketList) {
        this.ticketList = ticketList;
    }

    public double getCheapestPrice() {
        return cheapestPrice;
    }

    public void setCheapestPrice(double cheapestPrice) {
        this.cheapestPrice = cheapestPrice;
    }
}
