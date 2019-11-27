package spring.sts.hap;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.model.board_hap.review_hapDTO;
import spring.model.mapper.ReplyMapper;
import spring.utility.hap.Utility;

@RestController
public class ReplyController {
	private static final Logger log = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyMapper mapper;

	@PutMapping("/bbs/reply/{rw_num}")
	public ResponseEntity<String> modify(
	@RequestBody review_hapDTO dto, 
	@PathVariable("rw_num") int rw_num) {
	 
	log.info("rw_num: " + rw_num);
	log.info("modify: " + dto);
	 
	return mapper.update(dto) == 1
	? new ResponseEntity<String>("success", HttpStatus.OK)
	: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	 
	}
	 
	@DeleteMapping(value="/bbs/reply/{rw_num}/{room_num}/{nPage}",produces="application/json;charset=utf-8")
	public ResponseEntity<Map>delete(
									@PathVariable("rw_num") int rw_num,
									@PathVariable("room_num") int room_num,
									@PathVariable("nPage") int nPage
									){
	 int total=mapper.total(room_num);
	 int totalPage=(int)(Math.ceil((double)total/3));
	 
	 int cnt =mapper.delete(rw_num);
	 
	 ResponseEntity<Map>entity = null;
	 
	 if(cnt ==1) {
		 if(nPage!=1 && nPage==totalPage&& total%3==1)nPage=nPage-1;
		 Map map =new HashMap();
		 map.put("msg","success");
		 map.put("nPage",nPage);
		 entity=new ResponseEntity<Map>(map,HttpStatus.OK);
	 }else {
		 entity = new ResponseEntity<Map>(HttpStatus.INTERNAL_SERVER_ERROR);
	 }
	 return entity;
	}
	
	@GetMapping("/bbs/reply/{rw_num}")
	public ResponseEntity<review_hapDTO> get(@PathVariable("rw_num") int rw_num) {

		log.info("get: " + rw_num);

		return new ResponseEntity<review_hapDTO>(mapper.read(rw_num), HttpStatus.OK);
	}

	@PostMapping("/bbs/reply/create")
	public ResponseEntity<String> create(@RequestBody review_hapDTO dto) {

		log.info("ReplyDTO1: " + dto.getRw_content());
		log.info("ReplyDTO1: " + dto.getMember_id());
		log.info("ReplyDTO1: " + dto.getRoom_num());

		dto.setRw_content(dto.getRw_content().replaceAll("/n/r", "<br>"));

		int flag = mapper.create(dto);

		log.info("Reply INSERT flag: " + flag);

		return flag == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping("/bbs/reply/list/{room_num}/{sno}/{eno}")
	public ResponseEntity<List<review_hapDTO>> getList(@PathVariable("room_num") int room_num, @PathVariable("sno") int sno,
			@PathVariable("eno") int eno) {

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("room_num", room_num);

		return new ResponseEntity<List<review_hapDTO>>(mapper.list(map), HttpStatus.OK);
	}

	@GetMapping("/bbs/reply/page")
	public ResponseEntity<String> getPage(@RequestParam("nPage") int nPage, @RequestParam("nowPage") int nowPage,
			@RequestParam("room_num") int room_num, @RequestParam("col") String col, @RequestParam("word") String word) {

		int total = mapper.total(room_num);
		String url = "read";

		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수

		String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage, room_num);

		return new ResponseEntity<String>(paging, HttpStatus.OK);

	}

}
