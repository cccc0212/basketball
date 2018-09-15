package cn.ssm.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.ssm.po.Achievement;
import cn.ssm.po.Club;
import cn.ssm.po.Player;

public interface ClubService {
	public List<Club> selectClub();
	
	public Club selectClubDetail(Integer cid);
	
	public List<Player> selectPlayer(Integer cid);
	
	public List<Player> selectPlayerList(String head);
	
	public Integer selectPlayerId();
	
	public PageInfo<Player> selectPlayerPage(Integer cid, int currentPage, int pageSize);
	
	public PageInfo<Player> selectAllPlayerPage(Player player, int currentPage, int pageSize);
	
	public int addPlayer(Player player);
	
	public Player selectPlayerByPid(int pid);
	
	public int updatePlayer(Player player);
	
	public int deletePlayer(int pid);
	
	public int insertAchievement(Achievement ach);
	
	public int deleteAchievement(Integer id);
	
	public int updateAchievement(Achievement ach);

	public Integer selectClubId();

	public int addClub(Club club);

	public int updateClub(Club club);
}
