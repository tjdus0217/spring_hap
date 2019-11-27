package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.board_hap.Board_hapDTO;

public interface Board_hapMapper {
	
	List<Board_hapDTO> list(Map map);
	int total(Map map);
	int create(Board_hapDTO dto);
	Board_hapDTO read(int board_num);
	
}
