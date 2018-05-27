import UIKit

class EmptyView: UIView {
    
    private lazy var titleLabel = makeTitleView()
    private lazy var detailLabel = makeDetailView()
    private var buttonClosure: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func makeTitleView() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        return titleLabel
    }
    
    private func makeDetailView() -> UILabel {
        let detailLabel = UILabel()
        detailLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        detailLabel.textColor = .black
        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = .center
        return detailLabel
    }
    
    private func commonInit() {
        addSubview(titleLabel)
        addSubview(detailLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
                                     titleLabel.rightAnchor.constraint(equalTo: rightAnchor),
                                     titleLabel.topAnchor.constraint(equalTo: topAnchor),
                                     titleLabel.bottomAnchor.constraint(equalTo: detailLabel.topAnchor, constant: -10)])
        NSLayoutConstraint.activate([detailLabel.leftAnchor.constraint(equalTo: leftAnchor),
                                     detailLabel.rightAnchor.constraint(equalTo: rightAnchor),
                                     detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    
    func configure(with title: String, detail: String) {
        titleLabel.text = title
        detailLabel.text = detail
    }
}

