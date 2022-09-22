package com.neutrino.entity;

public class Order {
    /*
  `id` int NOT NULL auto_increment,
  `tid` int NOT NULL,
   `uid` varchar(50) not null,
  `paid` double DEFAULT NULL,
  `num` int DEFAULT NULL,
  `no` varchar(30) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `state` int DEFAULT 0,
    */
    private Integer id;
    private String no;//订单编号
    private Double paid;//支付总额
    private Integer num;//门票数量
    private String code;//取票码
    private Integer state;//取票状态
    private Integer tid;//外键--门票id
    private String uid;
    private User user;
    private Ticket ticket;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public Double getPaid() {
        return paid;
    }

    public void setPaid(Double paid) {
        this.paid = paid;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
