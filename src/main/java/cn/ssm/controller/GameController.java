package cn.ssm.controller;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.ssm.annotation.NeedLogin;
import cn.ssm.po.Club;
import cn.ssm.po.Game;
import cn.ssm.service.ClubService;
import cn.ssm.service.GameService;

@Controller
public class GameController {
	@Autowired
	private GameService gameService;
	
	@Autowired
	private ClubService clubService;
	
	@RequestMapping("/allGame")
	@NeedLogin
	public String allGame(Model model,Date start,Date end,@RequestParam(value="currentPage" ,defaultValue="1") int currentPage ,@RequestParam(value="pageSize" ,defaultValue="6") int pageSize) {

		PageInfo<Game> list = gameService.selectGame(currentPage,start,end);
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		model.addAttribute("list", list);
		return "allGame";
	}
	
	@RequestMapping("q_gameList")
	
	public @ResponseBody List<Game> q_gameList(Date start,Date end,Integer id ){
		return gameService.selectGame(start, end,id);
	}
	
	@RequestMapping("q_game")
	public @ResponseBody List<Game> q_game(/*Date start,*/Integer id ,String start){
		return gameService.selectGameByClub(start, id);
		
	}
	
	@RequestMapping("/game")
	@NeedLogin
	public String game(Model model){
		 List<Club> club = clubService.selectClub();
		 model.addAttribute("club",club);
		return "addGame";
	}
	
	@RequestMapping("/addGame")
	@NeedLogin
	public @ResponseBody Integer addGame(Game game) {
		return gameService.addGame(game);
	}
	
	@RequestMapping("/queryGame")
	@NeedLogin
	public String queryGame(Model model, Integer id){
		Game game = gameService.selectGameById(id);
		model.addAttribute("game", game);
		return "updateGame";
	}
	
	@RequestMapping("/updateGame")
	@NeedLogin
	public @ResponseBody String updateGame(Game game){
		
		return gameService.updateGame(game)+"";
	}
	
	@RequestMapping("/deleteGame")
	@NeedLogin
	public @ResponseBody String deleteGame(@RequestBody Game game){
		System.out.println(game.getId());
		return gameService.deleteGame(game)+"";
	}
	@RequestMapping("/deleteGame1")
	@NeedLogin
	public @ResponseBody String deleteGame1(Integer id){
		System.out.println(id);
		return "1";
	}
}
