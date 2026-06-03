<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:datetime="http://exslt.org/dates-and-times">

	<xsl:template match="Process">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master margin-right="6mm" margin-left="6mm" margin-top="6mm"
					margin-bottom="30mm" page-height="297mm" page-width="210mm" master-name="A4">
					<fo:region-body margin-left="8mm" margin-right="8mm" />
					<fo:region-before extent="11mm" />
					<fo:region-after extent="60mm" />
					<fo:region-start extent="0mm" />
					<fo:region-end extent="0mm" />
				</fo:simple-page-master>
			</fo:layout-master-set>

			<!--本文内容,Itemループ-->
			<xsl:for-each select="Item">
				<fo:page-sequence master-reference="A4" font-family="IPA Gothic,IPAGothic"
					font-size="12pt">

					<fo:static-content flow-name="xsl-region-before">						<!--ヘッダー-->
						<fo:block text-align="right" font-size="8pt" padding-top="2mm"
							margin-right="4mm">5_渡航費用説明同意書_2020_03</fo:block>
					</fo:static-content>


					<fo:static-content flow-name="xsl-region-after">						<!--フッター-->
						<fo:block-container display-align="center" height="60mm" margin-left="2mm"
							margin-right="2mm">
							<fo:block>
								<fo:table table-layout="fixed" width="100%" border-collapse="collapse">
									<fo:table-column column-width="130mm" />								<!--本社押印欄-->
									<fo:table-column column-width="proportional-column-width(1)" />		<!--矢印(残り幅を吸収)-->
									<fo:table-column column-width="45mm" />								<!--営業所押印欄-->

									<fo:table-body font-size="10pt">
										<fo:table-row>
											<!--==================本社押印欄====================-->
											<fo:table-cell display-align="center">
												<fo:block>
													<fo:table table-layout="fixed" width="126mm"
														border="1pt solid">
														<fo:table-column column-width="18mm"
															number-columns-repeated="7" />
														<fo:table-body>
															<fo:table-row height="6mm">
																<fo:table-cell
																	number-columns-spanned="7"
																	border="1pt solid"
																	display-align="center">
																	<fo:block text-align="center"
																		font-size="14pt">本社</fo:block>
																</fo:table-cell>
															</fo:table-row>

															<fo:table-row height="6mm">
																<fo:table-cell border="1pt solid">
																	<fo:block />
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block />
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block />
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block text-align="center"
																		wrap-option="no-wrap">
																		人材開発課
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block text-align="center"
																		wrap-option="no-wrap">
																		人材開発課
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block text-align="center"
																		wrap-option="no-wrap">
																		人材開発課
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block text-align="center"
																		wrap-option="no-wrap">
																		人材開発課
																	</fo:block>
																</fo:table-cell>

															</fo:table-row>

															<fo:table-row height="18mm"
																font-size="12pt">
																<fo:table-cell border="1pt solid">
																	<fo:block />
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block />
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block />
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block text-align="center"
																		color="#D3D3D3">
																		保管
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block text-align="center"
																		color="#D3D3D3">
																		データ
																	</fo:block>
																	<fo:block text-align="center"
																		color="#D3D3D3">
																		入力
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block text-align="center"
																		color="#D3D3D3">
																		確認
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block text-align="center"
																		color="#D3D3D3">
																		承認
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:block>
											</fo:table-cell>
											<!--================矢印==================-->
											<fo:table-cell display-align="center">
												<fo:block text-align="center"
													font-family="Segoe UI Symbol" font-size="16pt">
													⇐
												</fo:block>
											</fo:table-cell>
											<!--=================営業所押印欄==================-->
											<fo:table-cell display-align="center">
												<fo:block>
													<fo:table table-layout="fixed" width="36mm"
														border="1pt solid" border-collapse="collapse">
														<fo:table-column column-width="18mm"
															number-columns-repeated="2" />
														<fo:table-body>
															<fo:table-row height="6mm">
																<fo:table-cell
																	number-columns-spanned="2"
																	display-align="center">
																	<fo:block text-align="center"
																		font-size="14pt">
																		営業所
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>

															<fo:table-row height="6mm">
																<fo:table-cell border="1pt solid">
																	<fo:block text-align="center">
																		所長
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block text-align="center">
																		担当者
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>

															<fo:table-row height="18mm"
																font-size="12pt">
																<fo:table-cell border="1pt solid">
																	<fo:block text-align="center"
																		color="#D3D3D3">
																		承認
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="1pt solid">
																	<fo:block text-align="center"
																		color="#D3D3D3">
																		作成
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>

														</fo:table-body>
													</fo:table>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:block>
						</fo:block-container>
					</fo:static-content>

					<fo:flow flow-name="xsl-region-body">
						<fo:block-container border="2pt double" padding="7mm">							<!--外枠二重線ように、複数のテーブルを囲むためのコンテナを作って、その外側にborderを設定します-->
							<fo:table table-layout="fixed">
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell text-align="center">
											<fo:block font-size="20pt">
												渡航費用説明同意書
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell text-align="center" padding="3mm"
											font-family="Arial Narrow">
											<fo:block font-size="12pt" color="#1E90FF">
												TERMO DE CONSENTIMENTO QUANTO À EXPLICAÇÃO SOBRE
												DESPESAS DE VIAGEM
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>


							<fo:table table-layout="fixed" border="1pt solid" width="100%"
								margin-top="1mm" border-collapse="collapse">
								<fo:table-column column-number="1" column-width="25%" />
								<fo:table-column column-number="2" column-width="75%" />
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell padding="2mm" border="0.25pt solid"
											display-align="center" background-color="#D3D3D3">
											<fo:block text-align="left">
												住 所
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="2mm" display-align="center"
											border="0.25pt solid">
											<fo:block text-align="left">
												愛知県豊橋市西幸町幸２２－２
											</fo:block>
										</fo:table-cell>
									</fo:table-row>

									<fo:table-row>
										<fo:table-cell padding="2mm" border="0.25pt solid"
											display-align="center" font-family="Arial Narrow"
											font-size="12pt" background-color="#D3D3D3">
											<fo:block color="#1E90FF">
												ENDEREÇO
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="2mm" border="0.25pt solid"
											display-align="center" font-family="Arial Narrow"
											font-size="12pt">
											<fo:block>
												AICHI-KEN, TOYOHASHI-SHI, NISHI MIYUKI-CHO, AZA
												MIYUKI 22-2
											</fo:block>
										</fo:table-cell>
									</fo:table-row>

									<fo:table-row>
										<fo:table-cell padding="2mm" display-align="center"
											border="0.25pt solid" background-color="#D3D3D3">
											<fo:block>
												会社名
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="2mm" display-align="center"
											border="0.25pt solid">
											<fo:block>
												株式会社サンキョウテクノスタッフ 殿
											</fo:block>
										</fo:table-cell>
									</fo:table-row>

									<fo:table-row>
										<fo:table-cell padding="2mm" border="0.25pt solid"
											display-align="center" font-family="Arial Narrow"
											background-color="#D3D3D3">
											<fo:block color="#1E90FF">
												EMPRESA
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="2mm" border="0.25pt solid"
											display-align="center" font-family="Arial Narrow">
											<fo:block>
												SANKYO TECHNO STAFF CO., LTD.
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>

							<fo:table table-layout="fixed" border="1pt solid" width="100%"
								margin-top="6mm" border-collapse="collapse">
								<fo:table-column column-number="1" column-width="10%" />
								<fo:table-column column-number="2" column-width="15%" />
								<fo:table-column column-number="3" column-width="75%" />
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell padding="1mm" border="0.25pt solid"
											display-align="center" background-color="#D3D3D3"
											number-columns-spanned="3">
											<fo:block text-align="center">
												<fo:inline>
													渡航費用総額
												</fo:inline>
												<fo:inline font-family="Arial Narrow" color="#1E90FF"
													padding="2mm">
													CUSTO TOTAL DA VIAGEM
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>

									<fo:table-row>
										<fo:table-cell padding="1mm" border="0.25pt solid"
											display-align="center" background-color="#D3D3D3">
											<fo:block text-align="center">
												<fo:inline>
													日本円
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="1mm" border="0.25pt solid"
											display-align="center" background-color="#D3D3D3"
											font-size="12pt">
											<fo:block text-align="center" color="#1E90FF"
												wrap-option="no-wrap">
												<fo:inline font-family="Arial Narrow">
													IENE JAPONÊS
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="1mm" display-align="center">
											<fo:block>
												<fo:inline padding="1mm"> ￥ <xsl:choose>
														<xsl:when
															test="Process.P_Resume/Resume/Resume.U_859C2192B958924649EEF5C32CD96B != '' and number(Process.P_Resume/Resume/Resume.U_859C2192B958924649EEF5C32CD96B) = number(Process.P_Resume/Resume/Resume.U_859C2192B958924649EEF5C32CD96B)">
															<xsl:value-of
																select="format-number(Process.P_Resume/Resume/Resume.U_859C2192B958924649EEF5C32CD96B, '#,##0')" />
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of
																select="Process.P_Resume/Resume/Resume.U_859C2192B958924649EEF5C32CD96B" />
														</xsl:otherwise>
													</xsl:choose>
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>


							<fo:table table-layout="fixed" margin-top="5mm">
								<fo:table-body border-collapse="collapse">
									<fo:table-row margin-top="5mm">
										<fo:table-cell padding="0mm" display-align="center">
											<fo:block>
												<fo:inline>
													① 上記金額を㈱サンキョウテクノスタッフが全額支払うことについて説明を受けました。
												</fo:inline>
											</fo:block>
											<fo:block margin-top="2mm" color="#1E90FF" font-size="11pt">
												<fo:inline>
													①
												</fo:inline>
												<fo:inline font-family="Arial Narrow">
													Recebi a explicação de que o valor acima
													mencionado será pago integralmente pela Sankyo
													Techno Staff Co., Ltd.
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>


							<fo:table table-layout="fixed" border="1pt solid" margin-top="3mm"
								width="100%" border-collapse="collapse">
								<fo:table-column column-number="1" column-width="25%" />
								<fo:table-column column-number="2" column-width="75%" />
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell padding="2mm" display-align="center"
											border="0.25pt solid" background-color="#D3D3D3">
											<fo:block>
												<fo:inline padding="1mm">
													日付
												</fo:inline>
												<fo:inline color="#1E90FF" font-family="Arial Narrow">
													DATA
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="1mm" display-align="center">
											<fo:block>
												<fo:inline padding="1mm">
													<xsl:value-of
														select="concat(substring(/Process/System/CurrentDateTime,1,4),'年',number(substring(/Process/System/CurrentDateTime,6,2)),'月',number(substring(/Process/System/CurrentDateTime,9,2)),'日')" />
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>

							<fo:table table-layout="fixed" border="1pt solid" margin-top="6mm"
								width="100%" border-collapse="collapse">
								<fo:table-column column-number="1" column-width="25%" />
								<fo:table-column column-number="2" column-width="75%" />
								<fo:table-body>
									<fo:table-row border="1pt solid">
										<fo:table-cell padding="2mm" display-align="center"
											border="0.25pt solid" background-color="#D3D3D3">
											<fo:block>
												<fo:inline padding="1mm">
													社員ID
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="2mm" display-align="center">
											<fo:block>
												<fo:inline padding="1mm">
													<xsl:value-of
														select="Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.U_3D5FF80A5778B97D9A1691856E9BB6" />
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>

									<fo:table-row>
										<fo:table-cell padding="2mm" border="0.25pt solid"
											display-align="center" background-color="#D3D3D3">
											<fo:block>
												<fo:inline padding="1mm">
													氏名
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="2mm" border="0.25pt solid"
											display-align="center">
											<fo:block>
												<fo:inline padding="1mm">
													<xsl:value-of
														select="Process.P_Resume/Resume/Resume.U_FC72FCBA2CFD318880DB7CABF5C188" />
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>

									<fo:table-row>
										<fo:table-cell padding="2mm" border="0.25pt solid"
											display-align="center" background-color="#D3D3D3">
											<fo:block>
												<fo:inline padding="1mm" color="#1E90FF"
													font-family="Arial Narrow">
													NOME
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="2mm" border="0.25pt solid"
											display-align="center">
											<fo:block>
												<fo:inline padding="1mm" font-family="Arial Narrow">
													<xsl:value-of
														select="Process.P_Resume/Resume/Resume.U_B39F940CF5321D491A837364E3BC95" />
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>

									<fo:table-row border="1pt solid">
										<fo:table-cell padding="2mm" border="0.25pt solid"
											display-align="center" background-color="#D3D3D3">
											<fo:block>
												<fo:inline padding="1mm">
													生年月日
												</fo:inline>
											</fo:block>
											<fo:block>
												<fo:inline padding="1mm" color="#1E90FF"
													font-family="Arial Narrow">
													DATA DE NASCIMENTO
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="2mm" border="0.25pt solid"
											display-align="center">
											<fo:block>
												<fo:inline padding="1mm">
													<xsl:value-of
														select="Process.P_Resume/Resume/Resume.P_DateOfBirth" />
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>

									<fo:table-row border="1pt solid">
										<fo:table-cell padding="2mm" border="0.25pt solid"
											display-align="center" background-color="#D3D3D3">
											<fo:block>
												<fo:inline padding="1mm">
													同意署名
												</fo:inline>
											</fo:block>
											<fo:block>
												<fo:inline padding="1mm" color="#1E90FF"
													font-family="Arial Narrow">
													ASSINATURA DE CONSENTIMENTO
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell display-align="after">
											<fo:block text-align="center" display-align="after"
												start-indent="15%" end-indent="15%"
												border-bottom="dotted black">
												<fo:inline>&#xA0;</fo:inline>
											</fo:block>
											<fo:block text-align="center" font-size="12pt">
												<fo:inline>
													<xsl:value-of
														select="Process.P_Resume/Resume/Resume.U_B39F940CF5321D491A837364E3BC95" />
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</fo:block-container>
					</fo:flow>


				</fo:page-sequence>
			</xsl:for-each>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>