<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:datetime="http://exslt.org/dates-and-times">
	<xsl:template match="Sales">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">						<!--ページレイアウト定義-->
			<fo:layout-master-set>													<!--ページ余白設定-->
				<fo:simple-page-master margin-right="20mm" margin-left="20mm" margin-bottom="20mm" margin-top="15mm" page-height="297mm" page-width="210mm" master-name="A4">
					<fo:region-body margin="0mm" />
					<fo:region-before extent="0mm" />
					<fo:region-after extent="0mm" />
					<fo:region-start extent="0mm" />
					<fo:region-end extent="0mm" />
				</fo:simple-page-master>
			</fo:layout-master-set>													<!--ページ内容-->
			<xsl:for-each select="Item">
				<fo:page-sequence master-reference="A4" font-family="IPA Gothic,IPAGothic" font-size="9">
					<fo:flow flow-name="xsl-region-body">
						<fo:block>(株)サンキョウテクノスタッフ　殿</fo:block>
						<fo:block text-align="center" font-size="20">退職届</fo:block>

						<fo:table table-layout="fixed" width="100%" margin-top="5mm">	<!--テーブルを50/50に分ける-->
							<fo:table-column column-width="50%"/>
							<fo:table-column column-width="50%"/>
							<fo:table-body>
								<fo:table-row height="25mm">			<!--行の高さ(左列の下詰めをきかせるために高さを確保)-->
									

									<!--======左列(下詰め)======-->
									<fo:table-cell display-align="after" padding-bottom="5mm" margin-right="5mm">
										<fo:block line-height="1.0">氏　名: 								
											<xsl:value-of select="Sales.P_Candidate/Candidate/Person.P_Name"/>
										</fo:block>
										<fo:block space-after="2mm" padding-bottom="2mm">
											<fo:inline padding-left="10mm">				<!--アンダーライン--><!--セル内で文字列の移動はblockではなくinlineで-->
												<fo:leader leader-pattern="rule" rule-thickness="0.3pt" rule-style="solid" color="#AAAAAA" leader-length="70mm"/>
											</fo:inline>
										</fo:block>
										<fo:block line-height="1.0">社員ID: 
											<xsl:value-of select="Sales.P_Candidate/Candidate/Person.U_3D5FF80A5778B97D9A1691856E9BB6"/>
										</fo:block>
										<fo:block space-after="2mm" padding-bottom="2mm">
											<fo:inline padding-left="10mm">
												<fo:leader leader-pattern="rule" rule-thickness="0.3pt" rule-style="solid" color="#AAAAAA" leader-length="70mm"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>

									<!--======右列(普通)======-->
									<fo:table-cell>								
										<fo:block line-height="1.0" margin-top="1mm">
											配属先:
											<xsl:value-of select="Sales.P_Recruiter/Recruiter/Recruiter.P_Name"/>
										</fo:block>
										<fo:block line-height="0.5" space-after="4mm">
											<fo:inline padding-left="11mm">
												<fo:leader leader-pattern="rule" rule-thickness="0.3pt" rule-style="solid" color="#AAAAAA" leader-length="70mm"/>
											</fo:inline>
										</fo:block>

										<fo:block line-height="1.0" margin-top="1mm">
											営業所:
											<xsl:value-of select="Sales.U_E24206F2988334AED0290ED1FF45EB"/>
										</fo:block>
										<fo:block line-height="0.5" space-after="4mm">
											<fo:inline padding-left="11mm">
												<fo:leader leader-pattern="rule" rule-thickness="0.3pt" rule-style="solid" color="#AAAAAA" leader-length="70mm"/>
											</fo:inline>
										</fo:block>
										
										<fo:block line-height="1.0" margin-top="1mm">
											入社日:
											<xsl:value-of select="Sales.P_EnterDate"/>
										</fo:block>
										<fo:block line-height="0.5" space-after="4mm">
											<fo:inline padding-left="11mm">
												<fo:leader leader-pattern="rule" rule-thickness="0.3pt" rule-style="solid" color="#AAAAAA" leader-length="70mm"/>
											</fo:inline>
										</fo:block>

										<fo:block line-height="1.0" margin-top="1mm">
											退職日:
											<xsl:value-of select="Sales.U_90CA808C30AD58DEE52B4A47077483"/>
										</fo:block>
										<fo:block line-height="0.5" space-after="4mm">
											<fo:inline padding-left="11mm">
												<fo:leader leader-pattern="rule" rule-thickness="0.3pt" rule-style="solid" color="#AAAAAA" leader-length="70mm"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>

						<!--======退職理由枠のレイアウト(左側のみ使用)======-->
						<fo:table table-layout="fixed" width="100%" margin-top="5mm">
							<fo:table-column column-width="70%"/>
							<fo:table-column column-width="30%"/>
							<fo:table-body>
								<fo:table-row height="5mm">
									<fo:table-cell>
										<fo:block font-size="10pt" margin-bottom="6mm">【退職理由】</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row height="5mm">
									<fo:table-cell>
										<fo:block line-height="2.0">
											<xsl:choose>
												<xsl:when test="(Sales.U_7AF631628675ACFFCAAD3E6835081D = '労働者の都合による退職')">
													<fo:inline font-family="Segoe UI Symbol">☑</fo:inline >
												</xsl:when>
												<xsl:otherwise>
													<fo:inline font-family="Segoe UI Symbol">☐</fo:inline>
												</xsl:otherwise>
											</xsl:choose>
											労働者の都合による退職
										</fo:block>
										<fo:block line-height="2.0">
											<xsl:choose>
												<xsl:when test="(Sales.U_7AF631628675ACFFCAAD3E6835081D = '当初からの雇用契約期間の満了による退職')">
													<fo:inline font-family="Segoe UI Symbol">☑</fo:inline>
												</xsl:when>
												<xsl:otherwise>
													<fo:inline font-family="Segoe UI Symbol">☐</fo:inline>
												</xsl:otherwise>
											</xsl:choose>
											当初からの雇用契約期間の満了による退職
										</fo:block>
										<fo:block line-height="2.0">
											<xsl:choose>
												<xsl:when test="(Sales.U_7AF631628675ACFFCAAD3E6835081D = '有期雇用契約を更新しなかったための退職(労働者の意思による)')">
													<fo:inline font-family="Segoe UI Symbol">☑</fo:inline>
												</xsl:when>
												<xsl:otherwise>
													<fo:inline font-family="Segoe UI Symbol">☐</fo:inline>
												</xsl:otherwise>
											</xsl:choose>
											有期雇用契約を更新しなかったための退職(労働者の意思による)
										</fo:block>
										<fo:block line-height="2.0"> 
											<xsl:choose>
												<xsl:when test="(Sales.U_7AF631628675ACFFCAAD3E6835081D = '有期雇用契約を更新しなかったための退職(会社の意思による)')">
													<fo:inline font-family="Segoe UI Symbol">☑</fo:inline>
												</xsl:when>
												<xsl:otherwise>
													<fo:inline font-family="Segoe UI Symbol">☐</fo:inline>
												</xsl:otherwise>
											</xsl:choose>
											有期雇用契約を更新しなかったための退職(会社の意思による)
										</fo:block>
										<fo:block line-height="2.0">
											<xsl:choose>
												<xsl:when test="(Sales.U_7AF631628675ACFFCAAD3E6835081D = '会社からの退職勧奨に労働者が応じた合意退職')">
													<fo:inline font-family="Segoe UI Symbol">☑</fo:inline>
												</xsl:when>
												<xsl:otherwise>
													<fo:inline font-family="Segoe UI Symbol">☐</fo:inline>
												</xsl:otherwise>
											</xsl:choose>
											会社からの退職勧奨に労働者が応じた合意退職
										</fo:block>
										<fo:block line-height="2.0">
											<xsl:choose>
												<xsl:when test="(Sales.U_7AF631628675ACFFCAAD3E6835081D = '会社の都合による解雇')">
													<fo:inline font-family="Segoe UI Symbol">☑</fo:inline>
												</xsl:when>
												<xsl:otherwise>
													<fo:inline font-family="Segoe UI Symbol">☐</fo:inline>
												</xsl:otherwise>
											</xsl:choose>
											会社の都合による解雇
										</fo:block>
										<fo:block line-height="2.0">
											<xsl:choose>
												<xsl:when test="(Sales.U_7AF631628675ACFFCAAD3E6835081D = '労働者の責に帰すべき事由による解雇')">
													<fo:inline font-family="Segoe UI Symbol">☑</fo:inline>
												</xsl:when>
												<xsl:otherwise>
													<fo:inline font-family="Segoe UI Symbol">☐</fo:inline>
												</xsl:otherwise>
											</xsl:choose>
											労働者の責に帰すべき事由による解雇
										</fo:block>
										<fo:block margin-top="2mm" margin-left="2mm">
											＊離職票が必要な場合は、更に詳細について裏面に記入すること。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>



						
						<fo:table table-layout="fixed" margin-top="6mm">
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block>〔 寮 〕</fo:block>
										<fo:block line-height="1.0" margin-top="6mm">
											　寮名:
											<xsl:choose>
												<xsl:when test="(Sales.U_6B60BE32C518D198E59655CF81793D = '寮')">
													<fo:inline padding-left="7mm">
														<xsl:value-of select="Sales.U_A6F2AF68362CFCBC3833090D205198"/>
													</fo:inline>
												</xsl:when>
												<xsl:otherwise>
													<fo:inline></fo:inline>
												</xsl:otherwise>
											</xsl:choose>
										</fo:block> 


										<fo:block line-height="0.5">
											<fo:inline padding-left="16mm">
												<fo:leader leader-pattern="rule" rule-thickness="0.3pt" rule-style="solid" color="#AAAAAA" leader-length="130mm"/>
											</fo:inline>
										</fo:block>

										<fo:block line-height="1.0" margin-top="2mm">
											退寮日:
											<xsl:choose>
											<xsl:when test="(Sales.U_6B60BE32C518D198E59655CF81793D = '寮')">  <!--自宅・寮-->
												<fo:inline padding-left="4mm">
													<xsl:value-of select="Sales.U_FE59DB7A623F5A6EBC9FC1E51B6E38"/> 
												</fo:inline>
											</xsl:when>
											<xsl:otherwise>
												<fo:inline></fo:inline>
											</xsl:otherwise>
											</xsl:choose>
										</fo:block>


										<fo:block line-height="0.5">
											<fo:inline padding-left="16mm">
												<fo:leader leader-pattern="rule" rule-thickness="0.3pt" rule-style="solid" color="#AAAAAA" leader-length="60mm"/>
											</fo:inline>
										</fo:block>

										<fo:block line-height="1.0" margin-top="3mm">
											<fo:inline>
											私は退寮時に寮の鍵、その他会社からの貸与品はすべて責任を持って返却致します。
											</fo:inline>
										</fo:block>
									
										<fo:block margin-top="5mm">〔 自宅 〕
											<fo:inline font-size="8pt">
											(雇用保険に必要)
											</fo:inline>
										</fo:block>
										

										<fo:block line-height="1.0" margin-top="5mm">
										　　住所:
											<xsl:choose>
												<xsl:when test="(Sales.U_6B60BE32C518D198E59655CF81793D = '自宅')">
													<fo:inline padding-left="4mm">
														<xsl:value-of select="Sales.U_A6F2AF68362CFCBC3833090D205198"/>
													</fo:inline>
												</xsl:when>
												<xsl:when test="(Sales.U_6B60BE32C518D198E59655CF81793D = '寮')">
													<fo:inline></fo:inline>
												</xsl:when>
												<xsl:otherwise>	
													<fo:inline padding-left="4mm">
														<xsl:value-of select="Sales.U_A6F2AF68362CFCBC3833090D205198"/>
													</fo:inline>
												</xsl:otherwise>
											</xsl:choose>									
											
										</fo:block>
										<fo:block line-height="0.5">
											<fo:inline padding-left="16mm">
												<fo:leader leader-pattern="rule" rule-thickness="0.3pt" rule-style="solid" color="#AAAAAA" leader-length="130mm"/>
											</fo:inline>
										</fo:block>
										<fo:block line-height="1.0" margin-top="3mm">
										電話番号:
											<fo:inline padding-left="4mm">
												<xsl:value-of select="Sales.P_Candidate/Candidate/Person.P_Mobile"/>
											</fo:inline>
										</fo:block>
										<fo:block line-height="0.5">
											<fo:inline padding-left="16mm" margin-top="2mm">  
												<fo:leader leader-pattern="rule" rule-thickness="0.3pt" rule-style="solid" color="#AAAAAA" leader-length="130mm"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>


					
						<fo:table table-layout="fixed" width="100%" margin-top="12mm"> 
							<fo:table-column column-width="50%"/>
							<fo:table-column column-width="50%"/>
							<fo:table-body>
								<fo:table-row height="25mm">

									<fo:table-cell><!--=====左50%=====-->
										<fo:block>
											<fo:inline font-family="Segoe UI Symbol">☐ </fo:inline>
											<fo:inline> 退社に関して適切な説明を受けました</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell><!--======右50%======-->
										<fo:block margin-top="10mm" line-height="1.0"> 
											<fo:inline>日付:　　　　　＿＿＿＿＿＿年＿＿＿＿月＿＿＿＿日</fo:inline>
										</fo:block>
										<fo:block line-height="20mm">
											<fo:inline>署名:
												<fo:leader leader-pattern="rule" rule-thickness="0.3pt" rule-style="solid" color="#AAAAAA" leader-length="70mm"/>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>


						<fo:table table-layout="fixed" width="100%" margin-top="6mm">
							<fo:table-body>
								<fo:table-row height="30mm">
									<fo:table-cell>
										<fo:block line-height="2.0">
										離職票　　　
											<xsl:choose>				
												<xsl:when test="(Sales.U_335C4644A9555814DA6FAB09F491A3 = '必要')">  
													<fo:inline font-family="Segoe UI Symbol">☑</fo:inline><fo:inline> 要　　　</fo:inline><fo:inline font-family="Segoe UI Symbol">☐</fo:inline><fo:inline>不要</fo:inline>
												</xsl:when>
												<xsl:when test="(Sales.U_335C4644A9555814DA6FAB09F491A3 = '不要')">
													<fo:inline font-family="Segoe UI Symbol">☐</fo:inline><fo:inline> 要　　　</fo:inline><fo:inline font-family="Segoe UI Symbol">☑</fo:inline><fo:inline>不要</fo:inline>
												</xsl:when>
												<xsl:otherwise>
													<fo:inline font-family="Segoe UI Symbol">☐</fo:inline><fo:inline> 要　　　</fo:inline><fo:inline font-family="Segoe UI Symbol">☐</fo:inline><fo:inline>不要</fo:inline>
												</xsl:otherwise>
											</xsl:choose>
										</fo:block>
										<fo:block line-height="2.0">
										社保未加入　
											<xsl:choose>
												<xsl:when test="(Sales.U_D661D8F77805484E905F009226CE2D = 'あり')">
													<fo:inline font-family="Segoe UI Symbol">☑</fo:inline>
												</xsl:when>
												<xsl:otherwise>
													<fo:inline font-family="Segoe UI Symbol">☐</fo:inline>
												</xsl:otherwise>
											</xsl:choose>
										</fo:block>	
										<fo:block line-height="2.0">
										社保カード　
											<xsl:choose>
												<xsl:when test="(Sales.U_0D4F7BFFBAABBC65E5F8244D072C38 = '済')">
													<fo:inline font-family="Segoe UI Symbol">☑</fo:inline><fo:inline>回収　</fo:inline><fo:inline font-family="Segoe UI Symbol">　　　☐</fo:inline><fo:inline>未回収</fo:inline>
												</xsl:when>
												<xsl:when test="(Sales.U_0D4F7BFFBAABBC65E5F8244D072C38 = '未')">
													<fo:inline font-family="Segoe UI Symbol">☐</fo:inline><fo:inline>回収　</fo:inline><fo:inline font-family="Segoe UI Symbol">　　　☑</fo:inline><fo:inline>未回収</fo:inline>	
												</xsl:when>
												<xsl:otherwise>
													<fo:inline font-family="Segoe UI Symbol">☐</fo:inline><fo:inline>回収　</fo:inline><fo:inline font-family="Segoe UI Symbol">　　　☐</fo:inline><fo:inline>未回収</fo:inline>
												</xsl:otherwise>				
											</xsl:choose>				
										</fo:block>
										<fo:block break-after="page"/>		<!--======改ページ======-->

												<!--======（１）======-->

										<fo:block space-after="3mm">【退職（離職）理由】小分類</fo:block>
										<fo:block>（１）事業所の倒産によるもの</fo:block>
										<fo:block margin-left="3mm">
											<fo:inline>□倒産手続き開始、手形取引停止による離職</fo:inline>
										</fo:block>
										<fo:block margin-left="3mm" space-after="3mm">
											<fo:inline>□事業所の廃止又は事業活動停止後事業再開の見込みがないため離職</fo:inline>
										</fo:block>

												<!--======（２）======-->

										<fo:block>（２）定年によるもの</fo:block>
										<fo:block margin-left="3mm">
											<fo:inline>□定年による離職（定年は歳）</fo:inline>
										</fo:block>

										<fo:block margin-left="3mm">
											<fo:inline>□定年後の継続雇用を希望していなかった</fo:inline>
										</fo:block>

										<fo:block margin-left="3mm">
											<fo:inline>□定年後の継続雇用を希望していたが</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>□就業規則に定める解雇事由又は退職事由に該当したための離職</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm" space-after="3mm">
											<fo:inline>□その他（具体的理由：　　　　　　　　　　　　　　　　　　　　　　　　　　　）</fo:inline>
										</fo:block>

												<!--======（３）======-->	

										<fo:block>（３）労働契約期間満了によるもの</fo:block>
										<fo:block margin-left="3mm">
											<fo:inline>□採用又は定年後の再雇用時等にあらかじめ定められた雇用期限到来による離職</fo:inline>
										</fo:block>

										<fo:block margin-left="3mm">
											<fo:inline>□労働契約期間満了による離職</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>□派遣労働者以外の労働者の場合は</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・１回の契約期間は（　　　）ヶ月</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・通算の契約期間は（　　　）ヶ月</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・通算の更新回数は（　　　）回</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・契約を更新又は延長することの確約・合意が□有った□無かった</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・契約を更新又は延長しない旨の明示が□有った□無かった</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・直前の契約更新時に雇止め通知が□有った□無かった</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・労働者からの契約の更新又は延長について□希望の申出有り□希望しない申出有り□申出無し</fo:inline>
										</fo:block>



										<fo:block margin-left="6mm">
											<fo:inline>□派遣労働者のうち常時雇用されてる労働者以外の者</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・１回の契約期間は（　　　）ヶ月</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・通算の契約期間は（　　　）ヶ月</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・通算の更新回数は（　　　）回</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・契約を更新又は延長することの確約・合意が□有った□無かった</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・契約を更新又は延長しない旨の明示が□有った□無かった</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・直前の契約更新時に雇止め通知が□有った□無かった</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>・労働者からの契約の更新又は延長について□希望の申出有り□希望しない申し出有り□申出無し</fo:inline>
										</fo:block>

										<fo:block margin-left="8mm">
											<fo:inline>□労働者が適用基準に該当する派遣就業の指示を拒否したことによる場合</fo:inline>
										</fo:block>

										<fo:block margin-left="10mm">
											<fo:inline>⇒更に下記（５）の中で該当する理由を選択、（５）に無い場合は（６）に具体的に記載</fo:inline>
										</fo:block>

										<fo:block margin-left="8mm">
											<fo:inline>□事業主が適用基準に該当する派遣就業の指示をしなかったことによる場合（取りやめ含む）</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>□早期退職優待制度、選択定年制度等により離職</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm" space-after="3mm">
											<fo:inline>□移籍出向</fo:inline>
										</fo:block>

										<!--======（４）======-->	

										<fo:block>（４）事業主からの働きかけによるもの</fo:block>
										<fo:block margin-left="3mm">
											<fo:inline>□解雇（重責解雇を除く）</fo:inline>
										</fo:block>

										<fo:block margin-left="3mm">
											<fo:inline>□重責解雇（労働者の責に帰すべき重大な理由による解雇）</fo:inline>
										</fo:block>
										
										<fo:block margin-left="3mm">
											<fo:inline>□希望退職の募集又は退職勧奨</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>□事業の縮小又は一部休廃止に伴う人員整理を行うためのもの</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm" space-after="3mm">
											<fo:inline>□その他（具体的理由：　　　　　　　　　　　　　　　　　　　　　　　　　　　）</fo:inline>
										</fo:block>

										<!--======（５）======-->	
										<fo:block>（５）労働者の判断によるもの</fo:block>
										<fo:block margin-left="3mm">
											<fo:inline>□職場における事情による離職</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>□労働条件に係る重大な問題ありと判定（賃金低下、賃金遅配、長時間労働、採用条件との違い等）</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>□就業環境に係る重大な問題ありと判定（故意の俳斥、嫌がらせ、パワハラ、セクハラ等）</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>□事業所での大規模な人員整理があったことを考慮した離職</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>□職種転換等に適応することが困難であったため□教育訓練は有った□教育訓練は無かった</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm">
											<fo:inline>□事業所移転により通勤困難となる、なったため（新旧所在地：　　　　　　　　　　　　　　　　）</fo:inline>
										</fo:block>

										<fo:block margin-left="6mm" space-after="3mm">
											<fo:inline>□その他（具体的理由：　　　　　　　　　　　　　　　　　　　　　　　　　　　）</fo:inline>
										</fo:block>


										<!--======（６）======-->	
										<fo:block>（６）その他（上記のいずれにも該当しない）</fo:block>

										<fo:block margin-left="6mm" space-after="3mm">
											<fo:inline>具体的理由（：　　　　　　　　　　　　　　　　　　　　　　　　　　　　　）</fo:inline>
										</fo:block>

										<fo:block>
											<fo:inline>【業主が把握している離職に至った具体的事情を記載する】</fo:inline>
										</fo:block>

										<fo:block>
											<fo:inline>（　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　）</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:flow>
				</fo:page-sequence>	
			</xsl:for-each>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>	