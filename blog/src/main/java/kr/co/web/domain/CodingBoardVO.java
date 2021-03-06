package kr.co.web.domain;

import java.util.Date;

public class CodingBoardVO {
	private Integer board_number;
	private String title;
	private String contents;
	private String name;
	private Date create_date;
	private int view_count;
	private int reply_count;
	private String identification;
	

	public String getIdentification() {
		return identification;
	}

	public void setIdentification(String identification) {
		this.identification = identification;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	public Integer getBoard_number() {
		return board_number;
	}
	
	public void setBoard_number(Integer board_number) {
		this.board_number = board_number;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getCreate_date() {
		return create_date;
	}
	
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
	public int getView_count() {
		return view_count;
	}
	
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	
	@Override
	public String toString() {
		return "BoardVO [board_number=" + board_number + ", title=" + title + ", contents=" + contents + ", name=" + name + ", create_date="
				+ create_date + ", view_count=" + view_count + "]";
	}
}
