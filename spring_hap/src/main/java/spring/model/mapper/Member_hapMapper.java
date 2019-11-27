package spring.model.mapper;

import java.util.Map;

import spring.model.member_hap.Member_hapDTO;

public interface Member_hapMapper {

	int member_create(Member_hapDTO dto) ;

	int duplicatedId(String member_id);

	int duplicatedEmail(String member_email);
	
	//String getMember_fname(String member_id);
	
	int loginCheck(Map<String, String> map);

	String getMember_grade(String member_id);

	//String findId(Map map);

	String findPasswd(Map map);

}
