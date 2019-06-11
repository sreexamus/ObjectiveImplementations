//
//  UIView+PGAutoLayout.swift
//  SmartThings
//
//  Created by Brendon Justin on 1/27/17.
//  Copyright © 2017 Physical Graph. All rights reserved.
//

import UIKit


extension UIView {
    /// Adds the view to the view hierarchy without translating
    /// masks into constraints
    @objc func pg_addAutoLayoutSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }

    /**
     Call `pg_autoPinEdgesToSuperviewEdgesWithInsets:` with `UIEdgeInsetsZero`.
     
     Does not change `-[UIView translatesAutoResizingMask]`.
     */
    @discardableResult
    @objc func pg_autoPinEdgesToSuperviewEdges() -> [NSLayoutConstraint] {
        return pg_autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsets.zero)
    }

    /**
     Anchor `self` to its superview's edges, with insets. To contain `self` entirely within
     its superview's bounds, pass all positive - or zero - values in the `insets`.
     
     Returned constraints are already active.
     
     `self` must have a `superview` when this method is used.
     
     Does not change `-[UIView translatesAutoResizingMask]`
     */
    @discardableResult
    @objc func pg_autoPinEdgesToSuperviewEdgesWithInsets(_ insets: UIEdgeInsets) -> [NSLayoutConstraint] {
        return pg_constrainToSuperview(edges: .all, insets: insets)
    }

    /// Centers the view (self) by anchoring to the superivew's
    /// center x & y anchors. Must have a superview!
    @discardableResult
    @objc func pg_autoCenterInSuperview() -> [NSLayoutConstraint] {
        guard let superview = superview else {
            assertionFailure("View must have a superview before constraining to its superview.")
            return []
        }

        let constraints: [NSLayoutConstraint] = [
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    /**
     Create and activate constraints setting a view's size.
     */
    @discardableResult
    @objc func pg_constrainToSize(_ size: CGSize) -> [NSLayoutConstraint] {
        let constraints: [NSLayoutConstraint] = [
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height),
            ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    /**
     Copy of `pg_constrainToSuperviewEdges:withInsets:relativeToMargins:shouldActivate:`, passing the default argument for `shouldActivate`.
     `shouldActivate` was added later than the other arguments and providing a version without that argument let us avoid updating every
     Objective-C use of that method.
     
     Do not use this method from Swift code.
     
     - seealso: `pg_constrainToSuperviewEdges:withInsets:relativeTomargins:shouldActivate:`
     */
    @discardableResult
    @objc(pg_constrainToSuperviewEdges:withInsets:relativeToMargins:)
    func __pg_constrainToSuperview(edges: PGViewEdge = .all, insets: UIEdgeInsets = UIEdgeInsets.zero, relativeToMargins: Bool = false) -> [NSLayoutConstraint] {
        return pg_constrainToSuperview(edges: edges, insets: insets, relativeToMargins: relativeToMargins, shouldActivate: true)
    }

    /**
     Pin `edges` to the same edges in our `superview`.
     
     - parameters:
         - edges: Which of our edges to constrain relative to the equivalent edges in our `superview`.
         - insets: The distance that we should be inset at each edge, relative to our superview's edges.
             `insets.left` corresponds to our leading edge, `insets.right` to our trailing edge.
             `UIEdgeInsetsMake(8,8,8,8)` will result in us being inset from our `superview` by 8 points all around.
             Defaults to `UIEdgeInsetsZero`.
         - relativeToMargins: If `true`, we will be constrained relative to our `superview`'s `layoutMarginsGuide`,
             instead of the `superview` itself. Defaults to `false`.
     */
    @discardableResult
    @objc(pg_constrainToSuperviewEdges:withInsets:relativeToMargins:shouldActivate:)
    func pg_constrainToSuperview(edges: PGViewEdge = .all, insets: UIEdgeInsets = UIEdgeInsets.zero, relativeToMargins: Bool = false, shouldActivate: Bool = true) -> [NSLayoutConstraint] {
        guard let superview = superview else {
            assertionFailure("View must have a superview before constraining to its superview.")
            return []
        }

        let relativeTarget: AnyObject
        if relativeToMargins {
            relativeTarget = superview.layoutMarginsGuide
        } else {
            relativeTarget = superview
        }

        var constraints: [NSLayoutConstraint] = []

        if edges.contains(.top) {
            constraints.append(topAnchor.constraint(equalTo: relativeTarget.topAnchor, constant: insets.top))
        }

        if edges.contains(.leading) {
            constraints.append(leadingAnchor.constraint(equalTo: relativeTarget.leadingAnchor, constant: insets.left))
        }

        if edges.contains(.bottom) {
            constraints.append(bottomAnchor.constraint(equalTo: relativeTarget.bottomAnchor, constant: -insets.bottom))
        }

        if edges.contains(.trailing) {
            constraints.append(trailingAnchor.constraint(equalTo: relativeTarget.trailingAnchor, constant: -insets.right))
        }

        if shouldActivate {
            NSLayoutConstraint.activate(constraints)
        }

        return constraints
    }

    /**
     Helper function to set the corners for the View
     */
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
