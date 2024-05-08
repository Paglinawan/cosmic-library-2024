# FilmTag
filmTags = [
  "アクション",
  "カーアクション",
  "カンフー",
  "ギャング",
  "クライム",
  "アドベンチャー",
  "ポリスアクション",
  "ミリタリーアクション",
  "スパイアクション",
  "ヤクザ",
  "SF",
  "スペース・オペラ",
  "怪獣",
  "コメディ",
  "スラップスティック・コメディ",
  "ロマンティック・コメディ",
  "スクリューボール・コメディ",
  "サスペンス",
  "サイコサスペンス",
  "時代劇",
  "キッズ",
  "スリラー",
  "ミステリー",
  "ホラー",
  "スプラッター",
  "サイコ・ホラー",
  "オカルト",
  "モンスター",
  "ヴィジランテ",
  "探偵",
  "スペクタクル",
  "歴史",
  "戦争",
  "スポーツ",
  "青春",
  "ノスタルジー",
  "西部劇",
  "パニック",
  "災害",
  "ファミリー",
  "ファンタジー",
  "動物",
  "文芸",
  "プロパガンダ",
  "風刺",
  "社会派",
  "ミュージカル",
  "ロマンス",
  "ロードムービー",
  "バディムービー"
]
filmTags.each do |tag|
  FilmTag.create!(label: tag)
end

# Film
Film.create(title: "ボーイズ'ン・ザ・フッド", title_en: "Boyz n the Hood", review_star: 3, comment: "1991/アメリカ", film_tag_ids: [4, 46])
Film.create(title: "エドウィン・ドルードの謎", title_en: "THE MYSTERY OF EDWIN DROOD", review_star: 3, comment: "2012/イギリス", film_tag_ids: [43])
Film.create(title: "アストリッドとラファエル 文書係の事件録", title_en: "Astrid et Raphaëlle", review_star: 3, comment: "2019/フランス", film_tag_ids: [30])
Film.create(title: "ラブ&デス", title_en: "Love & Death", review_star: 3, comment: "2023/アメリカ", film_tag_ids: [46])
Film.create(title: "クリミナル・マインド 国際捜査班", title_en: "Criminal Minds: Beyond Borders", review_star: 3, comment: "2016/アメリカ", film_tag_ids: [7])
Film.create(title: "アガサ・クリスティー ミス・マープル", title_en: "Agatha Christie's MARPLE", review_star: 5, comment: "2004/イギリス", film_tag_ids: [23])
Film.create(title: "フレイザー家の秘密", title_en: "The Undoing", review_star: 3, comment: "2020/アメリカ", film_tag_ids: [18])
Film.create(title: "メア・オブ・イーストタウン ある殺人事件の真実", title_en: "Mare of Easttown", review_star: 3, comment: "2021/アメリカ", film_tag_ids: [18])
Film.create(title: "パーソン・オブ・インタレスト", title_en: "Person of Interest", review_star: 4, comment: "2011/アメリカ", film_tag_ids: [11])
Film.create(title: "フリンジ", title_en: "FRINGE", review_star: 4, comment: "2008/アメリカ", film_tag_ids: [11, 18])
Film.create(title: "オーファン・ブラック", title_en: "Orphan Black: Echoes", review_star: 3, comment: "2013/アメリカ", film_tag_ids: [11, 18])
Film.create(title: "ビッグバン ★ セオリー ギークなボクらの恋愛法則", title_en: "The Big Bang Theory", review_star: 3, comment: "2007/アメリカ", film_tag_ids: [16])
Film.create(title: "フレンズ", title_en: "Friends", review_star: 4, comment: "1994/アメリカ", film_tag_ids: [16])
Film.create(title: "バリー", title_en: "Barry", review_star: 3, comment: "2018/アメリカ", film_tag_ids: [15])
Film.create(title: "チャック", title_en: "Chuck", review_star: 4, comment: "2007/アメリカ", film_tag_ids: [14])
Film.create(title: "間違えられた男たち", title_en: "The Wrong Mans", review_star: 4, comment: "2013/アメリカ", film_tag_ids: [14])
Film.create(title: "シェイクスピア＆ハサウェイの事件簿", title_en: "Shakespeare & Hathaway: Private Investigators", review_star: 3, comment: "2018/イギリス", film_tag_ids: [14, 30])

