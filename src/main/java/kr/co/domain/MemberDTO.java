package kr.co.domain;

import java.io.Serializable;

public class MemberDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	private String id;
	private String pw;
	private String name;
	private int age;
	private int rrNum1;
	private int rrNum2;
	private String phoneNum;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String authority;
	private String grade;
	private int purchased_amount;
	private String email;
	
	public MemberDTO() {
	}





	public MemberDTO(String id, String pw, String name, int age, int rrNum1, int rrNum2, String phoneNum,
			String userAddr1, String userAddr2, String userAddr3, String authority, String grade, int purchased_amount,
			String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.rrNum1 = rrNum1;
		this.rrNum2 = rrNum2;
		this.phoneNum = phoneNum;
		this.userAddr1 = userAddr1;
		this.userAddr2 = userAddr2;
		this.userAddr3 = userAddr3;
		this.authority = authority;
		this.grade = grade;
		this.purchased_amount = purchased_amount;
		this.email = email;
	}







	
	


	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}





	public String getPhoneNum() {
		return phoneNum;
	}





	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}




	public int getRrNum1() {
		return rrNum1;
	}



	public void setRrNum1(int rrNum1) {
		this.rrNum1 = rrNum1;
	}





	public int getRrNum2() {
		return rrNum2;
	}





	public void setRrNum2(int rrNum2) {
		this.rrNum2 = rrNum2;
	}





	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}


	public String getUserAddr1() {
		return userAddr1;
	}

	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}

	public String getUserAddr2() {
		return userAddr2;
	}

	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}

	public String getUserAddr3() {
		return userAddr3;
	}

	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getPurchased_amount() {
		return purchased_amount;
	}

	public void setPurchased_amount(int purchased_amount) {
		this.purchased_amount = purchased_amount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberDTO other = (MemberDTO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	
	
	
	

}
