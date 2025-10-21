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
        label.textColor = inverted ? .white : .black
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = .zero
    }
}

private struct SubtitleLabelStyle: LabelStyling {
    var inverted: Bool = false
    func applyStyle(for label: UILabel) {
        label.textColor = inverted ? .white : .black
        label.font = .boldSystemFont(ofSize: 9)
        label.numberOfLines = .zero
    }
}

private struct HeaderBoldLabelStyle: LabelStyling {
    func applyStyle(for label: UILabel) {
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 20)
        label.numberOfLines = .zero
    }
}

private struct InvertedBodyStyle: LabelStyling {
    var inverted: Bool = false
    func applyStyle(for label: UILabel) {
        label.textColor = inverted ? .white : .black
        label.font = .boldSystemFont(ofSize: 30)
        label.numberOfLines = .zero
    }
}

private struct CaptionLabelStyle: LabelStyling {
    var inverted: Bool = false

    func applyStyle(for label: UILabel) {
        label.textColor = inverted ? .white : .black
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = .zero
    }
}
