import UIKit
import NVActivityIndicatorView

class CustomRingLoader: UIView {
    
    private var indicatorView: NVActivityIndicatorView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        setupActivityIndicatorView()
    }
    
    private func setupActivityIndicatorView() {
        let indicatorSize: CGFloat = 30
        let frame = CGRect(x: (bounds.width - indicatorSize) / 2, y: (bounds.height - indicatorSize) / 2, width: indicatorSize, height: indicatorSize)
        indicatorView = NVActivityIndicatorView(frame: frame, type: .circleStrokeSpin, color: .red, padding: nil)
        
        addSubview(indicatorView)
        indicatorView.startAnimating()
    }
    
    func startAnimating() {
        indicatorView.startAnimating()
    }
    
    func stopAnimating() {
        indicatorView.stopAnimating()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Center the indicator view
        indicatorView.frame.size = CGSize(width: 30, height: 30)
        indicatorView.center = CGPoint(x: bounds.midX, y: bounds.midY)
    }
}

