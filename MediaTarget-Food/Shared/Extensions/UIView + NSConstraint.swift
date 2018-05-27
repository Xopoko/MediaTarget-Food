import UIKit

extension UIView {
    func constraintToParrent(left: CGFloat = 0, right: CGFloat = 0, top: CGFloat = 0, bottom: CGFloat = 0) {
        guard let sv = superview else { print("Superview is nil!");return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leftAnchor.constraint(equalTo: sv.leftAnchor, constant: left),
                                     rightAnchor.constraint(equalTo: sv.rightAnchor, constant: right),
                                     topAnchor.constraint(equalTo: sv.topAnchor, constant: top),
                                     bottomAnchor.constraint(equalTo: sv.bottomAnchor, constant: bottom)
            ])
    }
    func constraintToParrentCenter(widthOffset: CGFloat = 0, centerXoffset: CGFloat = 0, centerYoffset: CGFloat = 0) {
        guard let sv = superview else { print("Superview is nil!");return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([widthAnchor.constraint(equalTo: sv.widthAnchor, constant: widthOffset),
                                     //heightAnchor.constraint(equalToConstant: height),
            centerXAnchor.constraint(equalTo: sv.centerXAnchor, constant: centerXoffset),
            centerYAnchor.constraint(equalTo: sv.centerYAnchor, constant: centerYoffset)
            ])
    }
}
