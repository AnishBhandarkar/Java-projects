package com.student.management;

public class Student {
	private int studentID;
	private String studentName;
	private String studentPhno;
	private String studentCity;
	
	public Student(int studentID, String studentName, String studentPhno, String studentCity) {
		super();
		this.studentID = studentID;
		this.studentName = studentName;
		this.studentPhno = studentPhno;
		this.studentCity = studentCity;
	}

	public Student(String studentName, String studentPhno, String studentCity) {
		super();
		this.studentName = studentName;
		this.studentPhno = studentPhno;
		this.studentCity = studentCity;
	}

	public Student() {
		super();
	}

	@Override
	public String toString() {
		return "Student [studentName=" + studentName + ", studentPhno=" + studentPhno
				+ ", studentCity=" + studentCity + "]";
	}

	public int getStudentID() {
		return studentID;
	}

	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentPhno() {
		return studentPhno;
	}

	public void setStudentPhno(String studentPhno) {
		this.studentPhno = studentPhno;
	}

	public String getStudentCity() {
		return studentCity;
	}

	public void setStudentCity(String studentCity) {
		this.studentCity = studentCity;
	}
	
	
}
