//
//  UIVIEWCONTROLLEREXt.swift
//  Bookestan
//
//  Created by Faiz Ul Hassan on 1/08/21.
//

import Foundation
import UIKit

extension UIViewController {



    func hideKeyBoardOnTap(cancelsTouchesInView:Bool=true){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapPerform))
        tap.cancelsTouchesInView = cancelsTouchesInView
        self.view.addGestureRecognizer(tap)
    }

    @objc func tapPerform(){
        self.view.endEditing(true)
    }


}

func customPrint(_ message: Any,
                 fileName: NSString = #file,
                 functionName: String = #function,
                 lineNumber: Int = #line,
                 columnNumber: Int = #column) {
    //    fileName.components(separatedBy: "/").last
    print(" \n Called by \(fileName.lastPathComponent) - \n \(functionName) \n at line \(lineNumber)[\(columnNumber)]  \n \(message)  \n")
}
