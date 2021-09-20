package cnav.mypage.dao;

import java.sql.SQLException;
import java.util.List;

public interface MypageDAO {

	public int getSearchMypjCount(String userId, String code) throws SQLException;
	public int getSearchMytopicCount(String userId, String code) throws SQLException;
	public List getMypjList(String userId, String code, int start, int end) throws SQLException;
	public List getMytopicList(String userId, String code, int start, int end) throws SQLException;
}
