<!DOCTYPE html>
<html lang="en">
<head>
    <cfinclude template="partials/head.cfm" >
</head>
<body>
  <cfinclude template="partials/header.cfm" >
<cfoutput>
  
    <div class="container">
        <a href="/" class="back-link">← Back Home</a>
        <article class="post">
            <div class="post-header">
                <h1 class="post-title">#post.title?:""#</h1>
                <div class="post-meta">
                    <cfif post.keyExists("date") ><span>📅 #post.date#</span></cfif>
                    <cfif post.keyExists("author")><span>👤 #post.author#</span></cfif>
                    <cfif post.keyExists("categories")><span>🏷️ #post.categories#</span></cfif>
                </div>
            </div>

            <cfif post.keyExists("subtitle") >
            <p class="post-subtitle">#post.subtitle#</p>
            </cfif>

            <cfif post.keyExists("header_img")>
            <div class="post-hero">
                <img width="100%" src="/#post.header_img#" alt="#post.title#">
            </div>
            </cfif>

            <div class="post-content">
                #post.content#
            </div>
        </article>

        <cfset readMore = arraySlice(posts, 1, 5)>
        <ul class="archives-list">
                  <li class="archives-list__item">
                      <div class="archives-list__header">
                          Read More:
                      </div>
                      <ul class="archives-list__posts">
                          <cfloop array="#readMore#" item="post">
                              <li class="archives-list__post">
                                  
                                      <span class="archives-list__post-date">📅 #post.date#</span>
                                      <a class="archives-list__post-link" href="#post.url#">#post.title#</a>
                                  
                              </li>
                          </cfloop>
                      </ul>
                  </li>
          </ul>
    </div>
</cfoutput>
    <cfinclude template="partials/footer.cfm" >
</body>
</html>
