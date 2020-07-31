//
// Created by mac on 2019-04-16.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit
import Core

protocol ValidatorConvertible {
    func validate(_ field: UITextField, result: ValidationResult) -> Bool
}

public typealias ValidationResult =  ( String?) -> Void

public enum ValidatorType {
    case email
    case password
    case username
    case requiredField
    case age
    case range(Int, Int)
    case fixed(Int)
    case matches(FormEntryTextField)
}

enum ValidatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .email: return EmailValidator()
        case .password: return PasswordValidator()
        case .username: return UserNameValidator()
        case .requiredField: return RequiredFieldValidator()
        case .age: return AgeValidator()
        case let .range(from, to): return RangeValidator(from: from, to: to)
        case let .fixed(fixed): return RangeValidator(from: fixed, to: fixed)
        case let .matches(other): return MatchValidator(other: other)
        }
    }
}

class AgeValidator: ValidatorConvertible {
    func validate(_ field: UITextField, result: ValidationResult) -> Bool {
        guard !field.text!.isEmpty else {
            result("Age is required")
            return false
        }
        guard let age = Int(field.text!) else {
            result("Age must be a number!")
            return false
        }
        guard field.text!.count < 3 else {
            result("Invalid age number!")
            return false
        }
        guard age >= 18 else {
            result("You have to be over 18 years old to user our app :)")
            return false
        }
        result(nil)
        return true
    }
    
}

class RangeValidator: ValidatorConvertible {
    private let from: Int!
    private let to: Int!
    private var type: RangeType = .range

    private enum RangeType {
        case range
        case fixed
    }

    init(from: Int, to: Int) {
        self.from = from
        self.to = to
        if from == to { type = .fixed }
    }

    func validate(_ field: UITextField, result: ValidationResult) -> Bool {
        guard !field.text!.isEmpty else {
            result(L10n.required)
            return false
        }

        guard let _ = Int(field.text!) else {
            result(L10n.invalid)
            return false
        }

        switch type {
        case .range:
            guard field.text!.count >= from else {
                result("\(L10n.canNotBeLessThan) \(from!)")
                return false
            }
            guard field.text!.count <= to else {
                result("\(L10n.canNotBeMoreThan) \(to!)")
                return false
            }
        case .fixed:
            guard field.text!.count == from else {
                result("\(L10n.mustBe) \(from!)")
                return false
            }
        }

        result(nil)
        return true
    }

}

class MatchValidator: ValidatorConvertible {
    private let other: FormEntryTextField!

    init(other: FormEntryTextField) {
        self.other = other
    }

    func validate(_ field: UITextField, result: ValidationResult) -> Bool {
        guard !field.text!.isEmpty else {
            result(L10n.required)
            return false
        }

        guard field.text == other.text else {
            result(L10n.notMatching)
            other.error = L10n.notMatching
            return false
        }

        result(nil)
        return true
    }

}

struct RequiredFieldValidator: ValidatorConvertible {

    func validate(_ field: UITextField, result: ValidationResult) -> Bool {
        guard !field.text!.isEmpty else {
            result(L10n.required)
            return false
        }
        result(nil)
        return true
    }
}

struct UserNameValidator: ValidatorConvertible {
    func validate(_ field: UITextField, result: ValidationResult) -> Bool {
        guard field.text!.count >= 3 else {
            result("Username must contain more than three characters" )
            return false
        }
        guard field.text!.count < 18 else {
            result("Username shouldn't contain more than 18 characters" )
            return false
        }

        do {
            if try NSRegularExpression(
                    pattern: "^[a-z]{1,18}$",
                    options: .caseInsensitive).firstMatch(in: field.text!,
                    options: [],
                    range: NSRange(location: 0, length: field.text!.count)
            ) == nil {
                result("Invalid username, username should not contain whitespaces, numbers or special characters")
                return false
            }
            result(nil)
            return true
        } catch {
            result("Invalid username, username should not contain whitespaces,  or special characters")
            return false
        }
    }
}

struct PasswordValidator: ValidatorConvertible {
    func validate(_ field: UITextField, result: ValidationResult) -> Bool {
        guard !field.text!.isEmpty else {
            result(L10n.required)
            return false
        }
//        guard field.text!.count >= 6 else {
//            result("Password must have at least 6 characters")
//            return false
//        }

        result(nil)
        return true
    }
}

struct EmailValidator: ValidatorConvertible {
    func validate(_ field: UITextField, result: ValidationResult) -> Bool {
        do {

            guard !field.text!.isEmpty else {
                result(L10n.required)
                return false
            }

            if try NSRegularExpression(
                    pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$",
                    options: .caseInsensitive).firstMatch(in: field.text!, options: [],
                    range: NSRange(location: 0, length: field.text!.count)
            ) == nil {
                result(L10n.invalidEMailAddress)
                return false
            }
            result(nil)
            return true
        } catch {
            result(L10n.invalidEMailAddress)
            return false
        }
    }
}