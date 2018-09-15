package cn.ssm.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ssm.po.Game;

public interface GameMapper {
	List<Game> selectGame(@Param("start")Date start,@Param("end")Date End, @Param("id")Integer id);
	
	List<Game> selectGameByClub(@Param("start")Date start,@Param("end")Date End, @Param("id")Integer id);
	
	int insertGame(Game game);
	
	Game selectGameById(@Param("id")Integer id);
	
	int updateGame(Game game);
	
	int deleteGame(Game game);
}
