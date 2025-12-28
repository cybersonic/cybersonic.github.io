<cfscript>
// Default posts_list implementation for Markspresso sites.
// Expects arguments.posts = [ { title, date, url } ].
posts = structKeyExists(arguments, "posts") ? arguments.posts : [];
</cfscript>

<ul class="posts-list">
    <cfloop array="#posts#" index="p">
        <cfset title = structKeyExists(p, "title") ? p.title : "">
        <cfset url   = structKeyExists(p, "url") ? p.url : "">
        <cfset date  = structKeyExists(p, "date") ? p.date : "">
        <cfif len(url)>
            <li class="posts-list__item">
                <a href="<cfoutput>#htmlEditFormat(url)#</cfoutput>">
                    <cfoutput>#htmlEditFormat(title)#</cfoutput>
                </a>
                <cfif len(date)>
                    <span class="post-date"><cfoutput>#htmlEditFormat(date)#</cfoutput></span>
                </cfif>
            </li>
        </cfif>
    </cfloop>
</ul>
