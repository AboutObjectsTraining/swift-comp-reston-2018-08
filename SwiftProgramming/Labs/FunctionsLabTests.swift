// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest

let temperatureValues: [Double] = [-10, 0, 10, 32, 72, 100]

func convertedToCelsius(fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * (5/9)
}

func convertedToFahrenheit(celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

class FunctionsLabTests: XCTestCase
{
    func testConvertFahrenheitToCelsiusUsingForLoop() {
        for value in temperatureValues {
            let celsius = convertedToCelsius(fahrenheit: value)
            let formattedValue = String(format: "%.1f", celsius)
            print("\(value)°F equals \(formattedValue)°C")
        }
    }
    
    func testConvertCelsiusToFahrenheitUsingForLoop() {
        for value in temperatureValues {
            let fahrenheit = convertedToFahrenheit(celsius: value)
            let formattedValue = String(format: "%.1f", fahrenheit)
            print("\(value)°C equals \(formattedValue)°F")
        }
    }
}


// MARK: - Functional tests

let format = "\n%5.1f°F equals %5.1f°C "

extension FunctionsLabTests
{
    func testConvertFahrenheitToCelsiusUsingMap() {
        let celsiusValues = temperatureValues.map { convertedToCelsius(fahrenheit: $0) }
        print(celsiusValues)
        
        let formattedValues = celsiusValues.map { String(format: "%.1f", $0) }
        print(formattedValues)
    }
    
    func testConvertFahrenheitToCelsiusUsingMapReduce1() {
        let formattedValues = temperatureValues.map {
            String(format: format, $0, convertedToCelsius(fahrenheit: $0))
        }
        let text = formattedValues.reduce("") { $0 + $1 }
        print(text)
    }
    
    
    func testConvertFahrenheitToCelsiusUsingMapReduce2() {
        print(temperatureValues
            .map { String(format: format, $0, convertedToCelsius(fahrenheit: $0)) }
            .reduce("",  +))
    }
    
    func testConvertFahrenheitToCelsiusUsingTuples() {
        let tuples = temperatureValues.map { (F: $0, C: convertedToCelsius(fahrenheit: $0)) }
        
        let text = tuples.reduce("") {
            $0 + String(format: format, $1.F, $1.C)
        }
        print(text)
    }
}
