# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Film.create(title: "或る夜の出来事", title_en: "It Happened One Night", review_star: 5, comment: "無邪気なヒロインだけど、どこか奥ゆかしさもあってとても魅力的でした。")
Film.create(title: "心の旅路", title_en: "Random Harvest", review_star: 5, comment: "行く不明になった彼を見つけても過去のことを明らかにせずに、記憶喪失になった彼が自ら自分のことを思い出すことを望むヒロインの描き方がとても良かったです。")
Film.create(title: "高慢と偏見", title_en: "Pride and Prejudice", review_star: 5, comment: "親や姉妹の悩みを抱えつつ、豊かな恋愛模様もあり、傲慢と偏見から始まった関係が恋に成就する過程は、王道だけどやっぱり素敵だなと思いました。")
Film.create(title: "ジェーン・エア", title_en: "Jane Eyre", review_star: 5, comment: "純潔さを尊重しながらも二人の情熱さも伝わり、最後には盲目な彼と結ばれた結末に真の愛を感じることができました。")
Film.create(title: "イルマーレ", title_en: "The Lake House", review_star: 4, comment: "時を超えるという幻想的な舞台で描かれた愛がとても素敵だなと思いました。")
Film.create(title: "恋人たちの予感", title_en: "When Harry Met Sally...", review_star: 4, comment: "お互いが惹かれあっていることに気がつかないもどかしさが、最後の感動を強くするような、好きな作品です。")
Film.create(title: "ブルックリンの恋人たち", title_en: "Song One", review_star: 3, comment: "穏やかな、一つ一つの優しいタッチにいろいろ考えさせられた作品でした。")
Film.create(title: "ローマの休日", title_en: "Roman Holiday", review_star: 4, comment: "オードリーの無邪気かつ上品な魅力が味わえた作品でした。")
Film.create(title: "アナライズ・ミー", title_en: "ANALYZE THIS", review_star: 4, comment: "マフィアのボスの人情味と一見おとなしそうに見えるけど行動力のある精神分析医の凸凹感がたまらない。")
Film.create(title: "ナイト&デイ", title_en: "Knight and Day", review_star: 3, comment: "美男美女の絵になるカップルが繰り広げるアクションシーンが楽しい作品でした。")
Film.create(title: "リッチー・リッチ", title_en: "Richie Rich/Ri¢hie Ri¢h", review_star: 3, comment: "マコーレーらしいコメディの要素が満載で楽しめる作品でした。")
Film.create(title: "ナショナル・セキュリティ", title_en: "National Security", review_star: 3, comment: "")
Film.create(title: "おとなのけんか", title_en: "Carnage", review_star: 4, comment: "ストーリー展開が絶妙で、誰かと見たいブラックコメディです。")
Film.create(title: "きっと、うまくいく", title_en: "3 Idiots", review_star: 4, comment: "インド映画の中でも特におすすめの作品です。")
Film.create(title: "ナイブズ・アウト グラス", title_en: "Glass Onion: A Knives Out Mystery", review_star: 2, comment: "")
Film.create(title: "俺たちは天使じゃない", title_en: "We're No Angels", review_star: 3, comment: "")
Film.create(title: "キング・オブ・コメディ", title_en: "The King of Comedy", review_star: 3, comment: "変わり者に対するみんなの対応が大人。最後の主人公の目的が果たされるシーンではジワジワ感動しました。")