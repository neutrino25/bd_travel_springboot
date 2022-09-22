package com.neutrino.entity;

public class Ticket {
    /*
    `id` int not null auto_increment,
    `fid` int not null,
    `name` varchar(200) default null,
    `explain` varchar(500) default null,
    `dprice` double default null,
    `mprice` double default null,
    */
    private Integer id;
    private String name;
    private String explain;
    private Double dprice;
    private Double mprice;
    private Integer fid;
    private Scenic scenic;

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

    public String getExplain() {
        return explain;
    }

    public void setExplain(String explain) {
        this.explain = explain;
    }

    public Double getDprice() {
        return dprice;
    }

    public void setDprice(Double dprice) {
        this.dprice = dprice;
    }

    public Double getMprice() {
        return mprice;
    }

    public void setMprice(Double mprice) {
        this.mprice = mprice;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Scenic getScenic() {
        return scenic;
    }

    public void setScenic(Scenic scenic) {
        this.scenic = scenic;
    }

}
