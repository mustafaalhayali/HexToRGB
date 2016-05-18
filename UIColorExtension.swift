//
//  UIColorExtension.swift
//  HexToRGB
//
//  Created by Mustafa Al-Hayali on 2016-05-18.
//  Copyright © 2016 Mustafa Al-Hayali. All rights reserved.
//
import UIKit


extension UIColor{
    class func rgb(red : Int, _ green : Int, _ blue : Int, _ alpha : Float = 1.0) -> UIColor {
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha))
    }
    
    class func HexToRGB(Hex : String) -> UIColor{
        let charactersArray = Array(Hex.characters)
        var stringArray = charactersArray.map {String($0)}
        if stringArray.contains("#"){
            if let hash = stringArray.indexOf("#"){
                stringArray.removeAtIndex(hash)
            }
        }
        
        for string in stringArray{
            let index = stringArray.indexOf(string)
            switch string {
            case "A", "a":
                stringArray[index!] = "10"
            case "B", "b":
                stringArray[index!] = "11"
            case "C", "c":
                stringArray[index!] = "12"
            case "D", "d":
                stringArray[index!] = "13"
            case "E", "e":
                stringArray[index!] = "14"
            case "F", "f":
                stringArray[index!] = "15"
            default:
                break
            }
        }
        
        var numbersArray = stringArray.map{Int($0)!}
        switch numbersArray.count {
        case 3:
            let red = (numbersArray[0] * 16) + numbersArray[0]
            let green = (numbersArray[1] * 16) + numbersArray[1]
            let blue = (numbersArray[2] * 16) + numbersArray[2]
            return UIColor.rgb(red, green, blue)
        case 6:
            let red = (numbersArray[0] * 16) + numbersArray[1]
            let green = (numbersArray[2] * 16) + numbersArray[3]
            let blue = (numbersArray[4] * 16) + numbersArray[5]
            return UIColor.rgb(red, green, blue)
        default:
            return UIColor.clearColor()
        }
    }
}


