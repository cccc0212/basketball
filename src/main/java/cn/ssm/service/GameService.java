package cn.ssm.service;

import java.util.Date;
import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.ssm.po.Game;

public interface GameService {
	public PageInfo<Game> selectGame(int currentPage , Date Start, Date End);
	
	public List<Game> selectGame( Date Start, Date End, Integer id);
	
	public List<Game> selectGameByClub( String Start, Integer id);
	
	public Integer addGame(Game game);
	
	public Game selectGameById(Integer id);
	
	public int updateGame(Game game);
	
	public int deleteGame(Game game);
}
