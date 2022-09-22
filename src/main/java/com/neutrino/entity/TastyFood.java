package com.neutrino.entity;

public class TastyFood {
    /*
   `id` int not null auto_increment,
  `name` varchar(200) default null,
  `discribe` varchar(200) default null,
  `commend` varchar(200) default null,
  `pic` varchar(200) default null,
   */
    private Integer id;
    private String name;
    private String describe;
    private String commend;
    private String pic;

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

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getCommend() {
        return commend;
    }

    public void setCommend(String commend) {
        this.commend = commend;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
}
