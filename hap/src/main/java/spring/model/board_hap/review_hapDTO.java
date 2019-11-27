package spring.model.board_hap;

public class review_hapDTO {
	private int rw_num;
	private String rw_title;
	private String rw_content;
	private String rw_date;
	private String rw_filename;
	private String rw_star;
	private int room_num;
	private String member_id;
	public review_hapDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public review_hapDTO(int rw_num, String rw_title, String rw_content, String rw_date, String rw_filename, String rw_star,
			int room_num, String member_id) {
		super();
		this.rw_num = rw_num;
		this.rw_title = rw_title;
		this.rw_content = rw_content;
		this.rw_date = rw_date;
		this.rw_filename = rw_filename;
		this.rw_star = rw_star;
		this.room_num = room_num;
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "ReplyDTO [rw_num=" + rw_num + ", rw_title=" + rw_title + ", rw_content=" + rw_content + ", rw_date="
				+ rw_date + ", rw_filename=" + rw_filename + ", rw_star=" + rw_star + ", room_num=" + room_num
				+ ", member_id=" + member_id + "]";
	}
	public int getRw_num() {
		return rw_num;
	}
	public void setRw_num(int rw_num) {
		this.rw_num = rw_num;
	}
	public String getRw_title() {
		return rw_title;
	}
	public void setRw_title(String rw_title) {
		this.rw_title = rw_title;
	}
	public String getRw_content() {
		return rw_content;
	}
	public void setRw_content(String rw_content) {
		this.rw_content = rw_content;
	}
	public String getRw_date() {
		return rw_date;
	}
	public void setRw_date(String rw_date) {
		this.rw_date = rw_date;
	}
	public String getRw_filename() {
		return rw_filename;
	}
	public void setRw_filename(String rw_filename) {
		this.rw_filename = rw_filename;
	}
	public String getRw_star() {
		return rw_star;
	}
	public void setRw_star(String rw_star) {
		this.rw_star = rw_star;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
