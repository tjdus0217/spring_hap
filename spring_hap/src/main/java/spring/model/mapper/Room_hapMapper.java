package spring.model.mapper;

import java.util.List;

import spring.model.room_hap.Room_hapDTO;

public interface Room_hapMapper {
	
	int create(Room_hapDTO dto);
	List<Room_hapDTO> list(int board_num);

}
