package br.com.romalopes.romamoneygrails

class Category {

	String name
	String description
	String image
	
	List transactions
	// Certify that Category will be deleted if a GroupCategory is deleted Cascade
	static belongsTo=[groupCategory:GroupCategory]

    static constraints = {
		name(blank:false, nullable: false)
		description(blank:true, nullable: true)
    }
	
	String toString(){
		return name
  }

}
