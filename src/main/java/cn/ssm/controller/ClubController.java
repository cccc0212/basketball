package cn.ssm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.github.pagehelper.PageInfo;

import cn.ssm.annotation.NeedLogin;
import cn.ssm.po.Achievement;
import cn.ssm.po.Club;
import cn.ssm.po.Goods;
import cn.ssm.po.Player;
import cn.ssm.service.ClubService;


@Controller
public class ClubController {
	@Autowired
	private ClubService clubService;
	
	@RequestMapping("/allClub")
	@NeedLogin
	public String allClub(Model model){
		List<Club> list = clubService.selectClub();
		model.addAttribute("list", list);
		return "allClub";
	}
	
	@RequestMapping("/getClubId")
	@NeedLogin
	public String getClubId(Model model){
		Integer clubId = clubService.selectClubId();
		model.addAttribute("cid", clubId);
		return "addClub";
	}
	@RequestMapping("/addClub")
	@NeedLogin
	public @ResponseBody Integer addClub(Club club,@RequestParam("file") CommonsMultipartFile file,HttpServletRequest request){
		String fileName = file.getOriginalFilename();  
        System.out.println("原始文件名:" + fileName);  
  
        // 新文件名  
        String newFileName = club.getCid() + fileName.substring(fileName.lastIndexOf("."));  
  
        // 上传位置  
        String path =  "D:/developer/CBA/images/clubs/"; // 设定文件保存的目录  
        System.out.println("上传图片到:" + path);  
        File f = new File(path);  
        if (!f.exists())  
            f.mkdirs();  
        if (!file.isEmpty()) {  
            try {  
                FileOutputStream fos = new FileOutputStream(path + newFileName);  
                java.io.InputStream in = file.getInputStream();  
                int b = 0;  
                while ((b = in.read()) != -1) {  
                    fos.write(b);  
                }  
                fos.close();  
                in.close();  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        } 
        path ="images/clubs/"+ newFileName;
        club.setLogo(path);
        int i = clubService.addClub(club);
		
		return 1;
	}
	
	@RequestMapping("/updateClub")
	@NeedLogin
	public @ResponseBody Integer updateClub(Club club,@RequestParam("file") CommonsMultipartFile file,HttpServletRequest request){
		String fileName = file.getOriginalFilename();  
        System.out.println("原始文件名:" + fileName);  
  
        // 新文件名  
        String newFileName = club.getCid() + fileName.substring(fileName.lastIndexOf("."));  
  
        // 上传位置  
        String path =  "D:/developer/CBA/images/clubs/"; // 设定文件保存的目录  
        System.out.println("上传图片到:" + path);  
        File f = new File(path);  
        if (!f.exists())  
            f.mkdirs();  
        if (!file.isEmpty()) {  
            try {  
                FileOutputStream fos = new FileOutputStream(path + newFileName);  
                java.io.InputStream in = file.getInputStream();  
                int b = 0;  
                while ((b = in.read()) != -1) {  
                    fos.write(b);  
                }  
                fos.close();  
                in.close();  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        } 
        path ="images/clubs/"+ newFileName;
        club.setLogo(path);
        int i = clubService.updateClub(club);
		
		return 1;
	}
	
	@RequestMapping("/q_clubList")
	public @ResponseBody List<Club> q_clubList(){
		return clubService.selectClub();
	}
	
	@RequestMapping("/player")
	public String player(@RequestParam(value="cid") Integer cid, Model model){
		List<Player> list = clubService.selectPlayer(cid);
		model.addAttribute("list", list);
		return "player";
	}
	
	@RequestMapping("/q_player")
	public @ResponseBody List<Player> q_player(@RequestParam(value="cid") Integer cid){
		List<Player> list = clubService.selectPlayer(cid);
		return list;
	}
	
	@RequestMapping("/q_playerList")
	public @ResponseBody List<Player> q_playerList(@RequestParam(value="head") String head){
		List<Player> list = clubService.selectPlayerList(head);
		return list;
	}
	
	@RequestMapping("/playerPage")
	public String playerPage(@RequestParam(value="cid") Integer cid, @RequestParam(value="currentPage" ,defaultValue="1") int currentPage ,@RequestParam(value="pageSize" ,defaultValue="6") int pageSize,Model model){
		PageInfo<Player> list = clubService.selectPlayerPage(cid,currentPage,pageSize);
		model.addAttribute("list", list);
		return "player";
	}
	
	@RequestMapping("/allPlayer")
	public String allPlayer(Model model, Player player,@RequestParam(value="currentPage" ,defaultValue="1") int currentPage ,@RequestParam(value="pageSize" ,defaultValue="6") int pageSize){
		PageInfo<Player> list = clubService.selectAllPlayerPage(player,currentPage,pageSize);
		model.addAttribute("list", list);
		model.addAttribute("player",player);
		List<Club> clubList = clubService.selectClub();
		model.addAttribute("clubList", clubList);
		return "allPlayer";
	}
	
	@RequestMapping("addPlayerId")
	 public String addUserId(Model model){
		 Integer pid = clubService.selectPlayerId();
		 List<Club> club = clubService.selectClub();
		 model.addAttribute("pid", pid);
		 model.addAttribute("club",club);
		 return "addPlayer";
	 }
	
	@RequestMapping("/addPlayer")
	public @ResponseBody String addPlayer(@RequestBody Player player ){
		
		 int i=0;

		 try{
			 i = clubService.addPlayer(player);
		 }catch(Exception e){
			 i=0;
		 }
		 return i+"";
	}
	
	@RequestMapping("queryPlayer")
	public String queryPlayer(int pid,Model model){
		Player player = clubService.selectPlayerByPid(pid);
		model.addAttribute("player",player);
		List<Club> club = clubService.selectClub();
		model.addAttribute("club",club);
		return "updatePlayer";
	}
	
	@RequestMapping("updatePlayer")
	public @ResponseBody String updatePlayer(@RequestBody Player player){
		 int i=0;

		 try{
			 i = clubService.updatePlayer(player);
		 }catch(Exception e){
			 i=0;
		 }
		 return i+"";
	}
	
	@RequestMapping("deletePlayer")
	public @ResponseBody String deletePlayer(int pid){
		return clubService.deletePlayer(pid)+"";
	}
	
	@RequestMapping("club")
	public String club(@RequestParam(value="cid") Integer cid, Model model){
		Club club = clubService.selectClubDetail(cid);
		model.addAttribute("club", club);
		return "club";
	}
	
	@RequestMapping("q_club")
	public @ResponseBody Club q_club(@RequestParam(value="cid") Integer cid){
		Club club = clubService.selectClubDetail(cid);

		return club;
	}
	
	@RequestMapping("addAch")
	public @ResponseBody Integer addAch(Achievement ach){
		
			return clubService.insertAchievement(ach);
	}
	
	@RequestMapping("delAch")
	public @ResponseBody Integer del(Integer id){
		return clubService.deleteAchievement(id);
	}
	
	@RequestMapping("updateAch")
	public @ResponseBody Integer updateAch(Achievement ach){
		return clubService.updateAchievement(ach);
	}
}
