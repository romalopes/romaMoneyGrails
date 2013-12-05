package br.com.romalopes.romamoneygrails

class GroupCategory {

	String name
	String image
	String groupType
	
	List categories
	static hasMany=[categories:Category]
	  
    static constraints = {
		name(blank:false, nullable: false, size:6..50)
		groupType(blank:false, nullable: false, inList: ["Positive", "Negative"])
    }
	
	String toString(){
		return name
  }

}
