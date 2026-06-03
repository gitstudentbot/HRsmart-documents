<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<!-- ====================================================== -->
	<!-- セルの属性を先に定義                                     -->
	<!-- ====================================================== -->
	<xsl:attribute-set name="cell.default">
		<xsl:attribute name="border-left">0.8pt solid</xsl:attribute>
		<xsl:attribute name="border-right">0.8pt solid</xsl:attribute>
		<xsl:attribute name="border-bottom">0.8pt dotted</xsl:attribute>
		<xsl:attribute name="border-top">0.8pt dotted</xsl:attribute>
		<xsl:attribute name="display-align">center</xsl:attribute>
	</xsl:attribute-set>


	<!-- ====================================================== -->
	<!-- Root                                                   -->
	<!-- ====================================================== -->
	<xsl:template match="Process">
		<fo:root font-size="10pt" font-family="IPA Gothic,IPAGothic">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4" page-width="210mm" page-height="297mm"
					margin-top="10mm" margin-bottom="5mm" margin-left="15mm" margin-right="15mm">
					<fo:region-body margin-top="0mm" margin-bottom="0mm" />
					<fo:region-before extent="10mm" />
					<fo:region-after extent="0mm" />
					<fo:region-start extent="0mm" />
					<fo:region-end extent="0mm" />
				</fo:simple-page-master>
			</fo:layout-master-set>

			<xsl:for-each select="Item">
				<fo:page-sequence master-reference="A4">

					<!-- ====================================================== -->
					<!-- ヘッダー                                                -->
					<!-- ====================================================== -->
					<fo:static-content flow-name="xsl-region-before">
						<fo:block text-align="right" font-size="7pt" padding-top="2mm" margin-right="2mm">
							2_仮内定通知書_ST2020_04
						</fo:block>
					</fo:static-content>


					<!-- ====================================================== -->
					<!-- 本文宣言＆本文を囲む二重線                               -->
					<!-- ====================================================== -->
					<fo:flow flow-name="xsl-region-body">
						<fo:block border="2pt double" padding="5mm">
							<!--文書管理-->
							<fo:block text-align="center" font-size="14pt">仮内定通知書</fo:block>
							<fo:block text-align="center" color="#1E90FF" space-after="5mm" font-family="Arial Narrow">COMUNICADO DE
								PRÉ-APROVAÇÃO</fo:block>
							<fo:block line-height="10pt">
								株式会社サンキョウテクノスタッフ（以下「甲」という）は、日本国での就労希望者（以下「乙」という）との雇用について、仮内定を決定したことを本書をもって通知いたします。今後、甲は事前に提示した終了条件について、仮契約書、契約書類に明記して乙へ提示との契約を進めて参ります。
							</fo:block>
							<fo:block line-height="10pt">
								尚、本書4条に明記されている事柄が明らかになった場合は、仮契約書を締結後においてもその効力は、無効とさせて頂きます。
							</fo:block>
							<fo:block font-family="Arial Narrow" color="#1E90FF" line-height="10pt">
								A Sankyo Techno Staff Co.,Ltd. (doravante denominada CONTRATANTE) notifica a decisão de pré-aprovação para a oferta de emprego do candidato mencionado abaixo disposto a trabalhar no Japão(doravante denominado CANDIDATO).
							</fo:block>
							<fo:block font-family="Arial Narrow" color="#1E90FF" line-height="10pt">
								Na sequência, a CONTRATANTE fará a inscrição dos dados do CANDIDATO no contrato provisório e no documento contratual conforme as condições previamente explicadas, e irá apresentá-los ao CANDIDATO para que se possa realizar o andamento do processo contratual.
							</fo:block>
							<fo:block font-family="Arial Narrow" color="#1E90FF" line-height="10pt" space-after="6mm">
								No entanto, caso qualquer circunstância especificada no artigo 4º do presente documento for constatada, o efeito deste acordo será revogado mesmo após a conclusão de contrato provisório.
							</fo:block>

							<!-- ====================================================== -->
							<!-- テーブル１ 希望就労者               　　　　　　　　      -->
							<!-- ====================================================== -->
							<fo:block font-size="8pt">
								<fo:inline>
									1条　-乙
								</fo:inline>
								<fo:inline font-family="Arial Narrow" color="#1E90FF">
									Artigo 1º - CANDIDATO
								</fo:inline>
							</fo:block>
							<fo:table table-layout="fixed" width="100%" border-collapse="collapse" space-after="3mm" border="0.8pt solid">
								<fo:table-column column-number="1" column-width="25%"/>
								<fo:table-column column-number="2" column-width="75%"/>
								<fo:table-body>
									<!--======１行目（氏名）======-->
									<fo:table-row>
										<fo:table-cell xsl:use-attribute-sets="cell.default" background-color="#D3D3D3">
											<fo:block>
												<fo:inline>
													氏　名　
												</fo:inline>
												<fo:inline font-family="Arial Narrow" color="#1E90FF">
													Nome
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell xsl:use-attribute-sets="cell.default">
											<fo:block font-family="Arial Narrow">
												<fo:inline padding="1mm">
													<xsl:value-of select="Process.P_Resume/Resume/Resume.U_B39F940CF5321D491A837364E3BC95"/>
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<!--======２行目（生年月日）======-->
									<fo:table-row>
										<fo:table-cell xsl:use-attribute-sets="cell.default" background-color="#D3D3D3">
											<fo:block>
												<fo:inline>
													生年月日
												</fo:inline>
												<fo:inline font-family="Arial Narrow" color="#1E90FF">
													Data de nascimento
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell xsl:use-attribute-sets="cell.default">
											<fo:block>
												<fo:inline padding="1mm">
													<xsl:value-of select="Process.P_Resume/Resume/Resume.P_DateOfBirth"/>
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<!--=======３行目（国籍）======-->
									<fo:table-row>
										<fo:table-cell xsl:use-attribute-sets="cell.default" background-color="#D3D3D3">
											<fo:block>
												<fo:inline>
													国　籍　
												</fo:inline>
												<fo:inline font-family="Arial Narrow" color="#1E90FF">
													Nacionalidade
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell xsl:use-attribute-sets="cell.default">
											<fo:block>
												<fo:inline padding="1mm">
													<xsl:value-of select="Process.P_Resume/Resume/Resume.U_6184B5CC17CF510A92B30827310A7F"/>
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<!--======４行目（住所）=======-->
									<fo:table-row>
										<fo:table-cell xsl:use-attribute-sets="cell.default" background-color="#D3D3D3">
											<fo:block>
												<fo:inline>
													住　所　
												</fo:inline>
												<fo:inline font-family="Arial Narrow" color="#1E90FF">
													Endereço
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell xsl:use-attribute-sets="cell.default">
											<fo:block>
												<fo:inline padding="1mm">
													<xsl:value-of select="Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.P_Street"/>
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>


							<!-- ====================================================== -->
							<!-- テーブル２ 希望就労者               　　　　　　　　　     -->
							<!-- ====================================================== -->
							<fo:block font-size="8pt">
								<fo:inline>
									2条　-労働条件概要（別紙）
								</fo:inline>
								<fo:inline font-family="Arial Narrow" color="#1E90FF">
									Artigo 1º- CONDIÇÕES DE TRABALHO
								</fo:inline>
							</fo:block>
							<fo:table table-layout="fixed" width="100%" border-collapse="collapse" space-after="3mm" border="0.8pt solid">
								<fo:table-column column-number="1" column-width="25%"/>
								<fo:table-column column-number="2" column-width="75%"/>
								<fo:table-body>
							 		<fo:table-row space-after="3mm">
										<fo:table-cell xsl:use-attribute-sets="cell.default" background-color="#D3D3D3" display-align="center">
							 				<fo:block>
												<fo:inline>
													対象書面
												</fo:inline>
												<fo:inline font-family="Arial Narrow" color="#1E90FF" font-size="8pt">
													Descrição do documento
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell xsl:use-attribute-sets="cell.default" font-family="Arial Narrow" display-align="center">
											<fo:block>
												<fo:inline padding="1mm">
													CONFORME DOCUMENTO À PARTE
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>


							<!-- 年・月・日を分解 -->
							<xsl:variable name="year" select="number(substring(/Process/System/CurrentDateTime, 1, 4))"/>
							<xsl:variable name="month" select="number(substring(/Process/System/CurrentDateTime, 6, 2))"/>
							<xsl:variable name="day" select="number(substring(/Process/System/CurrentDateTime, 9, 2))"/>

							<!--６カ月加算-->
							<xsl:variable name="newYear" select="$year + floor(($month + 6 - 1) div 12)"/>
							<xsl:variable name="newMonth" select="(($month + 6 - 1) mod 12) + 1"/>

							<!-- ====================================================== -->
							<!-- テーブル３　有効期限               　　　　　　　　　     -->
							<!-- ====================================================== -->
							<fo:block font-size="8pt">
								<fo:inline>
									3条　-本書の有効期限
								</fo:inline>
								<fo:inline font-family="Arial Narrow" color="#1E90FF">
									Artigo 3º - VALIDADE DO DOCUMENTO
								</fo:inline>
							</fo:block>
							<fo:table table-layout="fixed" width="100%" border-collapse="collapse" space-after="3mm" border="0.8pt solid">
								<fo:table-column column-number="1" column-width="25%"/>
								<fo:table-column column-number="2" column-width="75%"/>
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell xsl:use-attribute-sets="cell.default" background-color="#D3D3D3">
											<fo:block>
												<fo:inline>
													有効期限
												</fo:inline>
												<fo:inline font-family="Arial Narrow" color="#1E90FF">
													Prazo de validade
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block>
												<fo:inline padding="1mm">
													<xsl:value-of select="$newYear"/>
													<xsl:text>/</xsl:text>
													<xsl:value-of select="format-number($newMonth, '00')"/>
													<xsl:text>/</xsl:text>
													<xsl:value-of select="format-number($day, '00')"/>
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
							
							<!--=======仮契約書が無効となる場合=======-->
							<fo:block font-size="8pt">
								4条　-日本への入国前に仮契約書が無となる事柄
							</fo:block>
							<fo:block font-size="8pt" font-family="Arial Narrow" color="#1E90FF" space-after="3mm">
								Artigo 4º - CIRCUNSTÂNCIAS PRECENDENTES À ENTRADA NO JAPÃO QUE TORNARÃO INVÁLIDO O CONTRATO PROVISÓRIO
							</fo:block>

							<fo:table table-layout="fixed" width="100%" font-size="8pt" space-after="15mm">
								<fo:table-column column-number="1" column-width="50%"/>
								<fo:table-column column-number="2" column-width="50%"/>
								<fo:table-body>
									<fo:table-row>
										<!--======左側(日本語)======-->
										<fo:table-cell>
											<fo:block space-after="2mm">
												仮契約中に下記事柄の何れかに該当することが明らかになった場合は、仮契約書を締結後においても、その効力は、無効となります。
											</fo:block>
											<fo:block>
												<fo:inline padding-left="2mm">
													1)乙が仮契約有効期間内に仮契約に同意しなかった場合。
												</fo:inline>
											</fo:block>
											<fo:block>
												<fo:inline padding-left="2mm">
													2)乙が自ら予定した日本へ行く日時を遅らせた場合。
												</fo:inline>
											</fo:block>
											<fo:block>
												<fo:inline padding-left="2mm">
													3)乙提出書類に、不備、不具合、偽造が有った場合。
												</fo:inline>
											</fo:block>
											<fo:block>
												<fo:inline padding-left="2mm">
													4)乙が持病や事故により甲内定の仕事に無理な場合。
												</fo:inline>
											</fo:block>
											<fo:block>
												<fo:inline padding-left="2mm">
													5)乙が犯罪や非業の行為（不正行為）を犯した場合。
												</fo:inline>
											</fo:block>
											<fo:block>
												<fo:inline padding-left="2mm">
													6)乙が犯罪組織や反社会運動に関係がある場合。
												</fo:inline>
											</fo:block>
											<fo:block>
												<fo:inline>
													及び薬物(大麻、覚せい剤など)の密入出、入手、所持、使用したことが有った場合。
												</fo:inline>
											</fo:block>
											<fo:block space-after="3mm">
												<fo:inline padding-left="2mm">
													7)その他、上記記載に相当するやむを得ない理由が発生した場合。
												</fo:inline>
											</fo:block>
											<fo:block>
												<fo:inline padding-left="2mm">
													上記載の内容は憲法22条記載の居住、移転(引っ越し)、職業選択の自由を保障する権利を侵していません。	
												</fo:inline>
											</fo:block>
											<fo:block>
												<fo:inline>
													尚、本書類は日本の法律に準拠して作成しております。
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<!--======右側(ポルトガル語)======-->
										<fo:table-cell color="#1E90FF">
											<fo:block font-family="Arial Narrow">
												<fo:inline padding-left="2mm">
													Se constatada durante a vigência do contrato provisório qualquer uma as circunstâncias abaixo, o efeito de pré-contratação será revogado.
												</fo:inline>
											</fo:block>
											<fo:block font-family="Arial Narrow">
												<fo:inline padding-left="2mm">
													1) O CANDIDATO não concordar com os termos do contrato provisório durante a vigência da pré-contratação.
												</fo:inline>
											</fo:block>
											<fo:block font-family="Arial Narrow">
												<fo:inline padding-left="2mm">
													2)O CNADIDATO não emabrcar ao Japão até a data prevista.
												</fo:inline>
											</fo:block>
											<fo:block font-family="Arial Narrow">
												<fo:inline padding-left="2mm">
													3)O CANDIDATO apresentar documentos com falhas, erros ou falsificações.
												</fo:inline>
											</fo:block>
											<fo:block font-family="Arial Narrow">
												<fo:inline padding-left="2mm">
													4)O CANDIDATO apresentar inaptidão para o trabalho oferecido por causa de alguma condição médica ou acidente.
												</fo:inline>
											</fo:block>
											<fo:block font-family="Arial Narrow">
												<fo:inline padding-left="2mm">
													5)O CANDIDATO cometeu algum crime ou delito(apresentar má conduta).
												</fo:inline>
											</fo:block>
											<fo:block font-family="Arial Narrow">
												<fo:inline padding-left="2mm">
													6)O CANDIDATO passuir algum envolvimento com qualquer organização criminosa ou movimento antissocial, ou estar relacionado com importação, exportação, aquisição, porte, uso, etc. de drogas psicotrópicas, narcóticos e estimulantes.
												</fo:inline>
											</fo:block>
											<fo:block font-family="Arial Narrow">
												<fo:inline padding-left="2mm">
													7)Outras razões inevitáveis que se equivalem às circunstâncias descritas acima. Os termos acimas descritos não violam o direito presente no artigo 22º da Constituição Japonesa, que garante a liberdade de residência, transferência(mudança) e escolha de profissão.
												</fo:inline>
											</fo:block>
											<fo:block font-family="Arial Narrow">
												<fo:inline padding-left="2mm">
													Este documento foi elaborado em conformidade com as leis japonesas.
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>

							<!--======署名欄======-->
							<fo:table table-layout="fixed" width="100%" font-size="8pt">
								<fo:table-column column-number="1" column-width="40%"/>
								<fo:table-column column-number="2" column-width="55%"/>
								<fo:table-column column-number="3" column-width="5%"/>
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell>
											<fo:block>

											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block>
												本書内容について合意します。
											</fo:block>
											<fo:block font-family="Arial Narrow" color="#1E90FF" space-after="1mm">
												Estou de acordo com o conteúdo deste documento.
											</fo:block>
											<fo:block>
												<fo:inline>
													(甲)
												</fo:inline>
												<fo:inline font-family="Arial Narrow" color="#1E90FF">
													CONTRATANTE
												</fo:inline>
											</fo:block>
											<fo:block>
												愛知県豊橋市西幸町字幸２２－２
											</fo:block>
											<fo:block font-family="Arial Narrow" color="#1E90FF" space-after="1mm">
												AICHI-KEN, TOYOHASHI-SHI, NISHI MIYUKI-CHO, AZA MIYUKI 22-2
											</fo:block>
											<fo:block>
												<fo:inline>
													株式会社サンキョウテクノスタッフ　
												</fo:inline>
												<fo:inline font-family="Yu Mincho">
													㊞
												</fo:inline>
											</fo:block>
											<fo:block font-family="Arial Narrow" color="#1E90FF" space-after="10mm">
												SANKYO TECHNO STAFF CO.,LTD.
											</fo:block>
											<fo:block>
												<fo:inline>
													(乙)
												</fo:inline>
												<fo:inline font-family="Arial Narrow" color="#1E90FF">
													CANDIDATO
												</fo:inline>
											</fo:block>
											<fo:block font-family="Arial Narrow" space-after="1mm">
												<fo:inline>
													<xsl:value-of select="Process.P_Resume/Resume/Resume.U_B39F940CF5321D491A837364E3BC95"/>
												</fo:inline>
											</fo:block>
											<fo:block space-after="10mm">
												<xsl:value-of select="Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.P_Street"/>
											</fo:block>
											<fo:block border-bottom="0.8pt solid">
												&#xA0;
											</fo:block>
											<fo:block text-align="center">
												<fo:inline>
													署名
												</fo:inline>
												<fo:inline font-family="Arial Narrow" color="#1E90FF">
													ASSINATURA
												</fo:inline>
											</fo:block>
											<!-- ======ロゴ====== -->
											<fo:block-container absolute-position="absolute">
											<fo:block text-align="right" margin-right="20mm" margin-top="10mm">
											<fo:external-graphic src="電子印鑑.png" content-height="scale-down-to-fit"
											content-width="scale-down-to-fit" height="27mm" width="25mm" />
											</fo:block>
											</fo:block-container>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</fo:block>
					</fo:flow>
				</fo:page-sequence>
			</xsl:for-each>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>