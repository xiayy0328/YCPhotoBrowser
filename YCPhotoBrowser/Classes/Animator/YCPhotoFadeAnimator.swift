//
//  YCPhotoFadeAnimator.swift
//  YCPhotoBrowserDemo
//
//  Created by Xyy on 2021/5/11.
//

import UIKit

open class YCPhotoFadeAnimator: NSObject, YCPhotoAnimatedTransitioning {
    
    open var showDuration: TimeInterval = 0.25
    
    open var dismissDuration: TimeInterval = 0.25
    
    open var isNavigationAnimation: Bool = false
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return isForShow ? showDuration : dismissDuration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let browser = browser else {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            return
        }
        if isNavigationAnimation, isForShow,
            let fromView = transitionContext.view(forKey: .from),
            let fromViewSnapshot = snapshot(with: fromView),
            let toView = transitionContext.view(forKey: .to)  {
            toView.insertSubview(fromViewSnapshot, at: 0)
        }
        if isForShow {
            browser.maskView.alpha = 0
            browser.browserView.alpha = 0
            if let toView = transitionContext.view(forKey: .to) {
                transitionContext.containerView.addSubview(toView)
            }
        } else {
            if isNavigationAnimation,
                let fromView = transitionContext.view(forKey: .from),
                let toView = transitionContext.view(forKey: .to) {
                transitionContext.containerView.insertSubview(toView, belowSubview: fromView)
            }
        }
        browser.browserView.isHidden = true
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            browser.browserView.isHidden = false
            browser.maskView.alpha = self.isForShow ? 1.0 : 0
            browser.browserView.alpha = self.isForShow ? 1.0 : 0
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
