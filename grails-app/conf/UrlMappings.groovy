class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/clinic"(controller: 'clinic')
		"/"		 (controller: 'main')

		"500"(view: '/error')
	}
}
