package com.neutrino.controller;



import com.neutrino.entity.QueryVo;
import com.neutrino.entity.Scenic;
import com.neutrino.entity.Ticket;
import com.neutrino.service.ScenicService;
import com.neutrino.service.TicketService;
import com.neutrino.utils.Page;
import com.neutrino.utils.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ScenicController {
    @Autowired
    ScenicService scenicService;
    @Autowired
    TicketService ticketService;

    /**
     * 管理员管理所有景点
     * @param model
     * @param vo
     * @return
     */
    @RequestMapping(value = "/manageScenic")
    public String getScenicPage(Model model, QueryVo vo){
        Page<Scenic> page = scenicService.selectPageByQueryVo(vo);
        model.addAttribute("page", page);
        model.addAttribute("name",vo.getName());
        model.addAttribute("addr", vo.getAddr());
        model.addAttribute("theme", vo.getTheme());
        return "manager/scenic";
    }

    /**
     * 为用户展示所有的景点信息getScenicPageForUser
     * @param model
     * @param vo
     * @return
     */
    @RequestMapping(value = "/getScenicPageForUser")
    public String getScenicPageForUser(Model model, QueryVo vo, HttpServletRequest request){
        Page<Scenic> page = scenicService.selectPageByQueryVo(vo);
        for (Scenic scenic :page.getRows()) {
            List<Ticket> ticketList =  ticketService.selectTicketListByFid(scenic.getId());
            double cheapestPrice = ticketService.selectPriceByFid(scenic.getId());
            scenic.setTicketList(ticketList);
            scenic.setCheapestPrice(cheapestPrice);
        }
        //根据参数判断目前是不是根据地址获得景点信息
        String addrParameter = request.getParameter("addr");
        if (addrParameter!=null){
            model.addAttribute("addrParameter",addrParameter);
        }
        model.addAttribute("page", page);
        return "user/scenicList";
    }

    /**
     * 管理员新增景点信息
     * @param scenic
     * @return
     */
    @RequestMapping(value = "/addScenic")
    public String insert(Scenic scenic, MultipartFile scenicImage){
        //当上传的图片不为空的时候才去存储路径,否则不存
        if (scenicImage.getSize() != 0) {
            //将上传的文件保存到磁盘中
            String path = "E:\\workspace_IDEA\\bdtravel\\src\\main\\webapp\\image\\scenic\\pic";
            String imageName = UploadUtil.upload(scenicImage,path);
            //将图片路径封装到Scenic中
            scenic.setPic("image/scenic/pic/"+imageName);
        }
        //插入
        scenicService.addScenic(scenic);
        return "redirect:/manageScenic";
    }

    //删除
    @RequestMapping(value = "/deleteScenic")
    public @ResponseBody
    String deleteScenic(Integer id){
        //删除
        scenicService.deleteById(id);
        return "OK";
    }

    /**
     * 管理员修改景点信息
     * @param scenic
     * @return
     */
    @RequestMapping(value = "/updateScenic")
    public String update(Scenic scenic, MultipartFile scenicImage){
        //当上传的图片不为空的时候才去存储路径,否则不存
        if (scenicImage.getSize() != 0) {
            //将上传的文件保存到磁盘中
            String path = "E:\\workspace_IDEA\\bdtravel\\src\\main\\webapp\\image\\scenic\\pic";
            String imageName = UploadUtil.upload(scenicImage,path);
            //将图片路径封装到Scenic中
            scenic.setPic("image/scenic/pic/"+imageName);
        }
        //插入
        scenicService.updateScenic(scenic);
        return "redirect:/manageScenic";
    }

    /**
     * 根据id获得景点信息
     * @param scenic
     * @return
     */
    @RequestMapping(value = "/getScenicById")
    public @ResponseBody
    Scenic getScenicById(Integer id){
        Scenic scenic = scenicService.getScenicById(id);
        return scenic;
    }

    @RequestMapping(value="/getScenicList")
    public @ResponseBody
    Map<String,Object> getScenicList(){
        List<Scenic> list =  scenicService.selectScenicList();
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("data",list);
        return map;
    }
}
