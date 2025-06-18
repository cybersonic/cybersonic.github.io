const syntaxHighlight = require("@11ty/eleventy-plugin-syntaxhighlight");

module.exports = function(eleventyConfig) {
  
  // Add syntax highlighting
  eleventyConfig.addPlugin(syntaxHighlight);
  
  // Layout aliases for Jekyll compatibility
  eleventyConfig.addLayoutAlias('post', 'post.njk');
  eleventyConfig.addLayoutAlias('page', 'page.njk');
  eleventyConfig.addLayoutAlias('default', 'base.njk');
  
  // Copy static assets
  eleventyConfig.addPassthroughCopy("img");
  eleventyConfig.addPassthroughCopy("favicon.ico");
  eleventyConfig.addPassthroughCopy("CNAME");
  
  // Date filter for posts
  eleventyConfig.addFilter("dateDisplay", function(dateObj) {
    if (!dateObj) return 'Unknown Date';
    const date = new Date(dateObj);
    if (isNaN(date.getTime())) return 'Unknown Date';
    return date.toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  });
  
  // ISO date filter
  eleventyConfig.addFilter("dateISO", function(dateObj) {
    if (!dateObj) return '2024-01-01';
    const date = new Date(dateObj);
    if (isNaN(date.getTime())) return '2024-01-01';
    return date.toISOString().split('T')[0];
  });
  
  // Truncate filter
  eleventyConfig.addFilter("truncate", function(str, length = 150) {
    if (!str) return '';
    return str.length > length ? str.substr(0, length) + '...' : str;
  });
  
  // Strip tags filter
  eleventyConfig.addFilter("striptags", function(str) {
    if (!str) return '';
    return str.replace(/<[^>]*>/g, '');
  });
  
  // Keys filter for objects
  eleventyConfig.addFilter("keys", function(obj) {
    return Object.keys(obj || {});
  });
  
  // Collections
  eleventyConfig.addCollection("posts", function(collectionApi) {
    const posts = collectionApi.getFilteredByGlob("_posts/**/*.{md,markdown,html}");
    console.log(`DEBUG: Found ${posts.length} total posts`);
    
    // Sort by date (newest first)
    const sortedPosts = posts.sort((a, b) => b.date - a.date);
    
    if (sortedPosts.length > 0) {
      console.log(`DEBUG: First 3 posts after sorting:`);
      sortedPosts.slice(0, 3).forEach((post, i) => {
        console.log(`  ${i}: ${post.inputPath} - ${post.date}`);
      });
    }
    return sortedPosts;
  });
  
  // Create paginated collection for the home page
  eleventyConfig.addCollection("postsPaginated", function(collectionApi) {
    const posts = collectionApi.getFilteredByGlob("_posts/**/*.{md,markdown,html}");
    return posts.sort((a, b) => b.date - a.date);
  });
  
  // Group posts by year
  eleventyConfig.addCollection("postsByYear", function(collectionApi) {
    const posts = collectionApi.getFilteredByGlob("_posts/**/*.{md,markdown,html}");
    const postsByYear = {};
    
    posts.forEach(post => {
      const year = post.date.getFullYear();
      if (!postsByYear[year]) {
        postsByYear[year] = [];
      }
      postsByYear[year].push(post);
    });
    
    // Sort years in descending order and posts within each year
    const sortedYears = Object.keys(postsByYear).sort((a, b) => b - a);
    const result = {};
    sortedYears.forEach(year => {
      result[year] = postsByYear[year].sort((a, b) => b.date - a.date);
    });
    
    return result;
  });
  
  
  return {
    dir: {
      input: ".",
      includes: "_includes",
      output: "_site"
    },
    templateFormats: ["md", "markdown", "njk", "html"],
    markdownTemplateEngine: "njk",
    htmlTemplateEngine: "njk",
    dataTemplateEngine: "njk"
  };
};

