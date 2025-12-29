<cfoutput>
<rss version="2.0">
  <channel>
    <cfset blogName = structKeyExists(globals, "blogName") ? globals.blogName : data.title>
    <cfset blogDesc = structKeyExists(globals, "blogDescription") ? globals.blogDescription : (structKeyExists(data, "description") ? data.description : "")>
    <cfset baseUrl  = structKeyExists(globals, "baseUrl") ? globals.baseUrl : "http://localhost:8080">

    <title>#encodeForXml(blogName)#</title>
    <link>#encodeForXml(baseUrl)#</link>
    <description>#encodeForXml(blogDesc)#</description>

    <!-- Use the site-wide posts collection (newest first) -->
    <cfset maxItems = 20>
    <cfloop from="1" to="#min(maxItems, arrayLen(posts))#" index="i">
      <cfset p = posts[i]>
      <cfif NOT structKeyExists(p, "url") OR NOT len(p.url)>
        <cfcontinue>
      </cfif>

      <item>
        <title>#encodeForXml(p.title)#</title>
        <link>#encodeForXml(baseUrl & p.url)#</link>
        <guid isPermaLink="true">#encodeForXml(baseUrl & p.url)#</guid>

        <cfif structKeyExists(p, "date") AND len(p.date) GTE 10>
          <!-- p.date is YYYY-MM-DD; convert to RFC-822-ish pubDate -->
          <cfset pubDate = createDateTime(
            val(left(p.date,4)),
            val(mid(p.date,6,2)),
            val(mid(p.date,9,2)),
            0,0,0
          )>
          <pubDate>#dateTimeFormat(pubDate, "ddd, dd mmm yyyy HH:nn:ss 'GMT'")#</pubDate>
        </cfif>
      </item>
    </cfloop>
  </channel>
</rss>
</cfoutput>
