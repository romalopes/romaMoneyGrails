package br.com.romalopes.romamoneygrails

class GroupCategory {

	String name
	String image
	String group_type
	
	List categories
	static hasMany=[categories:Category]
	  
    static constraints = {
		name(blank:false, nullable: false, size:6..50)
		group_type(blank:false, nullable: false, inList: ["Positive", "Negative"])
    }
	
	String toString(){
		return name
  }

}
