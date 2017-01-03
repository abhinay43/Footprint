//
//  BlurPopDismissAnimationController.swift
//  Interview
//
//  Created by Abhinay Maurya on 13/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class BlurPopDismissAnimationController:NSObject
{
    
}


//MARK:- Extension
extension BlurPopDismissAnimationController{
    struct Animation {
        static let Duration = BlurPopUpAnimationController.Animation.Duration
    }
}

extension BlurPopDismissAnimationController:UIViewControllerAnimatedTransitioning
{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Animation.Duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        guard let fromViewController = transitionContext.viewController(forKey: .from), let toViewController = transitionContext.viewController(forKey: .to) else{
            return
        }
        
        let bounds = UIScreen.main.bounds
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        //This view acts as a superview for the views which involves in Transition
        let containerView = transitionContext.containerView
        containerView.addSubview(toViewController.view)
        containerView.sendSubview(toBack: toViewController.view)
        let endingRect = CGRect(x: 0, y: bounds.size.height, width: finalFrame.size.width, height: finalFrame.size.height)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toViewController.view.alpha = 1.0
            fromViewController.view.frame = endingRect
            
        }) { bool in
            transitionContext.completeTransition(true)
        }
        
    }
}
