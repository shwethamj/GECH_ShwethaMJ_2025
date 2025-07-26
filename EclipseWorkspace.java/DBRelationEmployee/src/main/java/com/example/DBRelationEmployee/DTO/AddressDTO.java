package com.example.DBRelationEmployee.DTO;

public class AddressDTO {
	
	private String address;
    private String type;
    

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public AddressDTO(String address) {
		super();
		this.address = address;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public AddressDTO() {
		super();
	}


	
}
