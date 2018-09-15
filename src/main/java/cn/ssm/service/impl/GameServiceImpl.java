package cn.ssm.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.ssm.controller.converter.GameDateConverter;
import cn.ssm.mapper.GameMapper;
import cn.ssm.po.Game;
import cn.ssm.service.GameService;

@Service("gameService")
public class GameServiceImpl implements GameService {
	
	@Autowired
	private GameMapper gameMapper;
	
	@Override
	public PageInfo<Game> selectGame(int currentPage,Date start,Date end) {
		// TODO Auto-generated method stub
		PageHelper.startPage(currentPage, 6, true);
		List<Game> list = gameMapper.selectGame(start,end,null);
		PageInfo<Game> pageInfo = new PageInfo<Game>(list);
		return pageInfo;
	}
	
	@Override
	public List<Game> selectGame(Date start,Date end, Integer id) {

		return gameMapper.selectGame(start,end, id);
	}
	
	@Override
	public List<Game> selectGameByClub(String start,Integer id) {
		Date start1 = null;
		Date end = null;
		if(start!=null&&start!=""){
			start+=" 00:00:00";
			start1 = convert(start);
			Calendar cal = Calendar.getInstance();
			cal.setTime(start1);
			cal.add(Calendar.DATE,1);
			end =cal.getTime();
		}
		
		return gameMapper.selectGameByClub(start1,end,id);
	}

	@Override
	public Integer addGame(Game game) {
		// TODO Auto-generated method stub
		return gameMapper.insertGame(game);
	}

	@Override
	public Game selectGameById(Integer id) {
		// TODO Auto-generated method stub
		return gameMapper.selectGameById(id);
	}

	@Override
	public int updateGame(Game game) {
		// TODO Auto-generated method stub
		
		return gameMapper.updateGame(game);
	}

	@Override
	public int deleteGame(Game game) {
		// TODO Auto-generated method stub
		return gameMapper.deleteGame(game);
	}
	
	
	public Date convert(String source) {
		
		//实现 将日期串转成日期类型(格式是yyyy-MM-dd HH:mm:ss)

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(source.equals(" 00:00:00"))
			return null;
		try {
			//转成直接返回
			return simpleDateFormat.parse(source);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//如果参数绑定失败返回null
		return null;
	}

}
