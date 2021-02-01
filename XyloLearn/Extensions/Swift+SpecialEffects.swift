

import Foundation
import UIKit
import ImageIO

extension UIView {
    
    func blurredEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        addSubview(blurEffectView)
  }
    
    func dismissBlurredEffect() {
        for subview in self.subviews {
            if subview is UIVisualEffectView{
                subview.removeFromSuperview()
            }
        }
    }
}

extension UIViewController {
    
    @objc func dismissOnTap() {
        dismiss(animated: true, completion: nil)
        view.dismissBlurredEffect()
    }
}