Film.create(title: "キング・オブ・コメディ", title_en: "The King of Comedy", review_star: 3, comment: "変わり者に対するみんなの対応が大人。最後の主人公の目的が果たされるシーンではジワジワ感動しました。", film_tag_ids: [45])
Film.create(title: "俺たちは天使じゃない", title_en: "We're No Angels", review_star: 3, comment: "", film_tag_ids: [40])
Film.create(title: "ナイブズ・アウト グラス", title_en: "Glass Onion: A Knives Out Mystery", review_star: 2, comment: "", film_tag_ids: [23])
Film.create(title: "きっと、うまくいく", title_en: "3 Idiots", review_star: 4, comment: "インド映画の中でも特におすすめの作品です。", film_tag_ids: [17, 46])
Film.create(title: "おとなのけんか", title_en: "Carnage", review_star: 4, comment: "ストーリー展開が絶妙で、誰かと見たいブラックコメディです。", film_tag_ids: [45])
Film.create(title: "ナショナル・セキュリティ", title_en: "National Security", review_star: 3, comment: "", film_tag_ids: [1, 50])
Film.create(title: "リッチー・リッチ", title_en: "Richie Rich/Ri¢hie Ri¢h", review_star: 3, comment: "マコーレーらしいコメディの要素が満載で楽しめる作品でした。", film_tag_ids: [14, 40])
Film.create(title: "ナイト&デイ", title_en: "Knight and Day", review_star: 3, comment: "美男美女の絵になるカップルが繰り広げるアクションシーンが楽しい作品でした。", film_tag_ids: [16, 50])
Film.create(title: "アナライズ・ミー", title_en: "ANALYZE THIS", review_star: 4, comment: "マフィアのボスの人情味と一見おとなしそうに見えるけど行動力のある精神分析医の凸凹感がたまらない。", film_tag_ids: [14, 50])

Film.create(title: "イップ・マン", title_en: "Ip Man", review_star: 4, comment: "本格的なアクションがどのシーンも見応えがあって良かったです。最後のシリーズでは家族を第一にする主人公の姿が素敵だなと思いました。", film_tag_ids: [3])
Film.create(title: "ベスト・キッド", title_en: "The Moment of Truth / The Karate Kid", review_star: 4, comment: "ジャスティン・ビーバーともコラボしているPV「never say never」も良かったです。", film_tag_ids: [3])

Film.create(title: "バック・トゥ・ザ・フューチャー", title_en: "Back to the Future", review_star: 5, comment: "夢があふれる素敵な作品です。この時代だからこそ実現できた丁寧なタッチが心掴まされて不朽の名作だと実感できます。", film_tag_ids: [40, 41])

Film.create(title: "インターステラー", title_en: "Interstellar", review_star: 4, comment: "神秘的な世界観に魅了されました。", film_tag_ids: [12])
Film.create(title: "プリデスティネーション", title_en: "Predestination", review_star: 4, comment: "予想外の結末。テンポの良い展開で引き込まれる作品でした。", film_tag_ids: [11])
Film.create(title: "透明人間", title_en: "Memoirs of an Invisible Man", review_star: 3, comment: "", film_tag_ids: [11, 24])

Film.create(title: "キューブ", title_en: "Cube", review_star: 3, comment: "えぐかったです・・・キャラクターが活きてて良かったと思います。", film_tag_ids: [24, 25])
Film.create(title: "エクソシスト", title_en: "The Exorcist: Believer", review_star: 2, comment: "", film_tag_ids: [24])
Film.create(title: "ジョーズ", title_en: "Jaws", review_star: 4, comment: "恐怖の中、みんなで船で和やかになっているシーンが絶妙に構成の巧みさを感じました", film_tag_ids: [24])

Film.create(title: "エール！", title_en: "La famille Belier", review_star: 3, comment: "", film_tag_ids: [40, 47])
Film.create(title: "ショーシャンクの空に", title_en: "The Shawshank Redemption", review_star: 3, comment: "", film_tag_ids: [46])
Film.create(title: "その手に触れるまで", title_en: "Le jeune Ahmed", review_star: 3, comment: "", film_tag_ids: [46])
Film.create(title: "フルートベール駅で", title_en: "Fruitvale Station", review_star: 3, comment: "", film_tag_ids: [46])
Film.create(title: "ミリオンダラー・ベイビー", title_en: "Million Dollar Baby", review_star: 3, comment: "", film_tag_ids: [46])
Film.create(title: "ライフ・イズ・ビューティフル", title_en: "Life Is Beautiful", review_star: 3, comment: "", film_tag_ids: [46])
Film.create(title: "ウォールフラワー", title_en: "The Perks of Being a Wallflower", review_star: 3, comment: "", film_tag_ids: [46])
Film.create(title: "刑事ジョン・ブック 目撃者", title_en: "Witness", review_star: 3, comment: "", film_tag_ids: [46])
Film.create(title: "荒涼館", title_en: "Bleak House", review_star: 3, comment: "", film_tag_ids: [43])

