import UIKit

extension UILabel {
    func applyTitleBoldStyle() {
        applyStyle(TitleBoldStyle())
    }
    func applyInvertedTitleBoldStyle() {
        applyStyle(TitleBoldStyle(inverted: true))
    }
    func applyHeaderBoldStyle() {
        applyStyle(HeaderBoldLabelStyle())
    }
    func applyBodyStyle() {
        applyStyle(InvertedBodyStyle())
    }
    func applyInvertedBodyStyle() {
        applyStyle(InvertedBodyStyle(inverted: true))
    }
    func applySubtitleLabelStyle() {
        applyStyle(SubtitleLabelStyle())
    }
    func applyInvertedSubtitleLabelStyle() {
        applyStyle(SubtitleLabelStyle(inverted: true))
    }
    func applyCaptionStyle() {
        applyStyle(CaptionLabelStyle())
    }
    func applyInvertedCaptionStyle() {
        applyStyle(CaptionLabelStyle(inverted: true))
    }
}

protocol LabelStyling {
    func applyStyle(for label: UILabel)
}

extension UILabel {
    func applyStyle(_ style: LabelStyling) {
        style.applyStyle(for: self)
    }
}

private struct TitleBoldStyle: LabelStyling {
    var inverted: Bool = false
    func applyStyle(for label: UILabel) {
        label.textColor = inverted ? .white : .black100
        label.font = .titleBoldStyle
        label.numberOfLines = .zero
    }
}

private struct SubtitleLabelStyle: LabelStyling {
    var inverted: Bool = false
    func applyStyle(for label: UILabel) {
        label.textColor = inverted ? .white : .black20
        label.font = .systemFontSize
        label.numberOfLines = .zero
    }
}

private struct HeaderBoldLabelStyle: LabelStyling {
    func applyStyle(for label: UILabel) {
        label.textColor = .black100
        label.font = .HeaderBoldLabelStyle
        label.numberOfLines = .zero
    }
}

private struct InvertedBodyStyle: LabelStyling {
    var inverted: Bool = false
    func applyStyle(for label: UILabel) {
        label.textColor = inverted ? .white : .black80
        label.font = .defaultFontSize
        label.numberOfLines = .zero
    }
}

private struct CaptionLabelStyle: LabelStyling {
    var inverted: Bool = false

    func applyStyle(for label: UILabel) {
        label.textColor = inverted ? .white : .black20
        label.font = .smallSystemFontSize
        label.numberOfLines = .zero
    }
}
