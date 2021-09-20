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
	public int getProjectCount() throws SQLException {
		// 프로젝트 전체글 개수 가져오기
		int count=sqlSession.selectOne("project.countAll");
		
		return count;
	}

	// 한페이지에 있는 프로젝트 목록 가져오기
	@Override
	public List<ProjectDTO> getProjects(int start, int end) throws SQLException {
		
		HashMap map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		List<ProjectDTO> projectList=sqlSession.selectList("project.getProjects",map);
		
		return projectList;
	}
	// 검색 프로젝트 수 가져오기
	@Override
	public int getSearchProjectCount(String sel, String search) throws SQLException {
		sqlSession.update("project.updat1"); 
		sqlSession.update("project.updat2");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("sel", "sel");
		map.put("search", "search");
		
		int count=sqlSession.selectOne("project.getSearchProjectCount",map);
		
		return count;
	
		
	}
	//검색 프로젝트 목록 가져오기 
	@Override
	public List<ProjectDTO> getSearchProjects(int start, int end, String sel, String search) throws SQLException{
		
		HashMap map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("sel", sel);
		map.put("search", search);
		
		List<ProjectDTO> projectList=sqlSession.selectList("project.getSearchProjects",map);
		
		return projectList;
	}

	// 진행중 완료만
	@Override
	public int getProjectState(String sort) throws SQLException{
		sqlSession.update("project.updat1");
		sqlSession.update("project.updat2");
		
		int count=sqlSession.selectOne("project.getProjectState",sort);
		
		return count;
	}
	// 진행중/ 완료 구분하기 
	@Override
	public List<ProjectDTO> getState(int startRow, int endRow, String sort ) throws SQLException{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startRow","startRow");
		map.put("endRow","endRow");
		map.put("sort","sort");
		
		List<ProjectDTO> projectList=sqlSession.selectList("project.getState",map);
		return projectList;
	}
	
	// 프로젝트 저장
	@Override
	public void insertProject(ProjectDTO dto) throws SQLException {
			sqlSession.insert("project.insertProject",dto);
				
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
	public void deleteProject(ProjectDTO dto) throws SQLException{
		sqlSession.delete("project.deleteProject", dto);
	}


	



	
	
}
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

