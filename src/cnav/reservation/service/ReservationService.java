package cnav.reservation.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cnav.mypage.dto.UserInfoDTO;
import cnav.reservation.dto.ReservationDTO;

public interface ReservationService {
	// 예약목록 가져오기
	public List getRezList(String code) throws SQLException;
	// 예약정보 저장하기
	public int insertRez(ReservationDTO rezDTO) throws SQLException;
	// 예약상세 정보 가져오기
	public ReservationDTO getRezContent(ReservationDTO rezDTO) throws SQLException;
	// 예약정보 삭제
	public int rezDelete(int rezNum) throws SQLException;
	// 내예약정보 list 가져오기
	public Map<String, Object> getMyrezList(ReservationDTO rezDTO, String pageNum) throws SQLException;
	// 계정정보
	public UserInfoDTO getUserInfo(String userId, String code) throws SQLException;
}
