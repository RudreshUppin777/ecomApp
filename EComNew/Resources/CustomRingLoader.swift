import UIKit
import NVActivityIndicatorView

class CustomRingLoader: UIView {
    
    private var indicatorView: NVActivityIndicatorView!
    private var customCenterPoint: CGPoint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    /// Initialize with a custom center point (relative to this view's coordinate system)
    /// This allows centering based on the parent view's center point
    /// Note: The center point is set after initialization, so it takes effect in layoutSubviews()
    convenience init(frame: CGRect, centerPoint: CGPoint) {
        self.init(frame: frame)
        self.customCenterPoint = centerPoint
        // Trigger layout to apply the custom center point immediately
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    private func setupView() {
        setupActivityIndicatorView()
    }
    
    private func setupActivityIndicatorView() {
        let indicatorSize: CGFloat = 30
        let centerPoint = customCenterPoint ?? CGPoint(x: bounds.midX, y: bounds.midY)
        let frame = CGRect(x: centerPoint.x - indicatorSize / 2, y: centerPoint.y - indicatorSize / 2, width: indicatorSize, height: indicatorSize)
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
        // Center the indicator view using custom center point or bounds center
        indicatorView.frame.size = CGSize(width: 30, height: 30)
        let centerPoint = customCenterPoint ?? CGPoint(x: bounds.midX, y: bounds.midY)
        indicatorView.center = centerPoint
    }
    
    /// Update the center point for the indicator (relative to this view's bounds)
    func updateCenterPoint(_ point: CGPoint) {
        customCenterPoint = point
        setNeedsLayout()
    }
}



