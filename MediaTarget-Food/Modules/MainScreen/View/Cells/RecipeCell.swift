import UIKit
import Kingfisher

class RecipeCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView! { didSet { coverImageView.layer.cornerRadius = 5 } }
    
    func configure(from model: ApiRecipe) {
        titleLabel.text = model.title
        publisherLabel.text = model.publisher
        guard let url = URL(string: model.image_url) else { return }
        coverImageView.kf.setImage(with: url)
    }
}
