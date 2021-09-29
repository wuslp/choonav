package cnav.reservation.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.mypage.dto.UserInfoDTO;
import cnav.reservation.dto.ReservationDTO;

@Repository
public class ReservationDAOImpl implements ReservationDAO{

	@Autowired // vers.2 자동 주입 
	private SqlSessionTemplate sqlSession = null;
	
	
	@Override
	public List getRezList(String code) throws SQLException {
		System.out.println("dao");
		List list = sqlSession.selectList("rez.getRezList", code);
		
		return list;
	}


	@Override
	public int insertRez(ReservationDTO rezDTO) throws SQLException {
		int res = sqlSession.insert("rez.insertRez", rezDTO);
		return res;
	}


	@Override
	public ReservationDTO getRezContent(ReservationDTO rezDTO) throws SQLException {
		ReservationDTO dto = sqlSession.selectOne("rez.getRezContent", rezDTO);
		return dto;
	}


	@Override
	public int rezDelete(int rezNum) throws SQLException {
		int res = sqlSession.delete("rez.deleteRez", rezNum);
		System.out.println("delete result : " + res);
		return res;
	}


	@Override
	public List getMyrezList(ReservationDTO rezDTO, int start, int end) throws SQLException {
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("code", rezDTO.getCode());
		map.put("userId", rezDTO.getUserId());
		
		
		List<ReservationDTO> list = sqlSession.selectList("rez.selectMylist", map);
		if(list != null) {
			for(ReservationDTO dto : list) {
				dto.setsDate(dto.getsDate().split(" ")[0]+" "+dto.getsTime());
				dto.seteDate(dto.geteDate().split(" ")[0]+" "+dto.geteTime());
			}
		}
		return list;
	}


	@Override
	public int getSearchRezCount(String code) throws SQLException {
		return sqlSession.selectOne("rez.countAll", code);
	}


	@Override
	public int getSearchMyrezCount(ReservationDTO rezDTO) throws SQLException {
		return sqlSession.selectOne("rez.countMy", rezDTO);
	}

	// 계정정보
	@Override
	public UserInfoDTO getUserInfo(String userId, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("code", code);
		
		UserInfoDTO dto = sqlSession.selectOne("rez.selectUserInfo", map);
		return dto;
	}
}
