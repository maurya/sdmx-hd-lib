<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:message="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/message"
	xmlns:structure="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/structure"
	>
	<xsl:template match="/">
	<html>
		<head>
			<title>SDMX-HD v1.0 documentation</title>
			<style type="text/css">
			body { color: Black; background-color: White; font-family: Arial, sans-serif; font-size: 10pt; }
			hr { color: black; }
			h1 { font-size: 18pt; letter-spacing: 2px; border-bottom: 1px #ccc solid; padding-top: 5px; padding-bottom: 5px; }
			h2 { font-size: 14pt; letter-spacing: 1px; }
			h3 { font-size: 12pt; font-weight: bold; color: black; }
			.dimName { color: #F93 }
			div.xmlContents { border: 1px solid black; padding: 5px; }
			div.xmlContents .scTag { color: #933; /* maroon */ }
			div.xmlContents .scContent, div.schemaComponent div.contents .scContent a { color: black; font-weight: bold; }
			table { margin-top: 10px; margin-bottom: 10px; margin-left: 0px; margin-right: 0px; border: 1px solid #ccc; }
			table th, table td { font-size: 10pt; vertical-align: top; padding-top: 3px; padding-bottom: 3px; padding-left: 10px; padding-right: 10px; border: 1px solid #ccc; }
			table th { font-weight: bold; text-align: left; }
			table.tblItems th { background-color: #ccc; }
			table.tblItems td { background-color: #eee; }
			</style>
		</head>
		<body style="color: Black; background-color: White; font-family: Arial, sans-serif; font-size: 10pt;">
		<h1 style="font-size: 18pt; letter-spacing: 2px;">SDMX-HD (Health Domain) v1.0 documentation<br /></h1>
		<h2>Concept Scheme: <xsl:value-of select="//message:Concepts/structure:ConceptScheme/structure:Name" /></h2>
		<p>
		<ul>
			<li>Identifier: <xsl:value-of select="//message:Concepts/structure:ConceptScheme/@id"/></li>
			<li>Agency [version]: <xsl:value-of select="//message:Concepts/structure:ConceptScheme/@agencyID"/>[<xsl:value-of select="//message:Concepts/structure:ConceptScheme/@version"/>]</li>
			<li>IsFinal: <xsl:value-of select="//message:Concepts/structure:ConceptScheme/@isFinal"/> (<xsl:choose>
				<xsl:when test="//message:Concepts/structure:ConceptScheme[@isFinal='true']"><span style="color:red">read-only</span></xsl:when>
				<xsl:otherwise><span style="color:blue">can be modified</span></xsl:otherwise>
			</xsl:choose>)</li>
		</ul>
			<xsl:value-of select="//message:Concepts/structure:ConceptScheme/structure:Description" />
		</p>
		<div class="xmlContents">
			&lt;<span class="scTag">structure:ConceptScheme </span><span class="scTag">id</span>="<span class="scContent"><xsl:value-of select="//message:Concepts/structure:ConceptScheme/@id"/></span>"
				<span class="scTag">agencyID</span>="<span class="scContent"><xsl:value-of select="//message:Concepts/structure:ConceptScheme/@agencyID"/></span>"
				<span class="scTag">version</span>="<span class="scContent"><xsl:value-of select="//message:Concepts/structure:ConceptScheme/@version"/></span>"
				<span class="scTag">isFinal</span>="<span class="scContent"><xsl:value-of select="//message:Concepts/structure:ConceptScheme/@isFinal"/></span>"
				<span class="scTag">urn</span>="<span class="scContent"><xsl:value-of select="//message:Concepts/structure:ConceptScheme/@urn"/></span>"
			/&gt;
		</div>

	<table class="tblItems">
		<tr>
			<th>Concept Id</th>
			<th>Format</th>
			<th>Name (EN)</th>
			<th>Description (EN)</th>
		</tr>
		<xsl:for-each select="//message:Concepts/structure:ConceptScheme/structure:Concept">
		<xsl:sort select="@id" />
		<tr>
			<td><xsl:value-of select="@id" /></td>
			<td>
			<xsl:choose>
				<xsl:when test="structure:TextFormat/@textType"><xsl:value-of select="structure:TextFormat/@textType" /></xsl:when>
				<xsl:otherwise>
					<xsl:variable name="coded">,_VSTATUS,AGROUP,ASOURCE,BOUNDARIES,CALENDAR_TYPE,COD,CONDITION,CONDITION_STATUS,CONTACT,CURRENCY,DATAELEMENT,DISAGG,DSOURCE,DSTYPE,DTYPE,EDUC,FPERIOD,FREQ,GBOUNDARY_TYPE,GCODE_COUNTRY,GENDER,GEOGRAPHIC_PLACE_NAME,GLEVEL,GLOCATION,HIF,INCOME,INDICATOR,LOGICAL_VALUE,METYPE,MULT,OBS_STATUS,OPERAND,ORG_COMP,ORG_MAINT,ORG_RESP,ORGANIZATION,OTYPE,PERIODICITY,PROG,PSTATUS,PTYPE,SECTOR,SET,SEX,TPOP,TSTAT,UNIT,VALUE_TYPE,</xsl:variable>
					<xsl:choose>
						<xsl:when test="contains(concat(',', $coded, ','), concat(',', @id, ','))">Coded</xsl:when>
						<xsl:otherwise>String</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>			
			</td>
			<td><xsl:value-of select="structure:Name[@xml:lang='en']" /></td>
			<td><xsl:value-of select="structure:Description[@xml:lang='en']" /></td>
		</tr>
		</xsl:for-each>
	</table>

<p>&#0160;</p>
<p>&#0160;</p>
</body>
</html>
	</xsl:template>

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="no" name="CodeLists" userelativepaths="yes" externalpreview="no" url="CL_ASOURCE+SDMX-HD+1.0.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
		<scenario default="yes" name="ConceptScheme" userelativepaths="yes" externalpreview="no" url="COMMON+SDMX-HD+1.0.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->