//
//  CloseButtonConfig.swift
//  PanModal
//
//  Copyright © 2017 Tiny Speck, Inc. All rights reserved.
//

#if os(iOS)
import UIKit

/**
 Configuration for the close button displayed on the dimmed background view
 above the presented view.
 */
public struct CloseButtonConfig {
    
    /**
     A flag to determine if the close button should be shown.
     */
    public let isEnabled: Bool
    
    /**
     The size (width and height) of the close button.
     */
    public let size: CGSize
    
    /**
     The vertical distance between the close button and the top of the presented view.
     */
    public let distanceFromPresentedView: CGFloat
    
    /**
     The image to be displayed in the close button.
     If nil, a default system close icon will be used.
     */
    public let image: UIImage?
    
    /**
     The closure to be executed when the close button is tapped.
     If nil, the default behavior is to dismiss the presented view controller.
     */
    public let action: (() -> Void)?
    
    /**
     Initializes a close button configuration.
     
     - Parameters:
       - isEnabled: Whether the close button should be shown. Default is `false`.
       - size: The size of the close button. Default is `CGSize(width: 32.0, height: 32.0)`.
       - distanceFromPresentedView: The vertical distance from the presented view. Default is `16.0`.
       - image: The image for the close button. Default is `nil` (uses system icon).
       - action: The action to perform when tapped. Default is `nil` (dismisses the modal).
     */
    public init(
        isEnabled: Bool = false,
        size: CGSize = CGSize(width: 0, height: 0),
        distanceFromPresentedView: CGFloat = 0,
        image: UIImage? = nil,
        action: (() -> Void)? = nil
    ) {
        self.isEnabled = isEnabled
        self.size = size
        self.distanceFromPresentedView = distanceFromPresentedView
        self.image = image
        self.action = action
    }
    
    /**
     Default configuration with close button disabled.
     */
    public static let `default` = CloseButtonConfig()
}
#endif
