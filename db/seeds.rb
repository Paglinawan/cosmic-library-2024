# FilmTag
filmTags = [
  "アクション",
  "アドベンチャー",
  "コメディ",
  "ドラマ",
  "ロマンス",
  "ホラー",
  "サスペンス",
  "ミステリー",
  "クライム",
  "スリラー",
  "ファンタジー",
  "SF",
  "ファミリー",
  "アニメーション",
  "ミュージカル",
  "戦争",
  "歴史",
  "スポーツ",
  "ノンフィクション",
  "ドキュメンタリー",
  "ウエスタン",
  "ノワール",
  "バイオグラフィー",
  "シリーズ"
]
filmTags.each do |tag|
  Tag.create!(label: tag)
end

# Film

Film.create(title: "ボーイズ'ン・ザ・フッド", title_en: "Boyz n the Hood", review_star: 3, comment: "1991/アメリカ", tag_ids: [9,10])
Film.create(title: "エドウィン・ドルードの謎", title_en: "THE MYSTERY OF EDWIN DROOD", review_star: 3, comment: "2012/イギリス", tag_ids: [8, 24])
Film.create(title: "アストリッドとラファエル 文書係の事件録", title_en: "Astrid et Raphaëlle", review_star: 3, comment: "2019/フランス", tag_ids: [8, 10, 24])
Film.create(title: "ラブ&デス", title_en: "Love & Death", review_star: 3, comment: "2023/アメリカ", tag_ids: [4, 9, 24])
Film.create(title: "クリミナル・マインド 国際捜査班", title_en: "Criminal Minds: Beyond Borders", review_star: 3, comment: "2016/アメリカ", tag_ids: [8, 24])
Film.create(title: "アガサ・クリスティー ミス・マープル", title_en: "Agatha Christie's MARPLE", review_star: 5, comment: "2004/イギリス", tag_ids: [8, 24])
Film.create(title: "フレイザー家の秘密", title_en: "The Undoing", review_star: 3, comment: "2020/アメリカ", tag_ids: [10, 24])
Film.create(title: "メア・オブ・イーストタウン ある殺人事件の真実", title_en: "Mare of Easttown", review_star: 3, comment: "2021/アメリカ", tag_ids: [10, 24])
Film.create(title: "パーソン・オブ・インタレスト", title_en: "Person of Interest", review_star: 4, comment: "2011/アメリカ", tag_ids: [12, 24])
Film.create(title: "フリンジ", title_en: "FRINGE", review_star: 4, comment: "2008/アメリカ", tag_ids: [12, 24])
Film.create(title: "オーファン・ブラック", title_en: "Orphan Black: Echoes", review_star: 3, comment: "2013/アメリカ", tag_ids: [12, 24])
Film.create(title: "ビッグバン ★ セオリー ギークなボクらの恋愛法則", title_en: "The Big Bang Theory", review_star: 3, comment: "2007/アメリカ", tag_ids: [3, 5, 24])
Film.create(title: "フレンズ", title_en: "Friends", review_star: 4, comment: "1994/アメリカ", tag_ids: [3, 5, 24])
Film.create(title: "バリー", title_en: "Barry", review_star: 3, comment: "2018/アメリカ", tag_ids: [3, 24])
Film.create(title: "チャック", title_en: "Chuck", review_star: 4, comment: "2007/アメリカ", tag_ids: [1, 5, 24])
Film.create(title: "間違えられた男たち", title_en: "The Wrong Mans", review_star: 4, comment: "2013/アメリカ", tag_ids: [3, 24])
Film.create(title: "シェイクスピア＆ハサウェイの事件簿", title_en: "Shakespeare & Hathaway: Private Investigators", review_star: 3, comment: "2018/イギリス", tag_ids: [8, 24])

Film.create(title: "キング・オブ・コメディ", title_en: "The King of Comedy", review_star: 3, comment: "変わり者に対するみんなの対応が大人。最後の主人公の目的が果たされるシーンではジワジワ感動しました。", tag_ids: [3])
Film.create(title: "俺たちは天使じゃない", title_en: "We're No Angels", review_star: 3, comment: "", tag_ids: [3])
Film.create(title: "ナイブズ・アウト グラス", title_en: "Glass Onion: A Knives Out Mystery", review_star: 2, comment: "", tag_ids: [3])
Film.create(title: "きっと、うまくいく", title_en: "3 Idiots", review_star: 4, comment: "インド映画の中でも特におすすめの作品です。", tag_ids: [3])
Film.create(title: "おとなのけんか", title_en: "Carnage", review_star: 4, comment: "ストーリー展開が絶妙で、誰かと見たいブラックコメディです。", tag_ids: [3])
Film.create(title: "ナショナル・セキュリティ", title_en: "National Security", review_star: 3, comment: "", tag_ids: [3])
Film.create(title: "リッチー・リッチ", title_en: "Richie Rich/Ri¢hie Ri¢h", review_star: 3, comment: "マコーレーらしいコメディの要素が満載で楽しめる作品でした。", tag_ids: [3])
Film.create(title: "ナイト&デイ", title_en: "Knight and Day", review_star: 3, comment: "美男美女の絵になるカップルが繰り広げるアクションシーンが楽しい作品でした。", tag_ids: [3, 5])
Film.create(title: "アナライズ・ミー", title_en: "ANALYZE THIS", review_star: 4, comment: "マフィアのボスの人情味と一見おとなしそうに見えるけど行動力のある精神分析医の凸凹感がたまらない。", tag_ids: [3])

