package br.com.romalopes.romamoneygrails

class Category {

	String name
	String image
	
	List transactions
	// Certify that Category will be deleted if a GroupCategory is deleted Cascade
	static belongsTo=[groupCategory:GroupCategory]

    static constraints = {
		name(blank:false, nullable: false, size:6..50)
    }
	
	String toString(){
		return name
  }

}
