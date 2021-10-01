//
//  helpers.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftMessages

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: Int = 8) {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}

@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
              layer.cornerRadius = newValue

              // If masksToBounds is true, subviews will be
              // clipped to the rounded corners.
              layer.masksToBounds = (newValue > 0)
        }
    }
}

extension UIViewController {
    
    func alert(message : String) {
        
        
        var config = SwiftMessages.Config()

        // Slide up from the bottom.
        config.presentationStyle = .center

        // Display in a window at the specified window level: UIWindow.Level.statusBar
        // displays over the status bar while UIWindow.Level.normal displays under.
        config.presentationContext = .window(windowLevel: .statusBar)

        // Disable the default auto-hiding behavior.
        config.duration = .seconds(seconds: 3)

        // Dim the background like a popover view. Hide when the background is tapped.

        config.dimMode = .color(color: UIColor.black.withAlphaComponent(0.5), interactive: true)

        // Disable the interactive pan-to-hide gesture.
        config.interactiveHide = true

        // Specify a status bar style to if the message is displayed directly under the status bar.
        config.preferredStatusBarStyle = .lightContent

        // Specify one or more event listeners to respond to show and hide events.
        config.eventListeners.append() { event in
            if case .didHide = event { print("yep") }
        }

        
        let view = MessageView.viewFromNib(layout: .centeredView)
                       
                       // Theme message elements with the warning style.
        view.configureTheme(.success)
                       
        view.button?.isHidden = true
        //view.iconImageView?.isHidden = true
                       
        view.configureContent(title: message, body: "")
        view.backgroundView.backgroundColor =  UIColor.init(named: "rojo")!
                       // Show the message.
        SwiftMessages.show(config: config, view: view)
        
      

    }
}


extension UIImage {
    
    func resizeImage(_ dimension: CGFloat, opaque: Bool, contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImage {
            var width: CGFloat
            var height: CGFloat
            var newImage: UIImage

            let size = self.size
            let aspectRatio =  size.width/size.height

            switch contentMode {
                case .scaleAspectFit:
                    if aspectRatio > 1 {                            // Landscape image
                        width = dimension
                        height = dimension / aspectRatio
                    } else {                                        // Portrait image
                        height = dimension
                        width = dimension * aspectRatio
                    }

            default:
                fatalError("UIIMage.resizeToFit(): FATAL: Unimplemented ContentMode")
            }

            if #available(iOS 10.0, *) {
                let renderFormat = UIGraphicsImageRendererFormat.default()
                renderFormat.opaque = opaque
                let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: renderFormat)
                newImage = renderer.image {
                    (context) in
                    self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
                }
            } else {
                UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), opaque, 0)
                    self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
                    newImage = UIGraphicsGetImageFromCurrentImageContext()!
                UIGraphicsEndImageContext()
            }

            return newImage
        }
    }

extension Alamofire.SessionManager{
    @discardableResult
    open func requestWithoutCache(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)// also you can add URLRequest.CachePolicy here as parameter
        -> DataRequest
    {
        do {
            var urlRequest = try URLRequest(url: url, method: method, headers: headers)
            urlRequest.cachePolicy = .returnCacheDataDontLoad
            let encodedURLRequest = try encoding.encode(urlRequest, with: parameters)
            return request(encodedURLRequest)
        } catch {
            // TODO: find a better way to handle error
            print(error)
            return request(URLRequest(url:url as! URL))
        }
    }
}

