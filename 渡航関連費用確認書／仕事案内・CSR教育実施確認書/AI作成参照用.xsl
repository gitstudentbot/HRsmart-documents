<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">

 

  <!-- ============================================================ -->
  <!-- 共通属性                                                      -->
  <!-- ============================================================ -->
  <xsl:attribute-set name="cell.default">
    <xsl:attribute name="border">0.5pt solid black</xsl:attribute>
    <xsl:attribute name="padding">1.5mm</xsl:attribute>
    <xsl:attribute name="display-align">center</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="cell.no-border">
    <xsl:attribute name="padding">1mm 2mm</xsl:attribute>
    <xsl:attribute name="display-align">center</xsl:attribute>
  </xsl:attribute-set>

  <!-- ============================================================ -->
  <!-- ポルトガル語フォント用の名前付きテンプレート (呼び出し用)        -->
  <!-- ============================================================ -->
  <!-- ※ ポルトガル語テキストは全て font-family="Arial Narrow" で統一 -->

  <!-- ============================================================ -->
  <!-- ルート                                                        -->
  <!-- ============================================================ -->
  <xsl:template match="/">
    <!-- ★ 日本語フォント: IPAGothic -->
    <fo:root font-family="IPA Gothic,IPAGothic,Segoe UI Symbol,Yu Mincho" font-size="9pt" color="black">

      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4"
          page-width="210mm" page-height="297mm"
          margin-top="10mm" margin-bottom="10mm"
          margin-left="12mm" margin-right="12mm">
          <fo:region-body margin-top="0mm" margin-bottom="0mm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="A4">
        <fo:flow flow-name="xsl-region-body">

          <!-- ====================================================== -->
          <!-- 宛先 ＆ 文書番号                                         -->
          <!-- ====================================================== -->
          <fo:table table-layout="fixed" width="100%">
            <fo:table-column column-width="120mm"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block font-size="11pt" font-weight="bold"
                    >株式会社サンキョウテクノスタッフ　宛て</fo:block>
                  <fo:block font-size="8pt" color="blue"
                    font-family="Arial Narrow"
                    >Para a SANKYO TECHNO STAFF Co., Ltd.</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border" text-align="right">
                  <fo:block font-size="8pt">4_渡航関連費用確認書_2021_07</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <!-- ====================================================== -->
          <!-- タイトル                                                 -->
          <!-- ====================================================== -->
          <fo:block text-align="center" font-size="16pt" font-weight="bold"
            space-before="4mm" space-after="1mm"
            >渡航関連費用確認書</fo:block>
          <fo:block text-align="center" font-size="10pt" color="blue"
            font-family="Arial Narrow" space-after="4mm"
            >DEMONSTRATIVO REFERENTE ÀS DESPESAS DE VIAGEM</fo:block>

          <!-- ====================================================== -->
          <!-- ◆当該書類の目的                                          -->
          <!-- ====================================================== -->
          <fo:block font-size="8pt" space-after="2mm">
            <fo:block font-weight="bold">◆当該書類の目的</fo:block>
            <fo:block>　プラジルから、株式会社サンキョウテクノスタッフ（以下、当社という）に雇用される労働者として、日本へ渡航及び就労するために必要な諸手続きの代行を、当社の提携先に依頼した際に発生した費用の透明性と妥当性を確認する事を目的としています。</fo:block>
            <fo:block font-weight="bold" color="blue"
              font-family="Arial Narrow">◆OBJETIVO DESTE DOCUMENTO</fo:block>
            <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
              >Os candidatos considerados como trabalhadores contratados do Brasil pela Sankyo Techno Staff Co., Ltd. (doravante denominada CONTRATANTE) terão os diversos procedimentos necessários para a viagem e trabalho no Japão confiados à agência parceira, que irá atuar em nome da empresa CONTRATANTE. Por conta disso, faz-se necessário verificar a transparência e validade dos custos incorridos quando solicitados pelos nossos parceiros.</fo:block>
          </fo:block>

          <!-- ====================================================== -->
          <!-- ◆費用明細について                                        -->
          <!-- ====================================================== -->
          <fo:block font-size="8pt" space-after="2mm">
            <fo:block font-weight="bold">◆費用明細について</fo:block>
            <fo:block>　以下の表は、日本への航空チケット代やビザの申請・取得等の手続きの委託費用の明細及び作成日と署名を明記頂き、航空チケット費用が判明できる資料と合わせて、当社へ提出して頂きますようお願いします。</fo:block>
            <fo:block font-weight="bold" color="blue"
              font-family="Arial Narrow">◆SOBRE OS DETALHES DAS DESPESAS</fo:block>
            <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
              >Na tabela abaixo pedimos para especificar os valores da passagem aérea para o Japão, da taxa de terceirização referente ao procedimento de solicitação e obtenção do visto, e afins. Após anotar a data e assinar, anexe a este documento o comprovante de custo da passagem aérea e entregue-os para a CONTRATANTE.</fo:block>
          </fo:block>

          <!-- ====================================================== -->
          <!-- ◆注意事項                                                -->
          <!-- ====================================================== -->
          <fo:block font-size="7.5pt" space-after="3mm">
            <fo:block font-weight="bold">◆注意事項</fo:block>
            <fo:block>　①　当社に提出された当該書類もとに来日後に当社より、渡航者へ確認作業を行います。</fo:block>
            <fo:block>　②　提出された費用明細の相違や項目以外の費用が発生している事が明らかになった場合は、当社より返金を求める事になりますのでご理解いただきますようお願い致します。</fo:block>
            <fo:block>　③　当社が支払いする航空チケット費用について、エビデンスが無い場合は支払いの対象外となります。</fo:block>
            <fo:block>　④　※ 支払いレートの適用日は、当該書類の作成日とします。また、参考レートは以下のURLにて確認をする事。</fo:block>
            <fo:block>　　　https://internacional.bb.com.br/displayRatesJP.bb　（海外送金及び振替レート）</fo:block>
            <fo:block>　⑤　渡航関連費用は、渡航者が当社指定の取引先に入した場合のみ当社負担にします。</fo:block>

            <fo:block font-weight="bold" color="blue"
              font-family="Arial Narrow" space-before="1mm">◆ Notas importantes</fo:block>
            <fo:block color="blue" font-family="Arial Narrow" font-size="6.5pt"
              >1. Após a chegada ao Japão, com base nos documentos enviados à CONTRATANTE, será realizada uma verificação com o viajante.</fo:block>
            <fo:block color="blue" font-family="Arial Narrow" font-size="6.5pt"
              >2. Caso alguma diferença seja identificada nos valores descritos no demonstrativo ou exista cobrança de taxas extras, a CONTRATANTE irá solicitar o reembolso destes valores; portanto, solicitamos a sua compreensão e colaboração.</fo:block>
            <fo:block color="blue" font-family="Arial Narrow" font-size="6.5pt"
              >3. Os custos da passagem aérea não serão pagos pela CONTRATANTE em caso de não apresentação de evidências (comprovante).</fo:block>
            <fo:block color="blue" font-family="Arial Narrow" font-size="6.5pt"
              >4. *A cotação aplicada para o cálculo das despesas da passagem aérea será conforme a data na qual o presente documento foi criado. Verifique as taxas de referência no seguinte link: https://internacional.bb.com.br/displayRatesJP.bb (Taxa de remessa e transferência no exterior)</fo:block>
            <fo:block color="blue" font-family="Arial Narrow" font-size="6.5pt"
              >5. Os custos relacionados com a viagem apenas serão arcados pelo CONTRATANTE quando o VIAJANTE ingressar no quadro de funcionarios da fábrica determinado pelo CONTRATANTE.</fo:block>
          </fo:block>

          <!-- ====================================================== -->
          <!-- ★ 費用テーブル                                           -->
          <!--                                                          -->
          <!-- Excel上の数式構造:                                        -->
          <!--   各行: 手書き記入欄（XML フィールドなし）                   -->
          <!--   小計: SUM(委託先発生金額の1~3行), SUM(本人発生金額の1~3行) -->
          <!--   合計: 小計(委託先) + 小計(本人)                           -->
          <!--         = {{渡航費金額(円）}}                               -->
          <!--         → Resume.U_859C2192B958924649EEF5C32CD96B         -->
          <!-- ====================================================== -->
          <fo:table table-layout="fixed" width="100%" border-collapse="collapse" space-after="3mm">
            <!-- 7列定義 -->
            <fo:table-column column-width="10mm"/>   <!-- A: № -->
            <fo:table-column column-width="70mm"/>   <!-- B: 項目 -->
            <fo:table-column column-width="18mm"/>   <!-- C: 委託先 -->
            <fo:table-column column-width="25mm"/>   <!-- D: 発生金額(委託先) -->
            <fo:table-column column-width="18mm"/>   <!-- E: 本人 -->
            <fo:table-column column-width="25mm"/>   <!-- F: 発生金額(本人) -->
            <fo:table-column column-width="20mm"/>   <!-- G: サンキョウ確認欄 -->

            <!-- ─── ヘッダ ─── -->
            <fo:table-header>
              <!-- ヘッダ1行目 -->
              <fo:table-row height="8mm">
                <fo:table-cell number-rows-spanned="2"
                  xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block>№</fo:block>
                </fo:table-cell>
                <fo:table-cell number-rows-spanned="2"
                  xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block>項　目</fo:block>
                  <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
                    >Detalhamento</fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="4"
                  xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block>費用負担者　
                    <fo:inline color="blue" font-family="Arial Narrow" font-size="7pt"
                      >Divisão de despesas</fo:inline>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-rows-spanned="2"
                  xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block>ｻﾝｷｮｳ</fo:block>
                  <fo:block>確認欄</fo:block>
                </fo:table-cell>
              </fo:table-row>
              <!-- ヘッダ2行目 (費用負担者の内訳) -->
              <fo:table-row height="8mm">
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block>委託先</fo:block>
                  <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
                    >Agência</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block>発生金額</fo:block>
                  <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
                    >Valor</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block>本人</fo:block>
                  <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
                    >Viajante</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block>発生金額</fo:block>
                  <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
                    >Valor</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-header>

            <!-- ─── 本体 ─── -->
            <fo:table-body>

              <!-- ===== 行1: 航空券費用 ===== -->
              <!--
                Excel数式: なし（手書き記入欄）
                ※ 対応する XML フィールドなし → 空欄
              -->
              <fo:table-row height="12mm">
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block>1</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>ブラジルから日本への航空券費用 ※4</fo:block>
                  <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
                    >Passagem aérea do Brasil para o Japão*</fo:block>
                </fo:table-cell>
                <!-- C1: 委託先チェック -->
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <!-- D1: 委託先 発生金額 -->
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="right">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <!-- E1: 本人チェック -->
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <!-- F1: 本人 発生金額 -->
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="right">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <!-- G1: 確認欄 -->
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
              </fo:table-row>

              <!-- ===== 行2: ビザ取得手続き代行費用（親行） ===== -->
              <fo:table-row height="12mm">
                <fo:table-cell number-rows-spanned="3"
                  xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block>2</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>ビザ取得手続き代行費用</fo:block>
                  <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
                    >Taxa de terceirização referente ao procedimento de solicitação e obtenção do visto</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="right">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="right">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
              </fo:table-row>

              <!-- ===== 行2-sub1: 海外旅行傷害保険費用 ===== -->
              <fo:table-row height="10mm">
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>　・海外旅行傷害保険費用</fo:block>
                  <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
                    >　  Taxa referente ao seguro de viagem internacional</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="right">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="right">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
              </fo:table-row>

              <!-- ===== 行2-sub2: 空港アテンド費用 ===== -->
              <fo:table-row height="10mm">
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>　・ブラジルでの空港までのアテンド費用</fo:block>
                  <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
                    >　  Assistência até o momento de embarque do aeroporto no Brasil</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="right">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="right">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
              </fo:table-row>

              <!-- ===== 行3: その他の費用 ===== -->
              <fo:table-row height="12mm">
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block>3</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>その他の費用</fo:block>
                  <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
                    >Outras despesas</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="right">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="right">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
              </fo:table-row>

              <!-- ===== 小計 ===== -->
              <!--
                Excel数式:
                  D列(委託先 発生金額) = SUM(D1:D3)   ← 行1~3の委託先金額合計
                  F列(本人 発生金額)   = SUM(F1:F3)   ← 行1~3の本人金額合計
                ※ 個別費用に対応する XML フィールドが無いため、
                   XSLT では合算不可 → 空欄表示
              -->
              <fo:table-row height="8mm" background-color="#F2F2F2">
                <fo:table-cell number-columns-spanned="2"
                  xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block font-weight="bold">小計
                    <fo:inline color="blue" font-family="Arial Narrow"
                      > Sub total</fo:inline>
                  </fo:block>
                </fo:table-cell>
                <!-- 委託先チェック -->
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <!-- 委託先 発生金額 小計 = SUM(D1:D3) -->
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="right">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <!-- 本人チェック -->
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <!-- 本人 発生金額 小計 = SUM(F1:F3) -->
                <fo:table-cell xsl:use-attribute-sets="cell.default" text-align="right">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
                <!-- 確認欄 -->
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
              </fo:table-row>

              <!-- ===== 合計 ===== -->
              <!--
                Excel数式:
                  合計 = 小計(委託先) + 小計(本人)
                       = {{渡航費金額(円）}}
                  XML : Resume.U_859C2192B958924649EEF5C32CD96B
              -->
              <fo:table-row height="10mm" background-color="#E6E6E6">
                <fo:table-cell number-columns-spanned="2"
                  xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block font-weight="bold" font-size="10pt">合計
                    <fo:inline color="blue" font-family="Arial Narrow"
                      > Total geral</fo:inline>
                  </fo:block>
                </fo:table-cell>
                <!-- 合計金額: 4列結合 -->
                <fo:table-cell number-columns-spanned="4"
                  xsl:use-attribute-sets="cell.default" text-align="center">
                  <fo:block font-weight="bold" font-size="11pt">
                    <!-- {{渡航費金額(円）}} -->
                    <xsl:value-of
                      select="Process/P_Resume/Resume/Resume.U_859C2192B958924649EEF5C32CD96B"/>
                  </fo:block>
                </fo:table-cell>
                <!-- 確認欄 -->
                <fo:table-cell xsl:use-attribute-sets="cell.default">
                  <fo:block>&#160;</fo:block>
                </fo:table-cell>
              </fo:table-row>

            </fo:table-body>
          </fo:table>

          <!-- ====================================================== -->
          <!-- 同意文                                                   -->
          <!-- ====================================================== -->
          <fo:block font-size="8pt" space-after="3mm">
            <fo:block>上記の詳細の説明内容に相違ありません。</fo:block>
            <fo:block color="blue" font-family="Arial Narrow" font-size="7pt"
              >Declaro que recebi a explicação sobre o conteúdo das despesas acima mencionadas e estou de acordo com os valores descritos.</fo:block>
          </fo:block>

          <!-- ====================================================== -->
          <!-- 日付・署名セクション                                      -->
          <!-- ====================================================== -->
          <fo:table table-layout="fixed" width="100%" space-after="2mm">
            <fo:table-column column-width="90mm"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-body>
              <!-- 日付ラベル行 -->
              <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block font-size="8pt" font-weight="bold"
                    >作成日 <fo:inline color="blue" font-family="Arial Narrow"
                    >Data da criação:</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block font-size="8pt" font-weight="bold"
                    >確認日 / <fo:inline color="blue" font-family="Arial Narrow"
                    >Data da confirmação:</fo:inline></fo:block>
                </fo:table-cell>
              </fo:table-row>
              <!-- 日付値行 -->
              <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block font-size="9pt">&#160;</fo:block>
                  <fo:block border-bottom="0.25pt solid black" width="70mm">&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block font-size="9pt">&#160;</fo:block>
                  <fo:block border-bottom="0.25pt solid black" width="70mm">&#160;</fo:block>
                  <fo:block font-size="7pt" color="blue"
                    font-family="Arial Narrow" text-align="center"
                    >(após chegar ao Japão)</fo:block>
                  <fo:block font-size="7pt" text-align="center">（日本到着後）</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <!-- ====================================================== -->
          <!-- 署名エリア                                                -->
          <!-- ====================================================== -->
          <fo:table table-layout="fixed" width="100%" space-before="3mm" space-after="2mm">
            <fo:table-column column-width="90mm"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-body>
              <!-- ラベル行 -->
              <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block font-size="8pt" font-weight="bold"
                    >委託先 <fo:inline color="blue" font-family="Arial Narrow"
                    >Agência</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block font-size="8pt" font-weight="bold"
                    >渡航者 <fo:inline color="blue" font-family="Arial Narrow"
                    >Viajante</fo:inline></fo:block>
                </fo:table-cell>
              </fo:table-row>

              <!-- 名前行1: 旅行社 / ローマ字読み -->
              <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block font-size="9pt">
                    <!-- {{旅行社}} → Resume.U_7628E4A1D55D9BADFC3D1B4DD3442F -->
                    <xsl:value-of
                      select="Process/P_Resume/Resume/Resume.U_7628E4A1D55D9BADFC3D1B4DD3442F"/>&#160;
                  </fo:block>
                  <fo:block border-bottom="0.25pt solid black" width="70mm">&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block font-size="9pt">
                    <!-- {{ローマ字読み}} → Resume.U_FC72FCBA2CFD318880DB7CABF5C188 -->
                    <xsl:value-of
                      select="Process/P_Resume/Resume/Resume.U_FC72FCBA2CFD318880DB7CABF5C188"/>&#160;
                  </fo:block>
                  <fo:block border-bottom="0.25pt solid black" width="70mm">&#160;</fo:block>
                </fo:table-cell>
              </fo:table-row>

              <!-- 名前行2: (空欄) / ローマ字 -->
              <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block font-size="9pt">&#160;</fo:block>
                  <fo:block border-bottom="0.25pt solid black" width="70mm">&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block font-size="9pt">
                    <!-- {{ローマ字}} → Resume.U_B39F940CF5321D491A837364E3BC95 -->
                    <xsl:value-of
                      select="Process/P_Resume/Resume/Resume.U_B39F940CF5321D491A837364E3BC95"/>&#160;
                  </fo:block>
                  <fo:block border-bottom="0.25pt solid black" width="70mm">&#160;</fo:block>
                </fo:table-cell>
              </fo:table-row>

              <!-- 署名ラベル行 -->
              <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border" padding-top="2mm">
                  <fo:block font-size="8pt"
                    >署　名  <fo:inline color="blue" font-family="Arial Narrow"
                    >Assinatura da agência</fo:inline></fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border" padding-top="2mm">
                  <fo:block font-size="8pt"
                    >署　名  <fo:inline color="blue" font-family="Arial Narrow"
                    >Assinatura do viajante</fo:inline></fo:block>
                </fo:table-cell>
              </fo:table-row>

              <!-- 署名欄（空白） -->
              <fo:table-row height="15mm">
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block border-bottom="0.25pt solid black" width="70mm">&#160;</fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="cell.no-border">
                  <fo:block border-bottom="0.25pt solid black" width="70mm">&#160;</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <!-- ====================================================== -->
          <!-- フッター注記                                              -->
          <!-- ====================================================== -->
          <fo:block font-size="6.5pt" space-before="4mm"
            border-top="0.5pt solid black" padding-top="2mm">
            <fo:block>当該書類は株式会社サンキョウテクノスタッフによって、正式に発行された書類であり書式の改ざんはもとより、当社と関係のない目的による使用を禁止します。2020.03.01作成</fo:block>
            <fo:block color="blue" font-family="Arial Narrow"
              >Documento originalmente emitido pela empresa Sankyo Techno Staff Co., Ltd. na data do dia 01/03/2020. Este documento não poderá ser reproduzido ou alterado em hipótese alguma.</fo:block>
          </fo:block>

        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

</xsl:stylesheet>