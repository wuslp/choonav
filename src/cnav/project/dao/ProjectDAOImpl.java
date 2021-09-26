package cnav.project.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.project.dto.ProjectDTO;



@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Autowired 
	private SqlSessionTemplate sqlSession=null;

	// 전체 프로젝트 수 가져오기 
	@Override
	public int getProjectCount(String userId,String code) throws SQLException {

		sqlSession.update("project.updat2",code); //진행중
		sqlSession.update("project.updat1",code); // 날짜 지난것 완료로 업데이트 
		// 프로젝트 전체글 개수 가져오기
		int count=sqlSession.selectOne("project.countAll",code);		
		return count;
	}

	// 한페이지에 있는 프로젝트 목록 가져오기
	@Override
	public List<ProjectDTO> getProjects(int start, int end,String code) throws SQLException {
		
		HashMap map=new HashMap();
		map.put("start",start);
		map.put("end",end);		
		map.put("code",code);	
		List<ProjectDTO> projectList=sqlSession.selectList("project.getProjects",map);	
		return projectList;
	}
	// 검색 프로젝트 수 
	@Override
	public int getSearchProjectCount(String sel, String search,String code) throws SQLException {
		sqlSession.update("project.updat1",code); 
		sqlSession.update("project.updat2",code);
		
		HashMap map=new HashMap();
		map.put("sel", sel);
		map.put("search", search);
		map.put("code", code);
		int count=sqlSession.selectOne("project.getSearchProjectCount",map);
		
		return count;
			
	}
	//검색 프로젝트 목록 가져오기 
	@Override
	public List<ProjectDTO> getSearchProjects(int start, int end, String sel, String search,String code) throws SQLException{
		
		HashMap map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("sel", sel);
		map.put("search", search);
		map.put("code", code);
		List<ProjectDTO> projectList=sqlSession.selectList("project.getSearchProjects",map);
		
		return projectList;
	}

	// 진행중 완료만
	@Override
	public int getProjectState(String sort,String code) throws SQLException{
		sqlSession.update("project.updat1",code);
		sqlSession.update("project.updat2",code);		
		
		
		HashMap map=new HashMap();
		map.put("sort",sort);
		map.put("code",code);
		int count=sqlSession.selectOne("project.getProjectState",map);
		return count;
	}
	// 진행중/ 완료 구분하기 
	@Override
	public List<ProjectDTO> getState(int startRow, int endRow, String sort,String code) throws SQLException{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startRow","startRow");
		map.put("endRow","endRow");
		map.put("sort","sort");
		map.put("code","code");
		
		
		List<ProjectDTO> projectList=sqlSession.selectList("project.getState",map);
		return projectList;
	}
	
	// 프로젝트 저장
	@Override
	public void insertProject(ProjectDTO dto) throws SQLException {
			int result =sqlSession.insert("project.insertProject",dto);
			System.out.println("29번 project insert확인 : "+result);
				
	}

	// 프로젝트 1개 가져오기 
	@Override
	public ProjectDTO getProject(int proNum) throws SQLException {
		ProjectDTO project=sqlSession.selectOne("project.getOneProject",proNum);					
		return project;
	}
	
	
	// 아이디 체크(userId)
	//@Override
	//public int userIdCheck(ProjectDTO dto) throws SQLException{
	//	return sqlSession.selectOne("project.userIdCheck",dto);
	//}
	
	// 프로젝트 수정
	@Override
	public void updateProject(ProjectDTO dto) throws SQLException {
		sqlSession.update("project.updateProject",dto);
			
	}
	// 프로젝트 삭제
	@Override
	public void deleteProject(String proNum) throws SQLException{
		sqlSession.delete("project.deleteProject", proNum);
	}

	

	



	
	
}
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

