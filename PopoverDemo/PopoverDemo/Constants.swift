//
//  Constants.swift
//  PopoverDemo
//

import Foundation

enum PdfShareOption:String{
    
    case Email
    case GoToPage
    case ShowInfo
    case RemoveAnnotations
    case Print
    case Share
    
    
    var titleName:String{
        switch self{
            
        case .Email:
            return "Email"
        case .GoToPage:
            return "Go to Page"
        case .ShowInfo:
            return "Info"
        case .RemoveAnnotations:
            return "Remove Annotations"
        case .Print:
            return "Print"
        case .Share:
            return "Share"
            
        }
    }
}
