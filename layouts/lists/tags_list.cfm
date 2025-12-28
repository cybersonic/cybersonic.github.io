<cfscript>
// Default tags_list implementation for Markspresso sites.
// Expects arguments.tagsIndex = tagKey -> { name, posts = [ { title, date, url } ] }.
tagsIndex = structKeyExists(arguments, "tagsIndex") ? arguments.tagsIndex : {};
tagKeys = structKeyArray(tagsIndex);
arraySort(tagKeys, "textNoCase", "asc");
</cfscript>

<ul class="tags-list">
    <cfloop array="#tagKeys#" index="t">
        <cfset entry = tagsIndex[t]>
        <cfset label = structKeyExists(entry, "name") ? entry.name : t>
        <cfset posts = structKeyExists(entry, "posts") ? entry.posts : []>
        <cfset count = arrayLen(posts)>
        <li class="tags-list__item">
            <cfoutput>#htmlEditFormat(label)#</cfoutput>
            <span class="tags-list__count"><cfoutput>#count#</cfoutput></span>
        </li>
    </cfloop>
</ul>