Film.create(title: "三十九夜", title_en: "The 39 Steps", review_star: 3, comment: "", film_tag_ids: [18])
Film.create(title: "そして誰もいなくなった", title_en: "And Then There Were None", review_star: 4, comment: "", film_tag_ids: [18, 43])
Film.create(title: "エスター", title_en: "Orphan", review_star: 4, comment: "", film_tag_ids: [18])
Film.create(title: "ミザリー", title_en: "Misery", review_star: 4, comment: "", film_tag_ids: [18])
Film.create(title: "ロープ", title_en: "Rope", review_star: 3, comment: "", film_tag_ids: [18])
Film.create(title: "ミスト", title_en: "The Mist", review_star: 3, comment: "", film_tag_ids: [18])
Film.create(title: "ギルティ", title_en: "The Guilty", review_star: 3, comment: "", film_tag_ids: [18])
Film.create(title: "マローボーン家の掟", title_en: "Marrowbone", review_star: 3, comment: "", film_tag_ids: [18])
Film.create(title: "トゥルー・ストーリー", title_en: "True Story", review_star: 3, comment: "", film_tag_ids: [18])
Film.create(title: "インビジブル", title_en: "Hollow Man", review_star: 3, comment: "", film_tag_ids: [18])
Film.create(title: "バッド・エデュケーション", title_en: "Bad Education", review_star: 3, comment: "", film_tag_ids: [18])
Film.create(title: "あなたが聞こえない", title_en: "CODA", review_star: 3, comment: "", film_tag_ids: [18])
Film.create(title: "バルカン超特急", title_en: "The Lady Vanishes", review_star: 3, comment: "", film_tag_ids: [18])
Film.create(title: "深夜の告白", title_en: "Double indemnity", review_star: 3, comment: "", film_tag_ids: [18])
Film.create(title: "キャプテン・フィリップス", title_en: "Captain Phillips", review_star: 3, comment: "", film_tag_ids: [18])
Film.create(title: "ユージュアル・サスペクツ", title_en: "The Usual Suspects", review_star: 3, comment: "", film_tag_ids: [23])
Film.create(title: "メンタリスト", title_en: "THE MENTALIST", review_star: 3, comment: "", film_tag_ids: [23])
Film.create(title: "夜の来訪者", title_en: "An Inspector Calls", review_star: 3, comment: "", film_tag_ids: [43])

Film.create(title: "ローマの休日", title_en: "Roman Holiday", review_star: 4, comment: "オードリーの無邪気かつ上品な魅力が味わえた作品でした。", film_tag_ids: [48])
Film.create(title: "ブルックリンの恋人たち", title_en: "Song One", review_star: 3, comment: "穏やかな、一つ一つの優しいタッチにいろいろ考えさせられた作品でした。", film_tag_ids: [48])
Film.create(title: "恋人たちの予感", title_en: "When Harry Met Sally...", review_star: 4, comment: "お互いが惹かれあっていることに気がつかないもどかしさが、最後の感動を強くするような、好きな作品です。", film_tag_ids: [48])
Film.create(title: "イルマーレ", title_en: "The Lake House", review_star: 4, comment: "時を超えるという幻想的な舞台で描かれた愛がとても素敵だなと思いました。", film_tag_ids: [48])
Film.create(title: "ジェーン・エア", title_en: "Jane Eyre", review_star: 5, comment: "純潔さを尊重しながらも二人の情熱さも伝わり、最後には盲目な彼と結ばれた結末に真の愛を感じることができました。", film_tag_ids: [48])
Film.create(title: "高慢と偏見", title_en: "Pride and Prejudice", review_star: 5, comment: "親や姉妹の悩みを抱えつつ、豊かな恋愛模様もあり、傲慢と偏見から始まった関係が恋に成就する過程は、王道だけどやっぱり素敵だなと思いました。", film_tag_ids: [48])
Film.create(title: "心の旅路", title_en: "Random Harvest", review_star: 5, comment: "行く不明になった彼を見つけても過去のことを明らかにせずに、記憶喪失になった彼が自ら自分のことを思い出すことを望むヒロインの描き方がとても良かったです。", film_tag_ids: [48])
Film.create(title: "或る夜の出来事", title_en: "It Happened One Night", review_star: 5, comment: "無邪気なヒロインだけど、どこか奥ゆかしさもあってとても魅力的でした。", film_tag_ids: [48])

