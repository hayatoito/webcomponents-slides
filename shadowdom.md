
Shadow DOM と オブジェクト指向について - Web Components 。

Hayato Ito (hayato@google.com)

Web Components について、日本語で書かれた情報は増えてきています。

-
-

しかし、Web Components の中核を裏で支える Shadow DOM について、その役割、その設計思想について述べたものは見かけません。
なぜ、見かけないかというと、それは現在のところ、Shadow DOM の仕様の頭の中にしか存在しないからです。:)

一見すると何のためにあるのかよくわからない Multiple Shadow Rootsや、複雑に見える Distribution のメカニズム、更に <content> エレメントと <shadow> エレメントの違いについて、これらがどのように動作するべきかは、Shadow DOM Spec に詳細に述べられていますが、「なぜ、そうなっているのか？」については述べられていません。

そこで、Shadow DOM をデザインするにあたって、どのような設計思想がそこにあるのか、ここで解説したいと思います。

- このドキュメントは最終形ではありません。何度も改定されていく予定です。
- このドキュメントは現在日本語で書かれていますが、それは筆者が日本人だからです。近い将来に英語で書きなおします。
- Web Components を利用するにあたって、Shadow DOM について理解する必要はありません。Polymer などの優れたライブラリを使用することで、Shadow DOM の存在を意識することなく、Web Components の恩恵を得ることができます。Shadow DOM はあくまで裏方を支える技術に徹するべきだと考えています。
- この投稿は、わかりやすさを重視して、正確さを若干犠牲にしています。厳密な記述は Shadow DOM Specification の役割です。
- このドキュメントは、「Shadow DOMって何ですか？」って聞かれたときに、参照されることを目的として書かれています。これにより同じ質問に何度も何度も同じことを答えることを防ぐことができます。

Shadow DOM は、DOM の世界に 抽象化の概念をもたらすために生まれました。

抽象化というのは、コンピュータ・サイエンスやエンジニアリングにかぎらず、いっぱんのサイエンス全てに有効なテクニックのひとつです。

あらゆるコンピュータ・サイエンスの問題は、

これまでは、Web ページというのは、ひとつの DOM ツリー で構成されていました。みなさんが、今、見ている、このページも document エレメント をルートとするひとつの DOM Tree からできています。

- CSS

body {
  font: color;
}

想像してみてください。

super global 変数。




Shadow DOM はこの仕組を拡張します。もはや、ページはひとつの DOM Tree から構成されるのではありません。
DOM Tree を構成するひとつひとつのエレメントが、さらに複数の DOM Trees をもてるようになります。

私は、これを 'A tree of trees' と読んでいます。いちばん、トップの Tree は、これまでのように document をルートとした document tree ですが、
各エレメントが、その document tree と同等の、 Shadow Tree を複数持てるようになります。

これらの、複数の DOM Trees が

- カスタム・エレメント

実際には、このような 'A tree of trees' をみなさんが手作業で構成することはありません。これらは、メモリ上に展開される「最終」イメージです。
ほとんどの Web Components のユーザーは、Web Components で用意されている「カスタム・エレメント」の仕組みを使用することになります。
「カスタム・エレメント」とは、ユーザーが独自の「タグ」を定義できるようにする仕組みです。

  <my-cool-button></my-cool-button>

これまでも、このような「コンポーネント化」の仕組みは、Web の歴史上、たくさんありましたが、そのほとんどは、JavaScript レイヤーで実現されていました。

Web components は ブラウザがネイティブでサポートするという意味でこれまでと異なります。
カスタム・エレメントを使用したページは、ブラウザ上で、Shadow DOM を使用した、「A tree of trees」として展開されることになります。

  なぜ、別のTreeにするか、それは、中には触ってほしくないからです。カスタム・エレメントの実装詳細は、
  「アブストラクション」（抽象化）というのは、コンピュータ・サイエンスに限らず、サイエンスの最も基本的な武器のひとつでしたが、これまで、Web はこのようなレベルの抽象化の仕組みがまったくありませんでした。全てのエレメントは、最終的には、ひとつの DOM Tree 上にて展開され、やりたい触り放題。


- カスタム・エレメントを定義するということは、オブジェクト指向的には新規クラスの宣言と同等です。
  （カスタム・エレメントの定義方法については、 Custom Element Spec を参照してください。）

  <my-cool-button></my-cool-button>

  これは、

  class MySuperCoolButton extends Div {

  }

  そのカスタム・エレメントをページ内で使用することは、クラスのインスタンス化に相当します。

  内部に Shadow Tree を持つことになります。
  つまり、Shadow Root をエレメントにアタッチするということは、新規クラスの宣言を意味します。




- さきほどひとつのエレメントは、*複数の* Shadow Roots* をモテるといいました。これは マルチプル Shadow Roots は、さらに継承することを意味します。

  class MyCoolButton extends Div {

  }

  class MySuperCoolButton extends MySuperCoolButton {

  }

  これは、'A tree of Trees' 的には、Div 要素に2つ Shadow Roots がアタッチされていることに相当します。
  - 最初にアタッチされた (older shadow root) が、MyBoolButton に相当します。
  - さらにアタッチされた (younger shadow root) が、MySuperBoolButton に相当します。

- クラスはコンストラクタを持つことができます。そのコンストラクタのパラメータによって、そのインスタンスをカスタマイズできます。

<my-cool-button>
  <label>hello</label>
  <key>hello</key>
</my-cool-button>


The older shadow root
  <div>
     <content select='label'>
     <content select='key'>
  </div>


これは、

  class MyCoolButton extends Div {
     MyBoolButton(label, key) {
       this.label = lable
       this.key = key
     }

  }

Shadow Host の 子供要素は、コンストラクタへ渡されるパラメータの


- <shadow> エレメントは、オブジェクト指向における、親クラスのコンストラクト呼び出しに対応します。

  class MySuperCoolButton extends MyCoolButton {
     MyBoolButton(label, key) {
       this.label = lable
       this.key = key
     }



<x-div>
</x-div>

- <content> エレメントは、オブジェクト指向における、クラスのコンストラクタで与えられたパラメータを、自分のクラスで利用することに対応します。

- カスタムエレメントを単に自分のコンポーネント内で利用するのは、オブジェクト指向における、コンポジションに相当します。



- Web について

- Author

 - Hayato Ito (hayato@google.com)
  - Shadow DOM の Specification Editor と、Chrome/Blink での実装、そして、W3C でのテストスイートのレビューすべてを行っています。本来、これらはそれぞれ別の人がやったほうがいいのです。:)
