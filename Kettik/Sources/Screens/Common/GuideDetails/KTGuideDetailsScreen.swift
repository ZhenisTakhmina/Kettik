//
//  KTGuideDetailsScreen.swift
//  Kettik
//
//  Created by Tami on 02.05.2024.
//

import UIKit
import SwiftUI
import RxCocoa
import RxSwift

// TODO: Рефакторинг. Перенести бизнес-логику во вьюмодель
final class KTGuideDetailsScreen: KTScrollableViewController {
    
    private let guide: KTGuideAdapter
    
    private let photoView: UIImageView = .init().then {
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.backgroundColor = KTColors.Surface.secondary.color
    }
    
    private let nameLabel: UILabel = .init().then {
        $0.font = KTFonts.SFProText.bold.font(size: 20)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = KTColors.Text.primary.color
    }
    
    private let roleLabel: UILabel = .init().then {
        $0.font = KTFonts.SFProText.regular.font(size: 14)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = KTColors.Text.secondary.color
    }
    
    private let descriptionLabel: UILabel = .init().then {
        $0.font = KTFonts.SFProText.regular.font(size: 16)
        $0.numberOfLines = 0
        $0.textColor = KTColors.Text.primary.color
    }
    
    init(guide: KTGuideAdapter) {
        self.guide = guide
        super.init()
        
        // TODO: move to viewmodel
        photoView.setImage(with: guide.photoURL)
        nameLabel.text = guide.name
        roleLabel.text = guide.role
        descriptionLabel.text = guide.description
    }
    
    override func setupViews() {
        super.setupViews()
        navigationItem.title = KTStrings.Tab.guides
        
        let stackView: UIStackView = .init(arrangedSubviews: [
            photoView,
            nameLabel,
            roleLabel,
            descriptionLabel
        ]).then {
            $0.axis = .vertical
            $0.alignment = .center
            $0.setCustomSpacing(24, after: photoView)
            $0.setCustomSpacing(4, after: nameLabel)
            $0.setCustomSpacing(32, after: roleLabel)
        }
        
        contentView.add(stackView, {
            $0.edges.equalTo(UIEdgeInsets(horizontal: 18, vertical: 24))
        })
        
        photoView.snp.makeConstraints {
            $0.size.equalTo(220)
        }
    }
}

struct KTGuideDetailsScreenPreview: PreviewProvider {
    
    static var previews: some View {
        KTPreview {
            KTGuideDetailsScreen(guide: .init(id: "1", name: "Admin", role: "Kettik CEO", photoURL: nil, description: "Организатор и основатель клуба активного туризма Kettik, инструктор по горному туризму и КМС. В спортивном туризме с 2014 года, в какой то момент любимое хобби перерасло в дело всей жизни. Мы открыли Kettik в 2020 году перед пандемией, и казалось нет хуже времени. Но, выяснилось что жителям Алматы также очень важно вести активный образ жизни, изучать природу родного края. "))
        }.edgesIgnoringSafeArea(.all)
    }
}
