//
//  Theme+SecurityNumberSection.swift
//  
//
//  Created by Alex Ioja-Yang on 09/08/2022.
//

import UIKit

public extension Theme {
    
    /// Theme generated security number input section
    struct ThemeSecurityNumberSection: CellTextFieldStyle {
        public var isMandatory: Bool = true
        public var backgroundColor: UIColor = .clear
        public var textfield: ElementTextFieldStyle
        public var title: ElementStyle?
        public var mandatory: ElementStyle?
        public var hint: ElementStyle?
        public var error: ElementErrorViewStyle?
    }
    
    /// Create a Security Number Input Section from Styles defined for each sub component
    func buildSecurityNumberSection(textField: ThemeTextField,
                                    title: ThemeTitle,
                                    mandatory: ThemeMandatory,
                                    subtitle: ThemeSubtitle,
                                    error: ThemeError) -> ThemeSecurityNumberSection {
        ThemeSecurityNumberSection(textfield: textField,
                                   title: title,
                                   mandatory: mandatory,
                                   hint: subtitle,
                                   error: error)
    }
    
    /// Create a Security Number Input Section from basic input data for presentation
    func buildSecurityNumberSection(textFieldText: String,
                                    textFieldPlaceholder: String,
                                    titleText: String,
                                    subtitleText: String? = nil,
                                    subtitleImage: UIImage? = nil,
                                    isRequiredInputText: String? = nil,
                                    errorText: String? = nil,
                                    errorImage: UIImage? = nil) -> ThemeSecurityNumberSection {
        let subtitleText = subtitleText ?? ""
        let addSubtitle = !subtitleText.isEmpty || subtitleImage != nil
        
        let errorText = errorText ?? ""
        let addError = !errorText.isEmpty || errorImage != nil
        
        let mandatoryText = isRequiredInputText ?? ""
        let addMandatory = !mandatoryText.isEmpty
        
        return ThemeSecurityNumberSection(
            textfield: self.buildTextField(text: textFieldText,
                                           placeholderText: textFieldPlaceholder,
                                           isNumbericInput: true),
            title: self.buildTitle(text: titleText),
            mandatory: addMandatory ? self.buildIsRequiredInput(text: mandatoryText) : nil,
            hint: addSubtitle ? self.buildSubtitle(text: subtitleText,
                                                   image: subtitleImage) : nil,
            error: addError ? self.buildError(text: errorText,
                                              image: errorImage) : nil
        )
    }
    
}
