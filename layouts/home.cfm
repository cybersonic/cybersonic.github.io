<!DOCTYPE html>
<html lang="en">
<head>
    <cfinclude template="partials/head.cfm" >
</head>
<body>

  <cfinclude template="partials/header.cfm" >

  <div class="container">
    <cfoutput>
      <article class="post">
        #content#
      </article>
      <br>
      <cfif latestPost.keyExists("title") >
        
        <div>
        <h2>Latest Post:</h2>
        <article class="post">
            <div class="post-header">
                <h1 class="post-title">#latestPost.title#</h1>
                <div class="post-meta">
                    <cfif latestPost.date.len() >
                      <span>📅 #latestPost.date#</span>  
                    </cfif>
                    <cfif latestPost.author.len() >
                      <span>👤 #latestPost.author#</span>
                    </cfif>
                    <cfif latestPost.categories.len()>
                      <span>🏷️ #latestPost.categories#</span>
                    </cfif>
                </div>
            </div>

          <cfif latestPost.subtitle.len()>
            <p class="post-subtitle">#latestPost.subtitle#</p>
          </cfif>
          
          <cfif latestPost.header_img.len()>
            <div class="post-hero">
                <img width="100%" src="/#latestPost.header_img#" alt="# latestPost.title #">
            </div>

          </cfif>
            <div class="post-content">
                #latestPost.content#
            </div>
        </article>
      </div>
    </cfif>
    <div>
        <hr>
        <cfset readMore = arraySlice(posts, 2, 5)>
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
          <hr>
          <h3>Read the full <a href="/archive.html">Archive</a></h3>
      </div>

    </cfoutput>
  </div>
  <cfinclude template="partials/footer.cfm" >

  <cfdump var="#latestPost#">
 
</body>
</html>
