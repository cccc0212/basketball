package cn.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ssm.mapper.ClubMapper;
import cn.ssm.po.Achievement;
import cn.ssm.po.Club;
import cn.ssm.po.Player;
import cn.ssm.service.ClubService;
import net.sourceforge.pinyin4j.PinyinHelper;

@Service("clubService")
public class ClubServiceImpl implements ClubService {
	@Autowired
	private ClubMapper clubMapper;
	@Override
	public List<Club> selectClub() {
//		int i = 0;
//		if(i==0){
//			PageHelper.startPage(4,	 6, true);
//			
//			List<Club> list = clubMapper.selectClub();
//			// TODO Auto-generated method stub
//			PageInfo<Club> pageInfo = new PageInfo<Club>(list);
//			System.out.println("数据总数：" + pageInfo.getTotal());  
//		    System.out.println("数据总页数：" + pageInfo.getPages());  
//		    System.out.println("最后一页：" + pageInfo.getLastPage()); 
//		    
//		    for (Club club : pageInfo.getList()) {  
//		        System.out.println(club);  
//		    } 
//			return list;
//		}else{
//			return clubMapper.selectClub();
//		}
		return clubMapper.selectClub();
	}
	@Override
	public List<Player> selectPlayer(Integer cid) {
		// TODO Auto-generated method stub
		
		return clubMapper.selectPlayer(cid);
	}
	@Override
	public PageInfo<Player> selectPlayerPage(Integer cid, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(currentPage, pageSize, true);
		List<Player> list = clubMapper.selectPlayer(cid);
		PageInfo<Player> pageInfo = new PageInfo<Player>(list);
		return pageInfo;
	}
	@Override
	public PageInfo<Player> selectAllPlayerPage(Player player,int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(currentPage, pageSize, true);
		List<Player> list = clubMapper.selectAllPlayer(player);
		PageInfo<Player> pageInfo = new PageInfo<Player>(list);
		return pageInfo;
	}
	@Override
	public Integer selectPlayerId() {
		int i = clubMapper.selectPlayerId()+1;
		return i;
	}
	@Override
	public int addPlayer(Player player) {
		
		int count = clubMapper.countPlayer(player.getCid(),player.getNumber());
		if(count==0){
			StringBuilder pinyin = new StringBuilder();  
			if(Character.toString(player.getName().charAt(0)).matches("[\\u4E00-\\u9FA5]+")){  
	            pinyin.append(PinyinHelper.toHanyuPinyinStringArray(player.getName().charAt(0))[0]);  
	        }else{  
	            pinyin.append(player.getName().charAt(0));  		
	        }  
			player.setHead(pinyin.charAt(0)+"");
			clubMapper.addPlayer(player);
			return 1;
		}else{
			return 0;
		}
	}
	@Override
	public Player selectPlayerByPid(int pid) {
		// TODO Auto-generated method stub
		Player player = clubMapper.selectPlayerByPid(pid);
		return player;
	}
	@Override
	
	
	public int updatePlayer(Player player) {
		// TODO Auto-generated method stub
		int i = clubMapper.updatePlayer(player);
		return i;
	}
	@Override
	public int deletePlayer(int pid) {
		// TODO 自动生成的方法存根
		return clubMapper.deletePlayer(pid);
	}
	@Override
	public Club selectClubDetail(Integer cid) {
		// TODO 自动生成的方法存根
		Club club = clubMapper.selectClubById(cid);
		List<Achievement> list = clubMapper.selectClubAchievement(cid);
		club.setList(list);
		
		return club;
	}
	@Override
	public int insertAchievement(Achievement ach) {
		
		return clubMapper.insertAchievement(ach);
	}
	@Override
	public int deleteAchievement(Integer id) {
		
		return clubMapper.deleteAchievement(id);
	}
	@Override
	public int updateAchievement(Achievement ach) {
		// TODO Auto-generated method stub
		return clubMapper.updateAchievement(ach);
	}
	@Override
	public List<Player> selectPlayerList(String head) {
		// TODO 自动生成的方法存根
		return clubMapper.selectPlayerList(head);
	}
	@Override
	public Integer selectClubId() {
		// TODO 自动生成的方法存根
		return clubMapper.selectClubId()+1;
	}
	@Override
	public int addClub(Club club) {
		// TODO 自动生成的方法存根
		return clubMapper.addClub(club);
	}
	@Override
	public int updateClub(Club club) {
		// TODO 自动生成的方法存根
		return clubMapper.updateClub(club);
	}
	
	
	

}
