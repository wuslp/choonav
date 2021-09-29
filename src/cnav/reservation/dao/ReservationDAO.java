package cnav.reservation.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.mypage.dto.UserInfoDTO;
import cnav.reservation.dto.ReservationDTO;

public interface ReservationDAO {

	public int getSearchRezCount(String code) throws SQLException;
	public List getRezList(String code) throws SQLException;
	public int insertRez(ReservationDTO rezDTO) throws SQLException;
	public ReservationDTO getRezContent(ReservationDTO rezDTO) throws SQLException;
	public int rezDelete(int rezNum) throws SQLException;
	public List getMyrezList(ReservationDTO rezDTO, int startRow, int endRow) throws SQLException;
	public int getSearchMyrezCount(ReservationDTO rezDTO) throws SQLException;
	// 계정정보
	public UserInfoDTO getUserInfo(String userId, String code) throws SQLException;
	
	
}
