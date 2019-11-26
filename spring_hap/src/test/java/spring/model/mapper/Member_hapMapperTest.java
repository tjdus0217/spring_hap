package spring.model.mapper;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import spring.model.member_hap.Member_hapDTO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { 
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})

public class Member_hapMapperTest {

	private static final Logger logger=LoggerFactory.getLogger(Member_hapMapperTest.class);
	
	@Autowired
	private Member_hapMapper mapper;
	
	@Test
	//@Ignore
	public void testMember_create() {
		Member_hapDTO dto=new Member_hapDTO();
		
		dto.setMember_id("sysy");
		dto.setMember_name("sysy");
		dto.setMember_passwd("sysy");
		dto.setMember_phone("sysy");
		dto.setMember_email("sysy@sysy.com");
		dto.setMember_birth("121212");
	
		
		assertTrue(mapper.member_create(dto)>0);
		
		
	}
  
	@Test
	@Ignore
	public void testDuplicatedId() {
		fail("Not yet implemented");
	}

	@Test
	@Ignore
	public void testDuplicatedEmail() {
		fail("Not yet implemented");
	}

}
