package model.dto;
/***
 * @author soklu_000
 * create overloading constructor for 
 * first constructor: insert data in to tbstaff but no need Id field
 * second constructor: update data in to tbstaff but all field
 * */
public class StaffDTO {
	private  int id;
	private  String firstName;
	private String lastName;
	private char gender;
	private String position;
	private String phone;
	private String email;
	private String password;
	private String photo;
	private String status;
	
	public StaffDTO(){
		
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public StaffDTO(int id, String firstName, String lastName, char gender,
			String position, String phone, String email, String password,
			String photo, String status) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.position = position;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.photo = photo;
		this.status = status;
	}

	public StaffDTO(String firstName, String lastName, char gender,
			String position, String phone, String email, String password,
			String photo, String status) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.position = position;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.photo = photo;
		this.status = status;
	}

	/**
	 * @param firstName
	 * @param lastName
	 * @param gender
	 * @param phone
	 */
	public StaffDTO(String firstName, String lastName, char gender, String phone) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.phone = phone;
	}
	
	
	
	
}
