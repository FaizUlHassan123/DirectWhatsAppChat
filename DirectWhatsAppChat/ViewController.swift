//
//  ViewController.swift
//  DirectWhatsAppChat
//
//  Created by Faiz Ul Hassan on 4/19/22.
//

import UIKit
import PhoneNumberKit
import SwifterSwift

class ViewController: UIViewController {

    let phoneNumberKit = PhoneNumberKit()

    @IBOutlet weak var mobileNumber:PhoneNumberTextField!{
        didSet{
            mobileNumber.backgroundColor = .clear
            mobileNumber.withFlag = true
            mobileNumber.withPrefix = true
            mobileNumber.withExamplePlaceholder = true
            mobileNumber.withDefaultPickerUI = true
            mobileNumber.countryCodePlaceholderColor = .darkGray
        }
    }

    @IBOutlet weak var mobileNumber_backView:UIView!{
        didSet{
            mobileNumber_backView.backgroundColor = UIColor(hexString: "FAFAFA")
            mobileNumber_backView.layer.borderColor = UIColor(hexString: "EFEFEF")?.cgColor
            mobileNumber_backView.layer.borderWidth = 1
            mobileNumber_backView.layer.cornerRadius = 8
        }
    }


    @IBOutlet weak var whats_app_btn:UIButton!{
        didSet{
            whats_app_btn.setTitle("Open Direct Chat", for: .normal)
            whats_app_btn.layer.cornerRadius = 12
            whats_app_btn.layer.masksToBounds = true
        }
    }

    @IBAction func whtapp_action(_ sender:UIButton){

        if self.mobileNumber.isEmpty {
            Alert.showAlert(vc: self, title: "Error", message: "Mobile Number is Requiered.")

        } else {

            do {
                let phoneNumber = try phoneNumberKit.parse(self.mobileNumber.text ?? "", ignoreType: true)
                let number = self.phoneNumberKit.format(phoneNumber, toType: .e164)
//                self.mobileNumber.text = number
                self.open_whatsApp(number)

            } catch {
                print("Something went wrong \(error.localizedDescription)")
                Alert.showAlert(vc: self, title: "Error", message: error.localizedDescription)
            }

        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyBoardOnTap()
    }

    func open_whatsApp(_ number:String){
        let whatsappHooks = "whatsapp://send?text=hi&phone=\(number))"
        let whatsAppUrl = URL(string: whatsappHooks)
        if UIApplication.shared.canOpenURL(whatsAppUrl! as URL){
            UIApplication.shared.open(whatsAppUrl!)

        } else {
            //redirect to safari because the user doesn't have Instagram
            print("App not installed")
            Alert.showAlert(vc: self, title: "Error", message: "Whatsapp is not installed on this device.")
        }
    }


}

