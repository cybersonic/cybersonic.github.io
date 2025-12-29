<cfscript>
// Default archives_list implementation for Markspresso sites.
// Expects args.archivesIndex = "YYYY-MM" -> [ { title, date, url } ].
// dump(arguments.archivesIndex);
param name="arguments.archivesIndex" type="struct" default="#{}#";
// Make sure we are sorted
keys = structKeyArray(arguments.archivesIndex);
arraySort(keys, "textNoCase", "desc"); // newest first
</cfscript>
<ul class="archives-list">
    <cfloop array="#keys#" index="k">
        <cfset posts = archivesIndex[k]>
        <cfset count = arrayLen(posts)>
        <li class="archives-list__item">
            <div class="archives-list__header">
                <cfoutput>#htmlEditFormat(k)#</cfoutput>
                <span class="archives-list__count"><cfoutput>#count# post#count EQ 1 ? "" : "s"#</cfoutput></span>
            </div>
            <ul class="archives-list__posts">
                <cfloop array="#posts#" item="post">
                    <li class="archives-list__post">
                        <cfoutput>
                            <span class="archives-list__post-date">📅 #post.date#</span>
                            <a class="archives-list__post-link" href="#post.url#">#post.title#</a>
                        </cfoutput>
                    </li>
                </cfloop>
            </ul>
        </li>
    </cfloop>
</ul>
