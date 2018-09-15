package cn.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ssm.po.Achievement;
import cn.ssm.po.Club;
import cn.ssm.po.Player;

public interface ClubMapper {
	List<Club> selectClub();
	
	Club selectClubById(@Param(value="cid")Integer cid);
	
	List<Achievement> selectClubAchievement(@Param(value="cid")Integer cid);
	
	List<Player> selectPlayer(@Param(value="cid")Integer cid);
	
	List<Player> selectPlayerList(@Param(value="head")String head);
	
	List<Player> selectAllPlayer(Player player);
	
	Integer selectPlayerId();
	
	int addPlayer(Player player);
	
	Player selectPlayerByPid(@Param(value="pid")Integer pid);
	
	int updatePlayer(Player player);

	int deletePlayer(@Param(value="pid")Integer pid);
	
	int insertAchievement(Achievement ach);
	
	int deleteAchievement(@Param(value="id")Integer id);
	
	int updateAchievement(Achievement ach);
	
	int updatePlayer1(Player player);

	int selectClubId();

	int addClub(Club club);

	int countPlayer(@Param(value="cid")String cid, @Param(value="number")Integer number);

	int updateClub(Club club);
}
