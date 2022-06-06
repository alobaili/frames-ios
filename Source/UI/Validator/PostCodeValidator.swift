import Foundation

class PostcodeValidator: Validator {
    func validate(text: String?) -> Bool {
        isEmpty(text: text)
    }

    private func isEmpty(text: String?) -> Bool {
        text?.isEmpty ?? false
    }

}