# BookTag
bookTags = [
  "哲学",
  "心理学",
  "宗教",
  "神学",
  "社会科学",
  "自然科学",
  "数学",
  "応用科学",
  "工学",
  "言語",
  "言語学",
  "文学",
  "芸術",
  "娯楽",
  "歴史",
  "地理",
  "その他"
]
bookTags.each do |tag|
  BookTag.create!(label: tag)
end

# Book
Book.create(title: "ガリヴァー旅行記", author: "ジョナサン・スウィフト", review_star: 3, comment: "", book_tag_ids: [12])
Book.create(title: "寛容論", author: "ヴォルテール", review_star: 3, comment: "", book_tag_ids: [1])
Book.create(title: "ツァラトゥストラ", author: "ニーチェ", review_star: 3, comment: "", book_tag_ids: [1])
Book.create(title: "ロボット", author: "カレル・チャペック", review_star: 4, comment: "", book_tag_ids: [12])
Book.create(title: "リア王", author: "ウイリアム・シェイクスピア", review_star: 4, comment: "", book_tag_ids: [12])
Book.create(title: "メノン", author: "プラトン", review_star: 4, comment: "", book_tag_ids: [1])
Book.create(title: "リヴァイアサン", author: "トマス・ホッブズ", review_star: 3, comment: "", book_tag_ids: [5])
Book.create(title: "マクベス", author: "ウイリアム・シェイクスピア", review_star: 4, comment: "", book_tag_ids: [12])
Book.create(title: "ゴルギアス", author: "プラトン", review_star: 4, comment: "", book_tag_ids: [1])
Book.create(title: "パンセ", author: "ブレーズ・パスカル", review_star: 4, comment: "", book_tag_ids: [17])
Book.create(title: "異邦人", author: "アルベール・カミュ", review_star: 3, comment: "", book_tag_ids: [12])
Book.create(title: "ジュリアス・シーザー", author: "ウイリアム・シェイクスピア", review_star: 3, comment: "", book_tag_ids: [12])
Book.create(title: "死ぬ瞬間", author: "エリザベス・キューブラー＝ロス", review_star: 4, comment: "", book_tag_ids: [17])
Book.create(title: "大人のいない国", author: "内田 樹, 鷲田 清一", review_star: 3, comment: "", book_tag_ids: [5])
Book.create(title: "大衆の反逆", author: "ホセ・オルテガ・イ・ガセット", review_star: 4, comment: "", book_tag_ids: [1])
Book.create(title: "プロタゴラス", author: "プラトン", review_star: 3, comment: "", book_tag_ids: [1])
Book.create(title: "ザ・ホスト", author: "ステファニー・メイヤー", review_star: 4, comment: "", book_tag_ids: [12])
Book.create(title: "告白", author: "アウグスティヌス", review_star: 4, comment: "", book_tag_ids: [1, 2])
Book.create(title: "友情について", author: "M.T. キケロー", review_star: 3, comment: "", book_tag_ids: [12])
Book.create(title: "マイノリティデザインー弱さを生かせる社会をつくろう", author: "澤田智洋", review_star: 3, comment: "", book_tag_ids: [5])
Book.create(title: "牧師館の殺人", author: "アガサ・クリスティ", review_star: 4, comment: "", book_tag_ids: [12])
Book.create(title: "動く指", author: "アガサ・クリスティ", review_star: 4, comment: "", book_tag_ids: [12])
Book.create(title: "予告殺人", author: "アガサ・クリスティ", review_star: 4, comment: "", book_tag_ids: [12])
Book.create(title: "象は忘れない", author: "アガサ・クリスティ", review_star: 4, comment: "", book_tag_ids: [12])
