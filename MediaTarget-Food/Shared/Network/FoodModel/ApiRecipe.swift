struct ApiRecipe: Decodable, Hashable {
    var hashValue: Int {
        return Int(recipe_id) ?? 0
    }
    
    static func == (lhs: ApiRecipe, rhs: ApiRecipe) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var recipe_id: String
    var title: String
    var image_url: String
    var publisher: String
    
    init(recipe_id: String = "", title: String = "", image_url: String = "", publisher: String = "") {
        self.recipe_id = recipe_id
        self.title = title
        self.image_url = image_url
        self.publisher = publisher
    }
}