Film.create(title: "イップ・マン", title_en: "Ip Man", review_star: 4, comment: "本格的なアクションがどのシーンも見応えがあって良かったです。最後のシリーズでは家族を第一にする主人公の姿が素敵だなと思いました。", tag_ids: [1])
Film.create(title: "ベスト・キッド", title_en: "The Moment of Truth / The Karate Kid", review_star: 4, comment: "ジャスティン・ビーバーともコラボしているPV「never say never」も良かったです。", tag_ids: [1])

Film.create(title: "バック・トゥ・ザ・フューチャー", title_en: "Back to the Future", review_star: 5, comment: "夢があふれる素敵な作品です。この時代だからこそ実現できた丁寧なタッチが心掴まされて不朽の名作だと実感できます。", tag_ids: [2, 11])

Film.create(title: "インターステラー", title_en: "Interstellar", review_star: 4, comment: "神秘的な世界観に魅了されました。", tag_ids: [12])
Film.create(title: "プリデスティネーション", title_en: "Predestination", review_star: 4, comment: "予想外の結末。テンポの良い展開で引き込まれる作品でした。", tag_ids: [12])
Film.create(title: "透明人間", title_en: "Memoirs of an Invisible Man", review_star: 3, comment: "", tag_ids: [12])

Film.create(title: "キューブ", title_en: "Cube", review_star: 3, comment: "えぐかったです・・・キャラクターが活きてて良かったと思います。", tag_ids: [6])
Film.create(title: "エクソシスト", title_en: "The Exorcist: Believer", review_star: 2, comment: "", tag_ids: [6])
Film.create(title: "ジョーズ", title_en: "Jaws", review_star: 4, comment: "恐怖の中、みんなで船で和やかになっているシーンが絶妙に構成の巧みさを感じました", tag_ids: [6])

Film.create(title: "ローマの休日", title_en: "Roman Holiday", review_star: 4, comment: "オードリーの無邪気かつ上品な魅力が味わえた作品でした。", tag_ids: [5])
Film.create(title: "ブルックリンの恋人たち", title_en: "Song One", review_star: 3, comment: "穏やかな、一つ一つの優しいタッチにいろいろ考えさせられた作品でした。", tag_ids: [5])
Film.create(title: "恋人たちの予感", title_en: "When Harry Met Sally...", review_star: 4, comment: "お互いが惹かれあっていることに気がつかないもどかしさが、最後の感動を強くするような、好きな作品です。", tag_ids: [5])
Film.create(title: "イルマーレ", title_en: "The Lake House", review_star: 4, comment: "時を超えるという幻想的な舞台で描かれた愛がとても素敵だなと思いました。", tag_ids: [5])
Film.create(title: "ジェーン・エア", title_en: "Jane Eyre", review_star: 5, comment: "純潔さを尊重しながらも二人の情熱さも伝わり、最後には盲目な彼と結ばれた結末に真の愛を感じることができました。", tag_ids: [5])
Film.create(title: "高慢と偏見", title_en: "Pride and Prejudice", review_star: 5, comment: "親や姉妹の悩みを抱えつつ、豊かな恋愛模様もあり、傲慢と偏見から始まった関係が恋に成就する過程は、王道だけどやっぱり素敵だなと思いました。", tag_ids: [5])
Film.create(title: "心の旅路", title_en: "Random Harvest", review_star: 5, comment: "行く不明になった彼を見つけても過去のことを明らかにせずに、記憶喪失になった彼が自ら自分のことを思い出すことを望むヒロインの描き方がとても良かったです。", tag_ids: [5])
Film.create(title: "或る夜の出来事", title_en: "It Happened One Night", review_star: 5, comment: "無邪気なヒロインだけど、どこか奥ゆかしさもあってとても魅力的でした。", tag_ids: [5])
