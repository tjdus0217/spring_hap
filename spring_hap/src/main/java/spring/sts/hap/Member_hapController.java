package spring.sts.hap;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.mapper.Member_hapMapper;
import spring.model.member_hap.Member_hapDTO;
import spring.utility.hap.Utility;

@Controller
public class Member_hapController {

	@Autowired
	private Member_hapMapper mapper;

	@GetMapping("/member_hap/agree")
	public String agree() {
		return "/member_hap/agree";
	}
	
	@ResponseBody
	@GetMapping(value = "/member_hap/idcheck", produces = "application/json; charset=utf-8")
	public Map<String, Object> idcheck(String member_id) {
		int flag = mapper.duplicatedId(member_id);

		Map<String, Object> map=new HashMap<String, Object>();

		if (flag==1) {
			map.put("str", member_id + "은(는) 중복된 아이디입니다. 다른 아이디를 입력해주세요.");
		} else {
			map.put("str", member_id + "은(는) 사용할 수 있습니다.");
		}
		return map;
	}
	
	@ResponseBody
	@GetMapping(value = "/member_hap/emailcheck", produces = "application/json; charset=utf-8")
	public Map<String, Object> emailcheck(String member_email) {
		
		int flag = mapper.duplicatedEmail(member_email);

		Map<String, Object> map=new HashMap<String, Object>();

		if (flag==1) {
			map.put("str", member_email + "은(는) 중복된 이메일입니다. 다른 이메일을 입력해주세요.");
		} else {
			map.put("str", member_email + "은(는) 사용할 수 있습니다.");
		}
		return map;
	}
	
	@GetMapping("/member_hap/member_create")
	public String member_create() {
		return "/member_hap/member_create";
	}
	
	@PostMapping("/member_hap/member_create")
	public String member_createProc(Member_hapDTO dto, Model model, HttpServletRequest request) {
		
		String url="/member_hap/preProc";
		
		if(mapper.duplicatedId(dto.getMember_id())==1){
			model.addAttribute("str", "중복된 아이디입니다. 아이디를 다시 입력해주세요");
		}else if(mapper.duplicatedEmail(dto.getMember_email())==1){
			model.addAttribute("str", "중복된 이메일입니다. 이메일을 다시 입력해주세요");
		}
		
			String basePath=request.getRealPath("/storage");
			
			int size=(int)dto.getMember_fnameMF().getSize();
			
			if(size>0) {
				dto.setMember_fname(Utility.saveFileSpring(dto.getMember_fnameMF(), basePath));
			}else {
				dto.setMember_fname("member.jpg");
			}
			
			int flag=mapper.member_create(dto);
			
			if(flag==1) {
				return "redirect:/home";
			}else {
				model.addAttribute("str", "알 수 없는 이유로 회원가입에 실패하였습니다.");
				return url;
			}
			
		
		
	}
	
	
}
