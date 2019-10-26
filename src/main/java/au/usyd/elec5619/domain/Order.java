package au.usyd.elec5619.domain;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class Order {
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int ID;
	
	@Column(name = "user_id")
	private int user_ID;
	
	@Column(name = "houseID")
	private int house_ID;
	
	@Column(name = "ownerID")
	private int owner_ID;
	
	@Column(name = "cost")
	private int cost;
	
	enum orderStatus{
		nil, unpaid, prepared, running, canceled
	}
	
	@Column(name = "orderStatus")
	private orderStatus currentStatus;
	
	@Column(name = "createdTime")
	private Timestamp createdTime;
	
	@Column(name = "rent_start")
	private Date startDate;
	
	@Column(name = "rent_end")
	private Date endDate;
	
	public int getID() {
		return this.ID;
	}
	public void setID(int ID) {
		this.house_ID = ID;
	}
	
	public int getUser_ID() {
		return this.user_ID;
	}
	public void setUser_ID(int user_ID) {
		this.user_ID = user_ID;
	}
	
	public int getOwner_ID() {
		return this.owner_ID;
	}
	public void setOwner_ID(int owner_ID) {
		this.owner_ID = owner_ID;
	}
	
	public int getHouse_ID() {
		return this.house_ID;
	}
	public void setHouse_ID(int house_ID) {
		this.house_ID = house_ID;
	}
	
	public int getCost() {
		return this.cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	
	public String getCurrentStatus() {
		return this.currentStatus.name();
	}
	
	public void setCurrentStatus(String status) {
		this.currentStatus = orderStatus.valueOf(status);
	}
	
	public String getCreatedTime() {
		return createdTime.toString();
	}
	public void setCreatedTime(String createdTime) {
		this.createdTime = Timestamp.valueOf(createdTime);
	}
	
	public String getStartDate() {
		return startDate.toString();
	}
	public void setStartDate(String start) {
		this.startDate = Date.valueOf(start);
	}
	
	public String getEndDate() {
		return endDate.toString();
	}
	public void setEndDate(String end) {
		this.endDate = Date.valueOf(end);
	}
}
