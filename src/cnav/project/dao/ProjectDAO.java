package cnav.project.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.project.dto.ProjectDTO;

public interface ProjectDAO {

	
	// 모든 프로젝트 개수 가져오기 
	public int getProjectCount(String userId,String code) throws SQLException;
	//public int getProjectCount() throws SQLException;
	
	// 모든 프로젝트 목록 불러오기 
	public List<ProjectDTO> getProjects(int start, int end,String code) throws SQLException;
	
	// 프로젝트 검색 수 가져오기 
	public int getSearchProjectCount(String sel, String search,String code) throws SQLException;
	// 검색 list 가져오기 
	public List<ProjectDTO> getSearchProjects(int start, int end, String sel, String search,String code) throws SQLException;
	// 진행중/완료 프로젝트
	public int getProjectState(String sort, String code) throws SQLException;
	// 진행중/완료 표시 
	public List<ProjectDTO> getState(int startRow, int endRow, String sort, String code) throws SQLException;
	

	// 프로젝트 저장
	public void insertProject(ProjectDTO dto) throws SQLException;
	// 유저아이디=이름
	public String getName(String userId) throws SQLException;
	// 프로젝트 1개 가져오기 
	public ProjectDTO getProject(int proNum) throws SQLException;
	// 유저아이디 확인
	//public int userIdCheck(ProjectDTO dto) throws SQLException;
	
	// 프로젝트 수정
	public void updateProject(ProjectDTO dto) throws SQLException;
	// 프로젝트 삭제 
	public void deleteProject(String proNum) throws SQLException;
	
	
	
	
}
