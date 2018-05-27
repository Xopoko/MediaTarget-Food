struct ApiSearch: Decodable {
    var count: Int
    var recipes: [ApiRecipe]
}
