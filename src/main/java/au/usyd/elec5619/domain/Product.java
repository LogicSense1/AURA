package au.usyd.elec5619.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;




@Entity
@Table(name = "Product")
public class Product implements Serializable {

	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int ID = (int) System.currentTimeMillis();
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "price")
	private int price;
	
	@Column(name = "ownerID")
	private int ownerID;
	private enum statusKind {
		nil, rented, available
	}
	
	@Column(name = "status")
	private statusKind status;
	
	@Column(name = "createdTime")
	private Timestamp createdTime;
	
	@Column(name = "location")
	private String location;
	
	@Column(name = "latitude")
	private double latitude;
	
	@Column(name = "longitude")
	private double longitude;
	
	@Lob
	@Column(name = "description",columnDefinition = "text")
	private String description;
	
	
	private enum range{
		_nil, _lessthan100, _100to200, _200to300, _over300
	}
	
	@Column(name = "priceRange")
	private range priceRange;
	
	@Column(name = "numberOfRooms")
	private int numberOfRooms;
	
	@Column(name = "parkingAvailable")
	private int parkingAvailable;
	
	
	private enum type{
		nil, House, Apartment, Unit, Studio, Town
	}
	
	@Column(name = "houseType")
	private type houseType;
	
	@Column(name = "availableStartTime")
	private Date availableStartTime;
	
	@Column(name = "availableEndTime")
	private Date availableEndTime;
	
	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getOwnerID() {
		return ownerID;
	}
	public void setOwnerID(int owneID) {
		this.ownerID = owneID;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getStatus() {
		return status.name();
	}
	public void setStatus(String status) {
		this.status = statusKind.valueOf(status);
	}
	
	public String getCreatedTime() {
		return createdTime.toString();
	}
	public void setCreatedTime(String createdTime) {
		this.createdTime = Timestamp.valueOf(createdTime);
	}
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public double getLatitude() {
		return latitude;
	}
	
	public double getLongitude() {
		return longitude;
	}
	
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	
	public String getPriceRange() {
		String Range = priceRange.name();
		Range = Range.substring(1, name.length());
		return Range;
	}
	public void setPriceRange(String Range) {
		Range = '_' + Range; 
		this.priceRange = range.valueOf(Range);
	}

	public int getParkingAvailable() {
		return parkingAvailable;
	}
	public void setParkingAvailable(int parking) {
		this.parkingAvailable = parking;
	}
	
	public int getNumberOfRooms() {
		return numberOfRooms;
	}
	public void setNumberOfRooms(int rooms) {
		this.numberOfRooms = rooms;
	}
	
	public String getHouseType() {
		return houseType.name();
	}
	public void setHouseType(String houseType) {
		this.houseType = type.valueOf(houseType);
	}
	
	public String getAvailableStartTime() {
		return availableStartTime.toString();
	}
	public void setAvailableStartTime(String start) {
		this.availableStartTime = Date.valueOf(start);
	}
	
	public String getAvailableEndTime() {
		return availableEndTime.toString();
	}
	public void setAvailableEndTime(String end) {
		this.availableEndTime = Date.valueOf(end);
	}
	
	
	public String getDescription() {
		return this.description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
}