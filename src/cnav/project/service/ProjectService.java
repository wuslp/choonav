package cnav.project.service;

import java.sql.SQLException;
import java.util.Map;

import cnav.project.dto.ProjectDTO;

public interface ProjectService {

	// 모든 프로젝트 불러오기 (proList)
	public Map<String,Object> getProjectList(String pageNum) throws SQLException;
	
	// 검색 list 가져오기 
	public Map<String, Object> getSearchProjectList(String pageNum, String sel, String search) throws SQLException;	
	// 진행중 완료를 보여주는 리스트(짜란)
	public Map<String, Object> getSortProject(String pageNum, String sort) throws SQLException;
	
	// 1개의 프로젝트 가져오기(content)
	public ProjectDTO getProject(int proNum) throws SQLException;
	// 프로젝트 등록 처리(writeForm)
	public void insertProject(ProjectDTO dto) throws SQLException;																																														
	// 프로젝트 수정폼 처리 (modifyForm)
	public ProjectDTO getUpdateProject(int proNum) throws SQLException;
	// 프로젝트 수정 프로  (modifyPro)
	public int updateProject(ProjectDTO dto) throws SQLException;
	// 프로젝트 삭제 처리
	public void deleteProject(String proNum) throws SQLException;
	
	
	
	
	
	

}
