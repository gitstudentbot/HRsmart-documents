	<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:datetime="http://exslt.org/dates-and-times">

  <!--期間を計算するテンプレート-->
	<xsl:template name="calc-duration">
		<xsl:param name="start-date"/>  <!-- 入社年月（例：2022/03/01） -->
		<xsl:param name="end-date"/>    <!-- 退社年月（例：2025/07/01） -->
		<xsl:param name="type"/>        <!-- "years" or "months" -->

		<xsl:choose>
			<!-- 入社年月 or 退社年月が空なら 0 を返す -->
			<xsl:when test="$start-date = '' or $end-date = ''">
				<xsl:value-of select="''"/>
			</xsl:when>

			<xsl:otherwise>
				<!-- 年・月を抽出 -->
				<xsl:variable name="start-year"  select="number(substring($start-date, 1, 4))"/>
				<xsl:variable name="start-month" select="number(substring($start-date, 6, 2))"/>
				<xsl:variable name="end-year"    select="number(substring($end-date, 1, 4))"/>
				<xsl:variable name="end-month"   select="number(substring($end-date, 6, 2))"/>

				<!-- 総月数を算出 -->
				<xsl:variable name="total-months"
					select="($end-year - $start-year) * 12 + ($end-month - $start-month)"/>

				<!-- 年と月に分解 -->
				<xsl:variable name="years"  select="floor($total-months div 12)"/>
				<xsl:variable name="months" select="$total-months mod 12"/>

				<!-- type に応じて返却 -->
				<xsl:choose>
					<xsl:when test="$type = 'years'">
						<xsl:value-of select="$years"/>
					</xsl:when>
					<xsl:when test="$type = 'months'">
						<xsl:value-of select="$months"/>
					</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

  <xsl:template match="Process">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master margin-right="10mm" margin-left="10mm" margin-bottom="5mm" margin-top="5mm" page-height="297mm" page-width="210mm" master-name="A4">
          <fo:region-body margin-top="13mm" />
          <fo:region-before extent="40mm" /> <!-- ヘッダ領域を確保 -->
          <fo:region-after extent="15mm" />
          <fo:region-start extent="0mm" />
          <fo:region-end extent="0mm" />
        </fo:simple-page-master>
      </fo:layout-master-set>


	  <!--===年齢を計算するためのテンプレート(日付の設定)※日付だけは全レコード共通のため for-eachの外側でOK===-->
		<xsl:variable name="raw-datetime" select="string(/Process/System/CurrentDateTime)"/>	<!--XML側のCurrentDateTimeがItem枠の外側に存在していて、さらにXSLで [for each select=Item]の外側にあるため、絶対パス(//や/で始める)を使う必要がある。(※)CurrentDateTimeを使う際は、XSLにてItem枠の内側で使っても、XMLではItem枠の外側(Process/System/枠の中)に存在するため今後も絶対パスで参照が必要-->
		<xsl:variable name="today" select="substring($raw-datetime, 1, 10)"/>					<!--このテンプレートはItemの中に入っていないため、相対パス(Process.P_Resume/Resume/Resume.P_DateOfBirth)だとResume.P_DateOfBrithにたどり着けない。そのため絶対パス(//や/で始める)を使う必要がある-->
		<xsl:variable name="t-year"  select="number(substring($today, 1, 4))"/>
		<xsl:variable name="t-month" select="number(substring($today, 6, 2))"/>
		<xsl:variable name="t-day"   select="number(substring($today, 9, 2))"/>


		<!--Item内をレコードごとにループ-->
      <xsl:for-each select="Item">	
		<!--===年齢を計算するためのテンプレート(年齢の計算)※ここからレコードごとに異なるため、for-eachループ内に入れる===-->
		<xsl:variable name="raw-birthday" select="string(.//Resume.P_DateOfBirth)"/>
		<xsl:variable name="b-year"  select="number(substring($raw-birthday, 1, 4))"/>
		<xsl:variable name="b-month" select="number(substring($raw-birthday, 6, 2))"/>
		<xsl:variable name="b-day"   select="number(substring($raw-birthday, 9, 2))"/>

		<xsl:variable name="age">
		<xsl:choose>
			<xsl:when test="($t-month &gt; $b-month) or ($t-month = $b-month and $t-day &gt;= $b-day)">
			<xsl:value-of select="$t-year - $b-year"/>
			</xsl:when>
			<xsl:otherwise>
			<xsl:value-of select="$t-year - $b-year - 1"/>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>

		<!--本文内容-->
        <fo:page-sequence master-reference="A4" font-family="IPA Gothic,IPAGothic" font-size="9">
          <!-- ヘッダ（題名）: static-content + flow-name="xsl-region-before" -->
          <fo:static-content flow-name="xsl-region-before">
            <fo:block text-align="center" font-size="22pt" padding-top="17mm">求 職 申 込 書</fo:block>

			<fo:block-container absolute-position="absolute" margin-top="10mm">
			<fo:block text-align="right" margin-right="1mm">
			<fo:external-graphic src="logo.png" content-height="scale-down-to-fit"
			content-width="scale-down-to-fit" height="20mm" width="50mm" />
			</fo:block>
			</fo:block-container>

			<fo:block text-align="right" display-align="after" font-size="8pt" padding-top="2mm">
			面接日時:
				<xsl:value-of select="Process.P_Resume/Resume/Resume.U_67BD8DF3611BC5B4C0057CA614BF1A"/>
			</fo:block>
          </fo:static-content>

		  <!-- 出力(現在日時)日時↑互換<fo:block text-align="right" display-align="after" font-size="8pt" padding-top="5mm">  
				<xsl:value-of select="concat(substring(/Process/System/CurrentDateTime,1,4),'年',number(substring(/Process/System/CurrentDateTime,6,2)),'月',number(substring(/Process/System/CurrentDateTime,9,2)),'日')"/>
			</fo:block>-->

          <!--本文 flow (body) -->
          <fo:flow flow-name="xsl-region-body">
            <fo:table table-layout="fixed" margin-top="20mm" border="0.8pt solid">
				<fo:table-column column-number="1" column-width="30mm"/>
				<fo:table-column column-number="2" column-width="95mm"/>
				<fo:table-column column-number="3" column-width="25mm"/>
				<fo:table-column column-number="4" column-width="40mm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell padding="1mm" border-bottom="0.25pt solid #000000" border="0.8pt solid">
							<fo:block>
								<fo:block text-align="center" font-size="7pt">フリガナ</fo:block>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1mm" border-bottom="0.25pt solid #000000" border="0.8pt solid">
							<fo:block text-align="center" font-size="7pt">
								<xsl:value-of select="Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.P_Reading"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-rows-spanned="2" border="0.8pt solid" display-align="center">
							<fo:block text-align="center">性別</fo:block>
						</fo:table-cell>
						<fo:table-cell number-rows-spanned="2" border="0.8pt solid" display-align="center">
							<fo:block text-align="center">
								<xsl:value-of select="Process.P_Resume/Resume/Resume.P_Gender"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>

					<fo:table-row line-height="12mm">
						<fo:table-cell border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center">
							<fo:block text-align="center" line-height="4mm">氏　　名</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="center" line-height="4mm" padding="4mm" font-size="14pt">
								<xsl:value-of select="Process.P_Resume/Resume/Resume.P_Name"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>


					<fo:table-row line-height="12mm">
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block text-align="center">生　年　月　日</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block text-align="center">
								<xsl:value-of select="Process.P_Resume/Resume/Resume.P_DateOfBirth"/>
								<fo:inline>　　</fo:inline>
								<xsl:value-of select="$age"/>
								<xsl:text>歳</xsl:text>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block text-align="center">求職有効期間</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block text-align="center">
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_CFAF1955629520BAE7108AF15929B7"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>



					<fo:table-row line-height="12mm">
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block text-align="center">住　　所</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" number-columns-spanned="3" padding-left="4mm" display-align="center">
							<fo:block line-height="12pt">
								〒<xsl:value-of select="Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.P_Zipcode"/>
								<fo:inline padding-left="5mm">
									<xsl:variable name="pref" select="normalize-space(Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.U_6E906CC3D68B8B4F24A2BA8C5398E7)"/>
									<xsl:variable name="addr" select="normalize-space(Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.P_Street)"/>

									<xsl:choose>
									<xsl:when test="string-length($pref) &gt; 0 and substring($addr, 1, string-length($pref)) = $pref">
										<xsl:value-of select="$pref"/>
										<xsl:value-of select="substring($addr, string-length($pref) + 1)"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($pref, $addr)"/>
									</xsl:otherwise>
									</xsl:choose>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>


			<fo:table table-layout="fixed" border="0.8pt solid">
				<fo:table-column column-number="1" column-width="30mm"/>
				<fo:table-column column-number="2" column-width="38mm"/>
				<fo:table-column column-number="3" column-width="38mm"/>
				<fo:table-column column-number="4" column-width="84mm"/>
				<fo:table-body>
					<fo:table-row line-height="10mm">
						<fo:table-cell border="0.8pt solid" display-align="center">	
							<fo:block padding="1mm" text-align="center">電　話　番　号</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">						
							<fo:block padding="1mm">
								<fo:inline text-align="left" padding="1mm">携帯　</fo:inline>
								<fo:inline text-align="center">
									<xsl:value-of select="Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.P_Mobile"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block padding="1mm">
								<fo:inline text-align="left" padding="1mm">自宅　</fo:inline>
								<fo:inline text-align="center">
									<xsl:value-of select="Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.P_Telephone"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>					
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block line-height="12pt">
								<fo:inline text-align="left" padding="1mm">Eメール</fo:inline><!--メール長い人がいるため、paddingをギリギリまで短くしてる-->
								<fo:inline text-align="center">
									<xsl:value-of select="Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.P_Mail"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell> 
					</fo:table-row>

					<fo:table-row line-height="10mm">
						<fo:table-cell border="0.8pt solid">
							<fo:block padding="1mm" text-align="center">最　終　学　歴</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" number-columns-spanned="3" padding-left="9mm">
							<fo:block padding="1mm" text-align="left">
								<fo:inline>
									<xsl:value-of select="/Process//Resume.U_81E2DC751CAEE6D048EA4DC80B9027"/>
								</fo:inline>
								<fo:inline padding="1mm">
									<xsl:value-of select="/Process//Resume.U_E182D9B71AE22AD4FF1D0A01DE456F"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>


			<fo:table table-layout="fixed" border="0.8pt solid">
				<fo:table-column column-width="30mm"/>
				<fo:table-column column-width="38mm"/>
				<fo:table-column column-width="72mm"/>
				<fo:table-column column-width="50mm"/>
							<!--職歴1行目-->
				<fo:table-body>
					<fo:table-row line-height="6mm">
						<fo:table-cell border="0.8pt solid" number-rows-spanned="6" display-align="center" padding="1mm">
							<fo:block text-align="center">職　　歴</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center" padding="1mm">
							<fo:block text-align="center">会　社　名</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center" padding="1mm">
							<fo:block text-align="center">職　務　の　内　容</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center" padding="1mm">
							<fo:block text-align="center">期　　　　間</fo:block>
						</fo:table-cell>
					</fo:table-row>
					
					<fo:table-row line-height="6mm">
						<fo:table-cell border-bottom="0.25pt solid #000000" border="0.8pt solid" display-align="center">	<!--会社名１-->
							<fo:block text-align="center" line-height="12pt"> 
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_2E209032B2B047F642F4CC2A12A368"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom="0.25pt solid #000000" border="0.8pt solid" display-align="center" padding="1mm"> <!--職務内容１-->
							<fo:block line-height="10pt">
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_6B970DDC273307DB66EEA0CC788429"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom="0.25pt solid #000000" border="0.8pt solid" display-align="center" padding="1mm">	<!--期間1-->
							<fo:block text-align="center">
								<!-- 年 -->
								<fo:inline>
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_83AAC80A1F3CCDFEDAF178CFB73F51"/>
								</fo:inline>
								<xsl:text>年　　</xsl:text>
								<!-- ヶ月 -->
								<fo:inline>
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_829A1FCB0120F1F9A9AD65642C4C0D"/>
								</fo:inline>
								<xsl:text>ヶ月</xsl:text>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>

								<!--2行目-->
					<fo:table-row line-height="6mm">
						<fo:table-cell border-bottom="0.25pt solid #000000" border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center">	<!--会社名2-->
							<fo:block text-align="center" line-height="12pt"> 
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_22AD9FBF1EB3BABA9DBEE859B911CB"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom="0.25pt solid #000000" border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center" padding="1mm"> <!--職務内容2-->
							<fo:block line-height="10pt">
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_7E98BB8C7D15B798D644449AC94FE1"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom="0.25pt solid #000000" border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center" padding="1mm">	<!--期間2-->
							<fo:block text-align="center">
								<!-- 年 -->
								<fo:inline>
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_432BD89130BD48FFE74A49891FB813"/>
								</fo:inline>
								<xsl:text>年　　</xsl:text>
								<!-- ヶ月 -->
								<fo:inline>
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_16B6EEEE29437CB14DF5EE7614F89F"/>
								</fo:inline>
								<xsl:text>ヶ月</xsl:text>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>


								<!--3行目-->
					<fo:table-row line-height="6mm">
						<fo:table-cell border-bottom="0.25pt solid #000000" border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center">	<!--会社名3-->
							<fo:block text-align="center" line-height="12pt"> 
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_C8670E3E88E01CC14C042D81DBF1C3"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom="0.25pt solid #000000" border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center" padding="1mm"> <!--職務内容3-->
							<fo:block  line-height="10pt">
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_28F5185C29A8B4B8A0ACD3B3FEFEDF"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom="0.25pt solid #000000" border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center" padding="1mm">	<!--期間3-->
							<fo:block text-align="center">
								<!-- 年 -->
								<fo:inline>
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_103AA4E3D3C4813E65913D3E42EFC1"/>
								</fo:inline>
								<xsl:text>年　　</xsl:text>
								<!-- ヶ月 -->
								<fo:inline>
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_84A3D98DD4838660BA2EA2C3FBF9FE"/>
								</fo:inline>
								<xsl:text>ヶ月</xsl:text>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					

								<!--4行目-->
					<fo:table-row line-height="6mm">
						<fo:table-cell border-bottom="0.25pt solid #000000" border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center">	<!--会社名4-->
							<fo:block text-align="center" line-height="12pt"> 
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_DB05D1231332338C29AFE5F4CD7A60"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom="0.25pt solid #000000" border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center" padding="1mm"> <!--職務内容4-->
							<fo:block line-height="10pt">
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_97350A0572F48B0E8D3E645E36058D"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom="0.25pt solid #000000" border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center" padding="1mm">	<!--期間4-->
							<fo:block text-align="center">
								<!-- 年 -->
								<fo:inline>
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_280337E197B2EC8EF7567688A9FE1A"/>
								</fo:inline>
								<xsl:text>年　　</xsl:text>
								
								<!-- ヶ月 -->
								<fo:inline>
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_44B2E2AD7B4294F034A28BCEA46B6A"/>
								</fo:inline>
								<xsl:text>ヶ月</xsl:text>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					


								<!--5行目-->
					<fo:table-row line-height="6mm">
						<fo:table-cell border-bottom="0.25pt solid #000000" border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center">	<!--会社名5-->
							<fo:block text-align="center" line-height="12pt"> 
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_C6B2C7F7640383169055B727E60002"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom="0.25pt solid #000000" border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center" padding="1mm"> <!--職務内容5-->
							<fo:block line-height="10pt">
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_003098C96B9821EB7A54101830A61E"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom="0.25pt solid #000000" border-top="0.25pt solid #000000" border="0.8pt solid" display-align="center" padding="1mm">	<!--期間5-->
							<fo:block text-align="center">
								<!-- 年 -->
								<fo:inline>
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_659915D41C9D6C64510CA204E89E66"/>
								</fo:inline>
								<xsl:text>年　　</xsl:text>
								<!-- ヶ月 -->
								<fo:inline>
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_EDB8BA1A1834BC7958A354EAB37CE9"/>
								</fo:inline>
								<xsl:text>ヶ月</xsl:text>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>


								<!--保有資格・免許-->
			
			<xsl:variable name="items" select="Process.P_Resume/Resume/Resume.U_2B6FB5BA7986FB12329B2A0887C7AF/*"/>
			<fo:table table-layout="fixed">
				<fo:table-column column-number="1" column-width="30mm"/>
				<fo:table-column column-number="2" column-width="160mm"/>
				
				<fo:table-body>
					<fo:table-row line-height="7mm">	<!--1行目-->
						<fo:table-cell border="0.8pt solid" display-align="center" number-rows-spanned="3">	
							<fo:block text-align="center">資格・免許</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center" padding-left="2mm">
							<fo:block>
								<fo:inline padding="1mm">
									<xsl:choose>
										<xsl:when test="Process.P_Resume/Resume/Resume.U_14DAB0E13372EAFBA4DE002700E307 !=''">				<!--運転免許-->
											普通自動車免許
											<xsl:value-of select="Process.P_Resume/Resume/Resume.U_14DAB0E13372EAFBA4DE002700E307"/>
										</xsl:when>
										<xsl:otherwise>&#xA0;</xsl:otherwise>
									</xsl:choose>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>

					<fo:table-row line-height="7mm">
						<fo:table-cell border="0.8pt solid" display-align="center" padding-left="2mm" height="7mm">							
							<fo:block line-height="12pt">
								<fo:inline padding="1mm">
									<xsl:choose>
										<xsl:when test="$items">
											<xsl:for-each select="$items">															<!--保有資格-->
												<xsl:if test="position() &gt; 1">, </xsl:if>
												<xsl:value-of select="."/>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>&#xA0;</xsl:otherwise>
									</xsl:choose>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>	
					
					<fo:table-row line-height="7mm">
						<fo:table-cell border="0.8pt solid" display-align="center" padding-left="2mm">
							<fo:block text-align="left">
								<fo:inline padding="1mm">
									<xsl:choose>
										<xsl:when test="Process.P_Resume/Resume/Resume.U_98196497A1D0746BCB2BAE17051EBC !=''">				<!--その他資格-->
											<xsl:value-of select="Process.P_Resume/Resume/Resume.U_98196497A1D0746BCB2BAE17051EBC"/>
										</xsl:when>
										<xsl:otherwise>&#xA0;</xsl:otherwise>							
									</xsl:choose>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>

						<!--希望条件-->
			<fo:table table-layout="fixed" border="0.8pt solid">
				<fo:table-column column-number="1" column-width="15mm"/>
				<fo:table-column column-number="2" column-width="15mm"/>
				<fo:table-column column-number="3" column-width="53.3mm"/>
				<fo:table-column column-number="4" column-width="53.3mm"/>
				<fo:table-column column-number="5" column-width="53.4mm"/>
				<fo:table-column column-number="6" column-width="0mm"/>
				<fo:table-body>

					<fo:table-row line-height="7mm" border="0.8pt solid">
						<fo:table-cell border="0.8pt solid" display-align="center" number-rows-spanned="6">
							<fo:block text-align="center">　希　　望　　条　　件　</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block text-align="center">勤 務 地</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block>
								<fo:inline padding="2mm">①</fo:inline>
								<fo:inline text-align="center">
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_56CDCAD6D73297AEA97D5E6F604476"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block>
								<fo:inline padding="2mm">②</fo:inline>
								<fo:inline text-align="center">
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_BDD7F40B61133F3A4A702FA6DC82C3"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block>
								<fo:inline padding="2mm">③</fo:inline>
								<fo:inline text-align="center">
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_F48AAC9919FD02402ABC0DD100B704"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>

					<fo:table-row line-height="7mm" >
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block text-align="center">職　種</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block>
								<fo:inline padding="2mm">①</fo:inline>
								<fo:inline text-align="center">
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_BFF65096425C3B63411C21D5DC01B6"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block>
								<fo:inline padding="2mm">②</fo:inline>
								<fo:inline text-align="center">
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_A0A9981517575BD8E14BE75FD0F3B6"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block>
								<fo:inline padding="2mm">③</fo:inline>
								<fo:inline text-align="center">
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_CFD86758BD21F41DDCDD8E7AE058F6"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>

					<fo:table-row line-height="7mm">
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block text-align="center">賃　金</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="4" border-bottom="0.8pt solid" padding-left="2mm">
							<fo:block>
								<fo:inline padding="1mm">
								時給:
									<xsl:choose>
										<xsl:when test="Process.P_Resume/Resume/Resume.P_DesiredHourlyRate !='' and Process.P_Resume/Resume/Resume.P_DesiredHourlyRate !='0'">
											<xsl:value-of select="Process.P_Resume/Resume/Resume.P_DesiredHourlyRate"/>円
										</xsl:when>
										<xsl:otherwise>&#xA0;</xsl:otherwise>
									</xsl:choose>
									
								</fo:inline>
							</fo:block>
						</fo:table-cell>

					</fo:table-row>

					<xsl:variable name="conditions" select="Process.P_Resume/Resume/Resume.U_983962A6A037FEC379CEBECF159741/*"/>
					<fo:table-row line-height="7mm">
						<fo:table-cell border="0.8pt solid" display-align="center">
							<fo:block text-align="center">勤務時間</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="4" border-bottom="0.8pt solid" padding-left="2mm">
							<fo:block>
								<fo:inline padding="1mm">
								
									<xsl:choose>
										<xsl:when test="$conditions">
											<xsl:for-each select="$conditions">															
												<xsl:if test="position() &gt; 1">, </xsl:if>
												<xsl:value-of select="."/>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>&#xA0;</xsl:otherwise>
									</xsl:choose>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>

					<xsl:variable name="holidays" select="Process.P_Resume/Resume/Resume.U_58CABC7C23AC9DA484F90A2C484BF4/*"/>
					<fo:table-row line-height="7mm">
						<fo:table-cell border="0.8pt solid" display-align="center" number-rows-spanned="2">
							<fo:block text-align="center">休　日</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="4" padding-left="2mm">
							<fo:block>
								<fo:inline padding="1mm">
									
									<xsl:choose>
										<xsl:when test="$holidays">
											<xsl:for-each select="$holidays">										
												<xsl:if test="position() &gt; 1">, </xsl:if>
												<xsl:value-of select="."/>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>&#xA0;</xsl:otherwise>
									</xsl:choose>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row line-height="7mm">
						<fo:table-cell number-columns-spanned="4" padding-left="2mm" border="0.8pt solid">
							<fo:block>
								<fo:inline padding="1mm">
								その他希望休日曜日:
									<xsl:choose>
										<xsl:when test="Process.P_Resume/Resume/Resume.U_E2776653C1F7E854556FA91B93C0CC !=''">
											<xsl:value-of select="Process.P_Resume/Resume/Resume.U_E2776653C1F7E854556FA91B93C0CC"/>
										</xsl:when>
										<xsl:otherwise>&#xA0;</xsl:otherwise>
									</xsl:choose>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>



				</fo:table-body>
			</fo:table>

			
			<fo:table table-layout="fixed" border="0.8pt solid">
				<fo:table-column column-number="1" column-width="30mm"/>
				<fo:table-column column-number="2" column-width="38mm"/>
				<fo:table-column column-number="3" column-width="72mm"/>
				<fo:table-column column-number="4" column-width="50mm"/>
				<fo:table-body>

					<fo:table-row line-height="9mm">
						<fo:table-cell display-align="center" number-rows-spanned="5" border="0.8pt solid">
							<fo:block text-align="center" line-height="12pt">
								<fo:inline>
								そ の 他 の 希 望 条 件
								</fo:inline>
							</fo:block>
						</fo:table-cell>

						<fo:table-cell number-columns-spanned="3" border="0.8pt solid">
							<fo:block>
								<fo:inline padding="1mm">
								＜ 希 望 条 件 ＞
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>	

					<fo:table-row line-height="7mm">	
						<fo:table-cell display-align="center" border="0.8pt solid" background-color="#8cc48c">
							<fo:block text-align="center">
								<fo:inline padding="1mm">
								希望勤務期間
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell display-align="center" border="0.8pt solid">
							<fo:block>
								<fo:inline text-align="center" padding="1mm" padding-left="4mm">
								開始日:　　　　　　
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_0B8655796CC968A0FE5072FAC34F90"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell display-align="center" border="0.8pt solid">
							<fo:block>
								<fo:inline text-align="center" padding="1mm">
								終了日:　　
								<xsl:value-of select="Process.P_Resume/Resume/Resume.U_E714938A8541E8940A57E156A472DA"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>


					</fo:table-row>

					<fo:table-row line-height="7mm">
						<fo:table-cell border="0.8pt solid" background-color="#8cc48c" display-align="center">
							<fo:block text-align="center">
								<fo:inline padding="1mm">
								通勤手段
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" number-columns-spanned="2">
							<fo:block>
								<fo:inline padding-left="4mm">
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_0F4197EE9EBB3A5EE778C477DFF723"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					
					<fo:table-row line-height="7mm">
						<fo:table-cell border="0.8pt solid" background-color="#8cc48c" display-align="center">
							<fo:block text-align="center">
								<fo:inline padding="1mm">
								赴任手段
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" number-columns-spanned="2">
							<fo:block>
								<fo:inline padding-left="4mm">
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_1CC86EEC5306E96CEAC87F28988084"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>

					<fo:table-row line-height="7mm">
						<fo:table-cell border="0.8pt solid" background-color="#8cc48c" display-align="center" height="7mm">
							<fo:block text-align="center">
								<fo:inline padding="1mm">
								その他
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="0.8pt solid" number-columns-spanned="2" display-align="center">
							<fo:block line-height="12pt">
								<fo:inline padding-left="4mm">
									<xsl:value-of select="Process.P_Resume/Resume/Resume.U_E46ADD0388847221D04D41C51145EE"/>
								</fo:inline>
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