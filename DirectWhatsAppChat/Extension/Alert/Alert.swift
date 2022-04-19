//
//  Alert.swift
//  Bookestan
//
//  Created by Faiz Ul Hassan on 1/08/21.
//

import UIKit

class Alert {
    
    public static func showAlert(vc: UIViewController, title:  String, message: String, actionTitle : String = "OK", handler: ((UIAlertAction) -> ())? = nil ) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let alertActionOK = UIAlertAction.init(title: actionTitle, style: UIAlertAction.Style.default, handler: handler)
        alertController.addAction(alertActionOK)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    public static func showConfirmationAlert(vc: UIViewController, title:  String, message: String, actionTitle1 : String = "Yes", actionTitle2 : String = "Cancel", handler1: ((UIAlertAction) -> ())? = nil, handler2: ((UIAlertAction) -> ())? = nil ) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: UIDevice.current.userInterfaceIdiom == .phone ? .actionSheet : .alert)
        let alertActionYes = UIAlertAction.init(title: actionTitle1, style: UIAlertAction.Style.destructive, handler: handler1)
        let alertActionNo = UIAlertAction.init(title: actionTitle2, style: UIAlertAction.Style.cancel, handler: handler2)
        alertController.addAction(alertActionYes)
        alertController.addAction(alertActionNo)
        vc.present(alertController, animated: true, completion: nil)
    }

    public static func threeAlert(vc: UIViewController, title:  String, message: String, actionTitle1 : String, handler1: ((UIAlertAction) -> ())? = nil, actionTitle2 : String, handler2: ((UIAlertAction) -> ())? = nil , actionTitle3 : String, handler3: ((UIAlertAction) -> ())? = nil ) {

        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: UIDevice.current.userInterfaceIdiom == .phone ? .alert : .alert)
        let alertAction1 = UIAlertAction.init(title: actionTitle1, style: UIAlertAction.Style.default, handler: handler1)
        let alertAction2 = UIAlertAction.init(title: actionTitle2, style: UIAlertAction.Style.default, handler: handler2)
        let alertAction3 = UIAlertAction.init(title: actionTitle3, style: UIAlertAction.Style.default, handler: handler3)
        let alertAction4 = UIAlertAction.init(title: "Cancel".localized(), style: .cancel, handler: nil)

        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        alertController.addAction(alertAction3)
        alertController.addAction(alertAction4)
        /*If you want work actionsheet on ipad
         then you have to use popoverPresentationController to present the actionsheet,
         otherwise app will crash on iPad */
//        switch UIDevice.current.userInterfaceIdiom {
//        case .pad:
//            alertController.popoverPresentationController?.sourceView = sender
//            alertController.popoverPresentationController?.sourceRect = sender.bounds
//            alertController.popoverPresentationController?.permittedArrowDirections = .up
//        default:
//            break
//        }
        vc.present(alertController, animated: true, completion: nil)
    }
    
    public static func showNoInternetAlertWithRetry(vc:UIViewController, handler: ((UIAlertAction) -> ())? = nil) {
        let alertController = UIAlertController.init(title: "No Internet!", message: "Sorry! No internet \n connection found.", preferredStyle: UIAlertController.Style.alert)
        let alertActionYes = UIAlertAction.init(title: "Dismiss", style: UIAlertAction.Style.destructive, handler: nil)
        let alertActionNo = UIAlertAction.init(title: "Retry", style: UIAlertAction.Style.default, handler: handler)
        alertController.addAction(alertActionYes)
        alertController.addAction(alertActionNo)
        vc.present(alertController, animated: true, completion: nil)
        
    }
    
    public static func showNoInternetAlert1(vc: UIViewController){
        self.showAlert(vc: vc, title: "No Internet!", message: "Sorry! No internet connection found.")
    }
    
}
