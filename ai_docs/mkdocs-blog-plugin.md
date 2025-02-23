---
created: 2025-02-23T21:11:49 (UTC +11:00)
tags: []
source: https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_url_date_format
author: Martin Donath
---

# Built-in blog plugin - Material for MkDocs

> ## Excerpt
> Write your documentation in Markdown and create a professional static site in minutes – searchable, customizable, in 60+ languages, for all devices

---
[](https://github.com/squidfunk/mkdocs-material/edit/master/docs/plugins/blog.md "Edit this page")[](https://github.com/squidfunk/mkdocs-material/raw/master/docs/plugins/blog.md "View source of this page")

The blog plugin makes it very easy to build a blog, either as a sidecar to your documentation or as the main thing. Focus on your content while the plugin does all the heavy lifting, generating a view of all latest posts, [archive](https://squidfunk.github.io/mkdocs-material/plugins/blog/#archive) and [category](https://squidfunk.github.io/mkdocs-material/plugins/blog/#categories) pages, configurable [pagination](https://squidfunk.github.io/mkdocs-material/plugins/blog/#pagination) and much more.

## Objective[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#objective "Permanent link")

### How it works[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#how-it-works "Permanent link")

The plugin scans the configured [`posts` directory](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_dir) for `.md` files from which paginated views<sup id="fnref:1"><a href="https://squidfunk.github.io/mkdocs-material/plugins/blog/#fn:1">1</a></sup> are automatically generated. If not configured otherwise, the plugin expects that your project has the following directory layout, and will create any missing directories or files for you:

```
<span></span><nav></nav><code><span id="__span-0-1">.
</span><span id="__span-0-2">├─<span> </span>docs/
</span><span id="__span-0-3">│<span>  </span>└─<span> </span>blog/
</span><span id="__span-0-4">│<span>     </span>├─<span> </span>posts/
</span><span id="__span-0-5">│<span>     </span>└─<span> </span>index.md
</span><span id="__span-0-6">└─<span> </span>mkdocs.yml
</span></code>
```

The `index.md` file in the [`blog` directory](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.blog_dir) is the entry point to your blog – a paginated view listing all posts in reverse chronological order. Besides that, the plugin supports automatically creating [archive](https://squidfunk.github.io/mkdocs-material/plugins/blog/#archive) and [category](https://squidfunk.github.io/mkdocs-material/plugins/blog/#categories) pages that list a subset of posts for a time interval or category.

[Post URLs](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_url_format) are completely configurable, no matter if you want your URLs to include the post's date or not. Rendered dates always display in the locale of the [site language](https://squidfunk.github.io/mkdocs-material/setup/changing-the-language/#site-language) of your project. Like in other static blog frameworks, posts can be annotated with a variety of [metadata](https://squidfunk.github.io/mkdocs-material/plugins/blog/#metadata), allowing for easy integration with other [built-in plugins](https://squidfunk.github.io/mkdocs-material/plugins/), e.g., the [social](https://squidfunk.github.io/mkdocs-material/plugins/social/) and [tags](https://squidfunk.github.io/mkdocs-material/plugins/tags/) plugin.

Posts can be organized in nested folders with a directory layout that suits your specific needs, and can make use of all components and syntax that Material for MkDocs offers, including [admonitions](https://squidfunk.github.io/mkdocs-material/reference/admonitions/), [annotations](https://squidfunk.github.io/mkdocs-material/reference/annotations/), [code blocks](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/), [content tabs](https://squidfunk.github.io/mkdocs-material/reference/content-tabs/), [diagrams](https://squidfunk.github.io/mkdocs-material/reference/diagrams/), [icons](https://squidfunk.github.io/mkdocs-material/reference/icons-emojis/), [math](https://squidfunk.github.io/mkdocs-material/reference/math/), and more.

### When to use it[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#when-to-use-it "Permanent link")

If you want to add a blog to your project, or migrate from another blog framework to Material for MkDocs because of its excellent technical writing capabilities, this plugin is a great choice, as it integrates perfectly with many other built-in plugins:

-     **[Built-in meta plugin](https://squidfunk.github.io/mkdocs-material/plugins/meta/)**
    
    ___
    
    The meta plugin makes it easy to apply [metadata](https://squidfunk.github.io/mkdocs-material/plugins/blog/#metadata) to a subset of posts, including authors, tags, categories, draft status, as well as social card layouts.
    
    ___
    
    **Simpler organization, categorization and management of post metadata**
    
-     **[Built-in social plugin](https://squidfunk.github.io/mkdocs-material/plugins/social/)**
    
    ___
    
    The social plugin automatically generates beautiful and customizable social cards for each post and page, showing as previews on social media.
    
    ___
    
    **Links to your blog render beautiful social cards when shared on social media**
    
-     **[Built-in optimize plugin](https://squidfunk.github.io/mkdocs-material/plugins/optimize/)**
    
    ___
    
    The optimize plugin automatically identifies and optimizes all media files that you reference in your project by using compression and conversion techniques.
    
    ___
    
    **Your blog loads faster as smaller images are served to your users**
    
-     **[Built-in tags plugin](https://squidfunk.github.io/mkdocs-material/plugins/tags/)**
    
    ___
    
    The tags plugin allows to categorize posts alongside with pages in your project, to improve their discoverability and connect posts to your documentation.
    
    ___
    
    **Your documentation's tag system integrates with your blog**
    

## Configuration[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#configuration "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#plugin "Plugin")[blog](https://squidfunk.github.io/mkdocs-material/plugins/blog/) – built-in[](https://squidfunk.github.io/mkdocs-material/conventions/#multiple-instances "Multiple instances")[](https://squidfunk.github.io/mkdocs-material/conventions/#experimental "Experimental")

As with all [built-in plugins](https://squidfunk.github.io/mkdocs-material/plugins/), getting started with the blog plugin is straightforward. Just add the following lines to `mkdocs.yml`, and you can start writing your first post:

The blog plugin is built into Material for MkDocs and doesn't need to be installed.

### Navigation[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#navigation "Permanent link")

If you do not have site navigation configured in your `mkdocs.yml` then there is nothing more to do. The blog [archive](https://squidfunk.github.io/mkdocs-material/plugins/blog/#archive) and [category](https://squidfunk.github.io/mkdocs-material/plugins/blog/#categories) pages will automatically appear underneath the automatically generated navigation.

If you do have a navigation structure defined then you will need to specify where the blog should appear in this. Create a [navigation section with an index page](https://squidfunk.github.io/mkdocs-material/setup/setting-up-navigation/#section-index-pages) for the blog:

```
<span></span><nav></nav><code><span id="__span-2-1"><span>theme</span><span>:</span>
</span><span id="__span-2-2"><span>  </span><span>name</span><span>:</span><span> </span><span>material</span>
</span><span id="__span-2-3"><span>  </span><span>features</span><span>:</span>
</span><span id="__span-2-4"><span>    </span><span>-</span><span> </span><span>navigation.indexes</span>
</span><span id="__span-2-5"><span>nav</span><span>:</span>
</span><span id="__span-2-6"><span>  </span><span>-</span><span> </span><span>...</span>
</span><span id="__span-2-7"><span>  </span><span>-</span><span> </span><span>Blog</span><span>:</span>
</span><span id="__span-2-8"><span>    </span><span>-</span><span> </span><span>blog/index.md</span>
</span></code>
```

The [archive](https://squidfunk.github.io/mkdocs-material/plugins/blog/#archive) and [category](https://squidfunk.github.io/mkdocs-material/plugins/blog/#categories) pages will appear within that section as subsections beneath pages in the blog section. In this case, they would appear after `index.md`. The path to the `index.md` file must match [blog\_dir](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.blog_dir). This means that you can name the blog navigation entry anything you like: 'Blog' or 'News' or perhaps 'Tips'.

### General[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#general "Permanent link")

The following settings are available:

___

#### `enabled`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.enabled "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`true`

Use this setting to enable or disable the plugin when [building your project](https://squidfunk.github.io/mkdocs-material/creating-your-site/#building-your-site). It's normally not necessary to specify this setting, but if you want to disable the plugin, use:

```
<span></span><nav></nav><code><span id="__span-3-1"><span>plugins</span><span>:</span>
</span><span id="__span-3-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-3-3"><span>      </span><span>enabled</span><span>:</span><span> </span><span>false</span>
</span></code>
```

___

#### `blog_dir`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.blog_dir "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`blog`

Use this setting to change the path where your blog is located in the [`docs` directory](https://www.mkdocs.org/user-guide/configuration/#docs_dir). The path is included in the generated URLs as a prefix for all posts and views. You can change it with:

```
<span></span><nav></nav><code><span id="__span-4-1"><span>plugins</span><span>:</span>
</span><span id="__span-4-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-4-3"><span>      </span><span>blog_dir</span><span>:</span><span> </span><span>blog</span>
</span></code>
```

The provided path is resolved from the [`docs` directory](https://www.mkdocs.org/user-guide/configuration/#docs_dir).

___

#### `blog_toc`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.blog_toc "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`false`

Use this setting to leverage the table of contents to display post titles in views. This might be useful, if your post excerpts are rather long. If you want to enable it, use:

```
<span></span><nav></nav><code><span id="__span-6-1"><span>plugins</span><span>:</span>
</span><span id="__span-6-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-6-3"><span>      </span><span>blog_toc</span><span>:</span><span> </span><span>true</span>
</span></code>
```

### Posts[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#posts "Permanent link")

The following settings are available for posts:

___

#### `post_dir`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_dir "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`{blog}/posts`

Use this setting to change the folder where your posts are located. It's normally not necessary to change this setting, but if you want to rename the folder or change its file system location, use:

```
<span></span><nav></nav><code><span id="__span-7-1"><span>plugins</span><span>:</span>
</span><span id="__span-7-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-7-3"><span>      </span><span>post_dir</span><span>:</span><span> </span><span>"{blog}/articles"</span>
</span></code>
```

Note that the [`posts` directory](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_dir) is solely used for post organization – it is not included in post URLs, since they are automatically and comfortably generated by this plugin.

The following placeholders are available:

-   `blog` – [`blog` directory](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.blog_dir)

The provided path is resolved from the [`docs` directory](https://www.mkdocs.org/user-guide/configuration/#docs_dir).

___

#### `post_date_format`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_date_format "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`long`

Use this setting to change the date format of posts. This plugin uses [babel](https://pypi.org/project/Babel/) to render dates in the configured [site language](https://squidfunk.github.io/mkdocs-material/setup/changing-the-language/#site-language). You can use [babel](https://pypi.org/project/Babel/)'s [pattern syntax](https://babel.pocoo.org/en/latest/dates.html#pattern-syntax) or the following shortcodes:

```
<span></span><nav></nav><code><span id="__span-8-1"><span>plugins</span><span>:</span>
</span><span id="__span-8-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-8-3"><span>      </span><span>post_date_format</span><span>:</span><span> </span><span>full</span>
</span></code>
```

Note that depending on the [site language](https://squidfunk.github.io/mkdocs-material/setup/changing-the-language/#site-language), results might look different for other languages.

___

#### `post_url_date_format`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_url_date_format "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`yyyy/MM/dd`

Use this setting to change the date format used in post URLs. The format string must adhere to [babel](https://pypi.org/project/Babel/)'s [pattern syntax](https://babel.pocoo.org/en/latest/dates.html#pattern-syntax) and should not contain whitespace. Some popular choices:

```
<span></span><nav></nav><code><span id="__span-12-1"><span>plugins</span><span>:</span>
</span><span id="__span-12-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-12-3"><span>      </span><span>post_url_date_format</span><span>:</span><span> </span><span>yyyy/MM/dd</span>
</span></code>
```

If you want to remove the date from post URLs, e.g., when your blog features mostly evergreen content, you can remove the `date` placeholder from the [`post_url_format`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_url_format) format string.

___

#### `post_url_format`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_url_format "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`{date}/{slug}`

Use this setting to change the format string that is used when generating post URLs. You can freely combine placeholders, and join them with slashes or other characters:

```
<span></span><nav></nav><code><span id="__span-15-1"><span>plugins</span><span>:</span>
</span><span id="__span-15-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-15-3"><span>      </span><span>post_url_format</span><span>:</span><span> </span><span>"{date}/{slug}"</span>
</span></code>
```

The following placeholders are available:

-   `categories` – Post categories, slugified with [`categories_slugify`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_slugify)
-   `date` – Post date, formatted with [`post_url_date_format`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_url_date_format)
-   `slug` – Post title, slugified with [`post_slugify`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_slugify), or explicitly set via [`slug`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.slug) metadata property
-   `file` – Post filename without `.md` file extension

If you remove the `date` placeholder, make sure that post URLs don't collide with URLs of other pages hosted under the [`blog` directory](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.blog_dir), as this leads to undefined behavior.

___

#### `post_url_max_categories`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_url_max_categories "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`1`

Use this setting to set an upper bound for the number of categories included in post URLs if the `categories` placeholder is part of [`post_url_format`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_url_format) and the post defines categories:

```
<span></span><nav></nav><code><span id="__span-17-1"><span>plugins</span><span>:</span>
</span><span id="__span-17-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-17-3"><span>      </span><span>post_url_format</span><span>:</span><span> </span><span>"{categories}/{slug}"</span>
</span><span id="__span-17-4"><span>      </span><span>post_url_max_categories</span><span>:</span><span> </span><span>2</span>
</span></code>
```

If more than one category is given, they are joined with `/` after slugifying.

___

#### `post_slugify`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_slugify "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")[`pymdownx.slugs.slugify`](https://github.com/facelessuser/pymdown-extensions/blob/01c91ce79c91304c22b4e3d7a9261accc931d707/pymdownx/slugs.py#L59-L65)

Use this setting to change the function for generating URL-compatible slugs from post titles. By default, the [`slugify`](https://github.com/facelessuser/pymdown-extensions/blob/01c91ce79c91304c22b4e3d7a9261accc931d707/pymdownx/slugs.py#L59-L65) function from [Python Markdown Extensions](https://facelessuser.github.io/pymdown-extensions/extras/slugs/) is used as follows:

```
<span></span><nav></nav><code><span id="__span-18-1"><span>plugins</span><span>:</span>
</span><span id="__span-18-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-18-3"><span>      </span><span>post_slugify</span><span>:</span><span> </span><span>!!python/object/apply:pymdownx.slugs.slugify</span>
</span><span id="__span-18-4"><span>        </span><span>kwds</span><span>:</span>
</span><span id="__span-18-5"><span>          </span><span>case</span><span>:</span><span> </span><span>lower</span>
</span></code>
```

The default configuration is Unicode-aware and should produce good slugs for all languages. Of course, you can also provide a custom slugification function for more granular control.

___

#### `post_slugify_separator`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_slugify_separator "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`-`

Use this setting to change the separator that is passed to the slugification function set as part of [`post_slugify`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_slugify). While the default is a hyphen, it can be set to any string, e.g., `_`:

```
<span></span><nav></nav><code><span id="__span-19-1"><span>plugins</span><span>:</span>
</span><span id="__span-19-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-19-3"><span>      </span><span>post_slugify_separator</span><span>:</span><span> </span><span>_</span>
</span></code>
```

___

#### `post_excerpt`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_excerpt "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`optional`

By default, the plugin makes [post excerpts](https://squidfunk.github.io/mkdocs-material/setup/setting-up-a-blog/#adding-an-excerpt) optional. When a post doesn't define an excerpt, views include the entire post. This setting can be used to make post excerpts required:

```
<span></span><nav></nav><code><span id="__span-20-1"><span>plugins</span><span>:</span>
</span><span id="__span-20-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-20-3"><span>      </span><span>post_excerpt</span><span>:</span><span> </span><span>optional</span>
</span></code>
```

When post excerpts are required, posts without excerpt separators raise an error. Thus, this setting is useful when you want to make sure that all posts have excerpts defined.

___

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`1`

Use this setting to set an upper bound for the number of authors rendered in post excerpts. While each post may be written by multiple authors, this setting allows to limit the display to just a few or even a single author, or disable authors in post excerpts:

```
<span></span><nav></nav><code><span id="__span-22-1"><span>plugins</span><span>:</span>
</span><span id="__span-22-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-22-3"><span>      </span><span>post_excerpt_max_authors</span><span>:</span><span> </span><span>2</span>
</span></code>
```

This only applies to post excerpts in views. Posts always render all authors.

___

#### `post_excerpt_max_categories`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_excerpt_max_categories "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`5`

Use this setting to set an upper bound for the number of categories rendered in post excerpts. While each post may be assigned to multiple categories, this setting allows to limit the display to just a few or even a single category, or disable categories in post excerpts:

```
<span></span><nav></nav><code><span id="__span-24-1"><span>plugins</span><span>:</span>
</span><span id="__span-24-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-24-3"><span>      </span><span>post_excerpt_max_categories</span><span>:</span><span> </span><span>2</span>
</span></code>
```

This only applies to post excerpts in views. Posts always render all categories.

___

#### `post_excerpt_separator`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_excerpt_separator "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`<!-- more -->`

Use this setting to set the separator the plugin will look for in a post's content when generating post excerpts. All content **before** the separator is considered to be part of the excerpt:

```
<span></span><nav></nav><code><span id="__span-26-1"><span>plugins</span><span>:</span>
</span><span id="__span-26-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-26-3"><span>      </span><span>post_excerpt_separator</span><span>:</span><span> </span><span>&lt;!-- more --&gt;</span>
</span></code>
```

It is common practice to use an HTML comment as a separator.

___

#### `post_readtime`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_readtime "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`true`

Use this setting to control whether the plugin should automatically compute the reading time of a post, which is then rendered in post excerpts, as well as in posts themselves:

```
<span></span><nav></nav><code><span id="__span-27-1"><span>plugins</span><span>:</span>
</span><span id="__span-27-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-27-3"><span>      </span><span>post_readtime</span><span>:</span><span> </span><span>false</span>
</span></code>
```

___

#### `post_readtime_words_per_minute`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_readtime_words_per_minute "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`265`

Use this setting to change the number of words that a reader is expected to read per minute when computing the reading time of a post. If you want to fine-tune it, use:

```
<span></span><nav></nav><code><span id="__span-28-1"><span>plugins</span><span>:</span>
</span><span id="__span-28-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-28-3"><span>      </span><span>post_readtime_words_per_minute</span><span>:</span><span> </span><span>300</span>
</span></code>
```

A reading time of 265 words per minute is considered to be the [average reading time of an adult](https://help.medium.com/hc/en-us/articles/214991667-Read-time).

### Archive[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#archive "Permanent link")

The following settings are available for archive pages:

___

#### `archive`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.archive "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`true`

Use this setting to enable or disable archive pages. An archive page shows all posts for a specific interval (e.g. year, month, etc.) in reverse order. If you want to disable archive pages, use:

```
<span></span><nav></nav><code><span id="__span-29-1"><span>plugins</span><span>:</span>
</span><span id="__span-29-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-29-3"><span>      </span><span>archive</span><span>:</span><span> </span><span>false</span>
</span></code>
```

___

#### `archive_name`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.archive_name "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0)[](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value is computed")

Use this setting to change the title of the archive section the plugin adds to the navigation. If this setting is omitted, it's sourced from the translations. If you want to change it, use:

```
<span></span><nav></nav><code><span id="__span-30-1"><span>plugins</span><span>:</span>
</span><span id="__span-30-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-30-3"><span>      </span><span>archive_name</span><span>:</span><span> </span><span>Archive</span>
</span></code>
```

___

#### `archive_date_format`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.archive_date_format "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`yyyy`

Use this setting to change the date format used for archive page titles. The format string must adhere to [babel](https://pypi.org/project/Babel/)'s [pattern syntax](https://babel.pocoo.org/en/latest/dates.html#pattern-syntax). Some popular choices:

```
<span></span><nav></nav><code><span id="__span-31-1"><span>plugins</span><span>:</span>
</span><span id="__span-31-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-31-3"><span>      </span><span>archive_date_format</span><span>:</span><span> </span><span>yyyy</span>
</span></code>
```

Note that depending on the [site language](https://squidfunk.github.io/mkdocs-material/setup/changing-the-language/#site-language), results might look different for other languages.

___

#### `archive_url_date_format`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.archive_url_date_format "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`yyyy`

Use this setting to change the date format used for archive page URLs. The format string must adhere to [babel](https://pypi.org/project/Babel/)'s [pattern syntax](https://babel.pocoo.org/en/latest/dates.html#pattern-syntax) and should not contain whitespace. Some popular choices:

```
<span></span><nav></nav><code><span id="__span-33-1"><span>plugins</span><span>:</span>
</span><span id="__span-33-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-33-3"><span>      </span><span>archive_url_date_format</span><span>:</span><span> </span><span>yyyy</span>
</span></code>
```

___

#### `archive_url_format`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.archive_url_format "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`archive/{date}`

Use this setting to change the format string that is used when generating archive page URLs. You can freely combine placeholders, and join them with slashes or other characters:

```
<span></span><nav></nav><code><span id="__span-35-1"><span>plugins</span><span>:</span>
</span><span id="__span-35-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-35-3"><span>      </span><span>archive_url_format</span><span>:</span><span> </span><span>"archive/{date}"</span>
</span></code>
```

The following placeholders are available:

-   `date` – Archive date, formatted with [`archive_url_date_format`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.archive_url_date_format)

___

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.44.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.44.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`true`

Use this setting to enable or disable pagination for archive pages. The value of this setting is inherited from [`pagination`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.pagination), unless it's explicitly set. To disable pagination, use:

```
<span></span><nav></nav><code><span id="__span-37-1"><span>plugins</span><span>:</span>
</span><span id="__span-37-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-37-3"><span>      </span><span>archive_pagination</span><span>:</span><span> </span><span>false</span>
</span></code>
```

___

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.44.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.44.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`10`

Use this setting to change the number of posts rendered per archive page. The value of this setting is inherited from [`pagination_per_page`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.pagination_per_page), unless it's explicitly set. To change it, use:

```
<span></span><nav></nav><code><span id="__span-38-1"><span>plugins</span><span>:</span>
</span><span id="__span-38-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-38-3"><span>      </span><span>archive_pagination_per_page</span><span>:</span><span> </span><span>5</span>
</span></code>
```

___

#### `archive_toc`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.archive_toc "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`false`

Use this setting to leverage the table of contents to display post titles on all archive pages. The value of this setting is inherited from [`blog_toc`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.blog_toc), unless it's explicitly set. To change it, use

```
<span></span><nav></nav><code><span id="__span-39-1"><span>plugins</span><span>:</span>
</span><span id="__span-39-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-39-3"><span>      </span><span>archive_toc</span><span>:</span><span> </span><span>true</span>
</span></code>
```

### Categories[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#categories "Permanent link")

The following settings are available for category pages:

___

#### `categories`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`true`

Use this setting to enable or disable category pages. A category page shows all posts for a specific category in reverse chronological order. If you want to disable category pages, use:

```
<span></span><nav></nav><code><span id="__span-40-1"><span>plugins</span><span>:</span>
</span><span id="__span-40-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-40-3"><span>      </span><span>categories</span><span>:</span><span> </span><span>false</span>
</span></code>
```

___

#### `categories_name`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_name "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0)[](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value is computed")

Use this setting to change the title of the category section the plugin adds to the navigation. If this setting is omitted, it's sourced from the translations. If you want to change it, use:

```
<span></span><nav></nav><code><span id="__span-41-1"><span>plugins</span><span>:</span>
</span><span id="__span-41-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-41-3"><span>      </span><span>categories_name</span><span>:</span><span> </span><span>Categories</span>
</span></code>
```

___

#### `categories_url_format`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_url_format "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`category/{slug}`

Use this setting to change the format string that is used when generating category page URLs. You can freely combine placeholders, and join them with slashes or other characters:

```
<span></span><nav></nav><code><span id="__span-42-1"><span>plugins</span><span>:</span>
</span><span id="__span-42-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-42-3"><span>      </span><span>categories_url_format</span><span>:</span><span> </span><span>"category/{slug}"</span>
</span></code>
```

The following placeholders are available:

-   `slug` – Category, slugified with [`categories_slugify`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_slugify)

___

#### `categories_slugify`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_slugify "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")[`pymdownx.slugs.slugify`](https://github.com/facelessuser/pymdown-extensions/blob/01c91ce79c91304c22b4e3d7a9261accc931d707/pymdownx/slugs.py#L59-L65)

Use this setting to change the function for generating URL-compatible slugs from categories. By default, the [`slugify`](https://github.com/facelessuser/pymdown-extensions/blob/01c91ce79c91304c22b4e3d7a9261accc931d707/pymdownx/slugs.py#L59-L65) function from [Python Markdown Extensions](https://facelessuser.github.io/pymdown-extensions/extras/slugs/) is used as follows:

```
<span></span><nav></nav><code><span id="__span-44-1"><span>plugins</span><span>:</span>
</span><span id="__span-44-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-44-3"><span>      </span><span>categories_slugify</span><span>:</span><span> </span><span>!!python/object/apply:pymdownx.slugs.slugify</span>
</span><span id="__span-44-4"><span>        </span><span>kwds</span><span>:</span>
</span><span id="__span-44-5"><span>          </span><span>case</span><span>:</span><span> </span><span>lower</span>
</span></code>
```

The default configuration is Unicode-aware and should produce good slugs for all languages. Of course, you can also provide a custom slugification function for more granular control.

___

#### `categories_slugify_separator`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_slugify_separator "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`-`

Use this setting to change the separator that is passed to the slugification function set as part of [`categories_slugify`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_slugify). While the default is a hyphen, it can be set to any string, e.g., `_`:

```
<span></span><nav></nav><code><span id="__span-45-1"><span>plugins</span><span>:</span>
</span><span id="__span-45-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-45-3"><span>      </span><span>categories_slugify_separator</span><span>:</span><span> </span><span>_</span>
</span></code>
```

___

#### `categories_sort_by`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_sort_by "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.45.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.45.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`material.plugins.blog.view_name`

Use this setting to specify a custom function for sorting categories. For example, if you want to sort categories by the number of posts they contain, use the following configuration:

```
<span></span><nav></nav><code><span id="__span-46-1"><span>plugins</span><span>:</span>
</span><span id="__span-46-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-46-3"><span>      </span><span>categories_sort_by</span><span>:</span><span> </span><span>!!python/name:material.plugins.blog.view_post_count</span>
</span></code>
```

Don't forget to enable [`categories_sort_reverse`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_sort_reverse). You can define your own comparison function, which must return something that can be compared while sorting, i.e., a string or number.

___

#### `categories_sort_reverse`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_sort_reverse "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.45.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.45.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`false`

Use this setting to reverse the order in which categories are sorted. By default, categories are sorted in ascending order, but you can reverse ordering as follows:

```
<span></span><nav></nav><code><span id="__span-47-1"><span>plugins</span><span>:</span>
</span><span id="__span-47-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-47-3"><span>      </span><span>categories_sort_reverse</span><span>:</span><span> </span><span>true</span>
</span></code>
```

___

#### `categories_allowed`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_allowed "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0)[](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value is empty")

The plugin allows to check categories against a predefined list, in order to catch typos or make sure that categories are not arbitrarily added. Specify the categories you want to allow with:

```
<span></span><nav></nav><code><span id="__span-48-1"><span>plugins</span><span>:</span>
</span><span id="__span-48-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-48-3"><span>      </span><span>categories_allowed</span><span>:</span>
</span><span id="__span-48-4"><span>        </span><span>-</span><span> </span><span>Search</span>
</span><span id="__span-48-5"><span>        </span><span>-</span><span> </span><span>Performance</span>
</span></code>
```

The plugin stops the build if a post references a category that is not part of this list. Posts can be assigned to categories by using the [`categories`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.categories) metadata property.

___

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.44.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.44.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`true`

Use this setting to enable or disable pagination for category pages. The value of this setting is inherited from [`pagination`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.pagination), unless it's explicitly set. To disable pagination, use:

```
<span></span><nav></nav><code><span id="__span-49-1"><span>plugins</span><span>:</span>
</span><span id="__span-49-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-49-3"><span>      </span><span>categories_pagination</span><span>:</span><span> </span><span>false</span>
</span></code>
```

___

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.44.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.44.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`10`

Use this setting to change the number of posts rendered per category page. The value of this setting is inherited from [`pagination_per_page`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.pagination_per_page), unless it's explicitly set. To change it, use:

```
<span></span><nav></nav><code><span id="__span-50-1"><span>plugins</span><span>:</span>
</span><span id="__span-50-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-50-3"><span>      </span><span>categories_pagination_per_page</span><span>:</span><span> </span><span>5</span>
</span></code>
```

___

#### `categories_toc`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_toc "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`false`

Use this setting to leverage the table of contents to display post titles on all category pages. The value of this setting is inherited from [`blog_toc`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.blog_toc), unless it's explicitly set. To change it, use:

```
<span></span><nav></nav><code><span id="__span-51-1"><span>plugins</span><span>:</span>
</span><span id="__span-51-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-51-3"><span>      </span><span>categories_toc</span><span>:</span><span> </span><span>true</span>
</span></code>
```

### Authors[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#authors "Permanent link")

The following settings are available for authors:

___

#### `authors`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.authors "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`true`

Use this setting to enable or disable post authors. If this setting is enabled, the plugin will look for a file named [`.authors.yml`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.authors_file) and render authors in posts and views. Disable this behavior with:

```
<span></span><nav></nav><code><span id="__span-52-1"><span>plugins</span><span>:</span>
</span><span id="__span-52-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-52-3"><span>      </span><span>authors</span><span>:</span><span> </span><span>false</span>
</span></code>
```

___

#### `authors_file`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.authors_file "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`{blog}/.authors.yml`

Use this setting to change the path of the file where the author information for your posts resides. It's normally not necessary to change this setting, but if you need to, use:

```
<span></span><nav></nav><code><span id="__span-53-1"><span>plugins</span><span>:</span>
</span><span id="__span-53-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-53-3"><span>      </span><span>authors_file</span><span>:</span><span> </span><span>"{blog}/.authors.yml"</span>
</span></code>
```

The following placeholders are available:

-   `blog` – [`blog` directory](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.blog_dir)

The provided path is resolved from the [`docs` directory](https://www.mkdocs.org/user-guide/configuration/#docs_dir).

Format of author information

The `.authors.yml` file must adhere to the following format:

.authors.yml

```
<span></span><nav></nav><code><span id="__span-54-1"><span>authors</span><span>:</span>
</span><span id="__span-54-2"><span>  </span><span>&lt;author&gt;</span><span>:</span>
</span><span id="__span-54-3"><span>    </span><span>name</span><span>:</span><span> </span><span>string</span><span>        </span><span># Author name</span>
</span><span id="__span-54-4"><span>    </span><span>description</span><span>:</span><span> </span><span>string</span><span> </span><span># Author description</span>
</span><span id="__span-54-5"><span>    </span><span>avatar</span><span>:</span><span> </span><span>url</span><span>         </span><span># Author avatar</span>
</span><span id="__span-54-6"><span>    </span><span>slug</span><span>:</span><span> </span><span>url</span><span>           </span><span># Author profile slug</span>
</span><span id="__span-54-7"><span>    </span><span>url</span><span>:</span><span> </span><span>url</span><span>            </span><span># Author website URL</span>
</span></code>
```

Note that `<author>` must be set to an identifier for associating authors with posts, e.g., a GitHub username like `squidfunk`. This identifier can then be used in the [`authors`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.authors) metadata property of a post. Multiple authors are supported. As an example, see [the `.authors.yml` file](https://github.com/squidfunk/mkdocs-material/blob/master/docs/blog/.authors.yml) we're using for our blog.

___

#### `authors_profiles`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.authors_profiles "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.46.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.46.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`false`

Use this setting to enable or disable automatically generated author profiles. An author profile shows all posts by an author in reverse chronological order. You can enable author profiles with:

```
<span></span><nav></nav><code><span id="__span-55-1"><span>plugins</span><span>:</span>
</span><span id="__span-55-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-55-3"><span>      </span><span>authors_profiles</span><span>:</span><span> </span><span>true</span>
</span></code>
```

___

#### `authors_profiles_name`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.authors_profiles_name "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.46.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.46.0)[](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value is computed")

Use this setting to change the title of the authors section the plugin adds to the navigation. If this setting is omitted, it's sourced from the translations. If you want to change it, use:

```
<span></span><nav></nav><code><span id="__span-56-1"><span>plugins</span><span>:</span>
</span><span id="__span-56-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-56-3"><span>      </span><span>authors_profiles_name</span><span>:</span><span> </span><span>Authors</span>
</span></code>
```

___

#### `authors_profiles_url_format`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.authors_profiles_url_format "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.46.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.46.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`author/{slug}`

Use this setting to change the format string that is used when generating author profile URLs. You can freely combine placeholders, and join them with slashes or other characters:

```
<span></span><nav></nav><code><span id="__span-57-1"><span>plugins</span><span>:</span>
</span><span id="__span-57-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-57-3"><span>      </span><span>authors_profiles_url_format</span><span>:</span><span> </span><span>"author/{slug}"</span>
</span></code>
```

The following placeholders are available:

-   `slug` – Author slug or identifier from [`authors_file`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.authors_file)
-   `name` – Author name from [`authors_file`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.authors_file)

___

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.46.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.46.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`true`

Use this setting to enable or disable pagination for author profiles. The value of this setting is inherited from [`pagination`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.pagination), unless it's explicitly set. To disable pagination, use:

```
<span></span><nav></nav><code><span id="__span-59-1"><span>plugins</span><span>:</span>
</span><span id="__span-59-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-59-3"><span>      </span><span>authors_profiles_pagination</span><span>:</span><span> </span><span>false</span>
</span></code>
```

___

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.46.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.46.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`10`

Use this setting to change the number of posts rendered per archive page. The value of this setting is inherited from [`pagination_per_page`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.pagination_per_page), unless it's explicitly set. To change it, use:

```
<span></span><nav></nav><code><span id="__span-60-1"><span>plugins</span><span>:</span>
</span><span id="__span-60-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-60-3"><span>      </span><span>authors_profiles_pagination_per_page</span><span>:</span><span> </span><span>5</span>
</span></code>
```

___

#### `authors_profiles_toc`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.authors_profiles_toc "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.46.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.46.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`false`

Use this setting to leverage the table of contents to display post titles on all author profiles. The value of this setting is inherited from [`blog_toc`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.blog_toc), unless it's explicitly set. To change it, use:

```
<span></span><nav></nav><code><span id="__span-61-1"><span>plugins</span><span>:</span>
</span><span id="__span-61-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-61-3"><span>      </span><span>authors_profiles_toc</span><span>:</span><span> </span><span>true</span>
</span></code>
```

The following settings are available for pagination:

___

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`true`

Use this setting to enable or disable pagination in views – generated pages that show posts or subsets of posts in reverse chronological order. If you want to disable pagination, use:

```
<span></span><nav></nav><code><span id="__span-62-1"><span>plugins</span><span>:</span>
</span><span id="__span-62-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-62-3"><span>      </span><span>pagination</span><span>:</span><span> </span><span>false</span>
</span></code>
```

___

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`10`

Use this setting to change the number of posts rendered per page. If you have rather long post excerpts, it can be a good idea to reduce the number of posts per page:

```
<span></span><nav></nav><code><span id="__span-63-1"><span>plugins</span><span>:</span>
</span><span id="__span-63-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-63-3"><span>      </span><span>pagination_per_page</span><span>:</span><span> </span><span>5</span>
</span></code>
```

___

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`page/{page}`

Use this setting to change the format string that is used when generating paginated view URLs. You can freely combine placeholders, and join them with slashes or other characters:

```
<span></span><nav></nav><code><span id="__span-64-1"><span>plugins</span><span>:</span>
</span><span id="__span-64-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-64-3"><span>      </span><span>pagination_url_format</span><span>:</span><span> </span><span>"page/{page}"</span>
</span></code>
```

The following placeholders are available:

-   `page` – Page number

___

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`~2~`

The plugin uses the [paginate](https://pypi.org/project/paginate/) module to generate the pagination markup using a special syntax. Use this setting to customize how pagination is constructed. Some popular choices:

```
<span></span><nav></nav><code><span id="__span-66-1"><span>plugins</span><span>:</span>
</span><span id="__span-66-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-66-3"><span>      </span><span>pagination_format</span><span>:</span><span> </span><span>"~2~"</span>
</span></code>
```

The following placeholders are supported by [paginate](https://pypi.org/project/paginate/):

-   `$first_page` – Number of first reachable page
-   `$last_page` – Number of last reachable page
-   `$page` – Number of currently selected page
-   `$page_count` – Number of reachable pages
-   `$items_per_page` – Maximal number of items per page
-   `$first_item` – Index of first item on the current page
-   `$last_item` – Index of last item on the current page
-   `$item_count` – Total number of items
-   `$link_first` – Link to first page (unless on first page)
-   `$link_last` – Link to last page (unless on last page)
-   `$link_previous` – Link to previous page (unless on first page)
-   `$link_next` – Link to next page (unless on last page)

___

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`false`

Use this setting to control whether pagination should be automatically disabled when the view only consists of a single page. If you want to always render pagination, use:

```
<span></span><nav></nav><code><span id="__span-69-1"><span>plugins</span><span>:</span>
</span><span id="__span-69-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-69-3"><span>      </span><span>pagination_if_single_page</span><span>:</span><span> </span><span>true</span>
</span></code>
```

___

#### `pagination_keep_content`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.pagination_keep_content "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`false`

Use this setting to enable or disable persistence of content, i.e., if paginated views should also display the content of their containing view. If you want to enable this behavior, use:

```
<span></span><nav></nav><code><span id="__span-70-1"><span>plugins</span><span>:</span>
</span><span id="__span-70-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-70-3"><span>      </span><span>pagination_keep_content</span><span>:</span><span> </span><span>true</span>
</span></code>
```

### Drafts[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#drafts "Permanent link")

The following settings are available for drafts:

___

#### `draft`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.draft "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`false`

Rendering [draft posts](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.draft) can be useful in deploy previews. Use this setting to specify whether the plugin should include posts marked as drafts when [building your project](https://squidfunk.github.io/mkdocs-material/creating-your-site/#building-your-site):

```
<span></span><nav></nav><code><span id="__span-71-1"><span>plugins</span><span>:</span>
</span><span id="__span-71-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-71-3"><span>      </span><span>draft</span><span>:</span><span> </span><span>true</span>
</span></code>
```

___

#### `draft_on_serve`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.draft_on_serve "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`true`

Use this setting to control whether the plugin should include posts marked as drafts when [previewing your site](https://squidfunk.github.io/mkdocs-material/creating-your-site/#previewing-as-you-write). If you don't wish to include draft posts when previewing, use:

```
<span></span><nav></nav><code><span id="__span-73-1"><span>plugins</span><span>:</span>
</span><span id="__span-73-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-73-3"><span>      </span><span>draft_on_serve</span><span>:</span><span> </span><span>false</span>
</span></code>
```

___

#### `draft_if_future_date`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.draft_if_future_date "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`false`

The plugin can automatically mark posts with future dates as drafts. When the date is past today, the post is automatically included when [building your project](https://squidfunk.github.io/mkdocs-material/creating-your-site/#building-your-site), unless explicitly marked as draft:

```
<span></span><nav></nav><code><span id="__span-74-1"><span>plugins</span><span>:</span>
</span><span id="__span-74-2"><span>  </span><span>-</span><span> </span><span>blog</span><span>:</span>
</span><span id="__span-74-3"><span>      </span><span>draft_if_future_date</span><span>:</span><span> </span><span>true</span>
</span></code>
```

## Usage[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#usage "Permanent link")

### Metadata[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#metadata "Permanent link")

Posts can define a handful of metadata properties that specify how the plugin renders them, in which views they are integrated, and how they are linked to each other. The metadata of each post is validated against a schema to allow for a quicker discovery of syntax errors.

The following properties are available:

___

#### `authors`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.authors "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0)[](https://squidfunk.github.io/mkdocs-material/conventions/#metadata "Metadata property")[](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value is empty")

Use this property to associate a post with [authors](https://squidfunk.github.io/mkdocs-material/plugins/blog/#authors) by providing a list of identifiers as defined in the [`authors_file`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.authors_file). If an author can't be resolved, the plugin will terminate with an error:

```
<span></span><nav></nav><code><span id="__span-75-1"><span>---</span>
</span><span id="__span-75-2"><span>authors</span><span>:</span>
</span><span id="__span-75-3"><span>  </span><span>-</span><span> </span><span>squidfunk</span><span> </span><span></span>
</span><span id="__span-75-4"><span>---</span>
</span><span id="__span-75-5">
</span><span id="__span-75-6"><span># Post title</span>
</span><span id="__span-75-7"><span>...</span>
</span></code>
```

___

#### `categories`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.categories "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0)[](https://squidfunk.github.io/mkdocs-material/conventions/#metadata "Metadata property")[](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value is empty")

Use this property to associate a post with one or more [categories](https://squidfunk.github.io/mkdocs-material/plugins/blog/#categories), making the post a part of the generated category page. Categories are defined as a list of strings (whitespaces are allowed):

```
<span></span><nav></nav><code><span id="__span-76-1"><span>---</span>
</span><span id="__span-76-2"><span>categories</span><span>:</span>
</span><span id="__span-76-3"><span>  </span><span>-</span><span> </span><span>Search</span>
</span><span id="__span-76-4"><span>  </span><span>-</span><span> </span><span>Performance</span>
</span><span id="__span-76-5"><span>---</span>
</span><span id="__span-76-6">
</span><span id="__span-76-7"><span># Post title</span>
</span><span id="__span-76-8"><span>...</span>
</span></code>
```

If you want to prevent accidental typos assigning categories to posts, you can set a predefined list of allowed categories in `mkdocs.yml` by using the [`categories_allowed`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.categories_allowed) setting.

___

#### `date`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.date "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0)[](https://squidfunk.github.io/mkdocs-material/conventions/#metadata "Metadata property")[](https://squidfunk.github.io/mkdocs-material/conventions/#required "Required value")

Use this property to specify a post's date. Note that this property is required, which means the build fails when it's not set. Additional dates can be set by using a slightly different syntax:

```
<span></span><nav></nav><code><span id="__span-77-1"><span>---</span>
</span><span id="__span-77-2"><span>date</span><span>:</span><span> </span><span>2024-01-31</span>
</span><span id="__span-77-3"><span>---</span>
</span><span id="__span-77-4">
</span><span id="__span-77-5"><span># Post title</span>
</span><span id="__span-77-6"><span>...</span>
</span></code>
```

The following date formats are supported:

-   `2024-01-31`
-   `2024-01-31T12:00:00`

___

#### `draft`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.draft "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0)[](https://squidfunk.github.io/mkdocs-material/conventions/#metadata "Metadata property")[](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value is empty")

Use this property to mark a post as draft. The plugin allows to include or exclude posts marked as drafts when [building your project](https://squidfunk.github.io/mkdocs-material/creating-your-site/#building-your-site) using the [`draft`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.draft) setting. Mark a post as draft with:

```
<span></span><nav></nav><code><span id="__span-80-1"><span>---</span>
</span><span id="__span-80-2"><span>draft</span><span>:</span><span> </span><span>true</span>
</span><span id="__span-80-3"><span>---</span>
</span><span id="__span-80-4">
</span><span id="__span-80-5"><span># Post title</span>
</span><span id="__span-80-6"><span>...</span>
</span></code>
```

___

#### `pin`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.pin "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.53.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.53.0) [](https://squidfunk.github.io/mkdocs-material/conventions/#metadata "Metadata property")[](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value")`false`[](https://squidfunk.github.io/mkdocs-material/conventions/#experimental "Experimental")

Use this property to pin a post to the top of a view. In case multiple posts are pinned, the pinned posts are sorted by descending order and appear before all other posts. Pin a post with:

```
<span></span><nav></nav><code><span id="__span-81-1"><span>---</span>
</span><span id="__span-81-2"><span>pin</span><span>:</span><span> </span><span>true</span>
</span><span id="__span-81-3"><span>---</span>
</span><span id="__span-81-4">
</span><span id="__span-81-5"><span># Post title</span>
</span><span id="__span-81-6"><span>...</span>
</span></code>
```

___

#### `links`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.links "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/insiders/ "Sponsors only")[](https://squidfunk.github.io/mkdocs-material/conventions/#version-insiders "Minimum version")[insiders-4.23.0](https://squidfunk.github.io/mkdocs-material/insiders/changelog/#4.23.0)[](https://squidfunk.github.io/mkdocs-material/conventions/#metadata "Metadata property")[](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value is empty")[](https://squidfunk.github.io/mkdocs-material/conventions/#experimental "Experimental")

Use this property to define a list of links that are rendered in the sidebar of a post. The property follows the same syntax as [`nav`](https://www.mkdocs.org/user-guide/configuration/#nav) in `mkdocs.yml`, supporting sections and even anchors:

```
<span></span><nav></nav><code><span id="__span-82-1"><span>---</span>
</span><span id="__span-82-2"><span>links</span><span>:</span>
</span><span id="__span-82-3"><span>  </span><span>-</span><span> </span><span>setup/setting-up-site-search.md</span>
</span><span id="__span-82-4"><span>  </span><span>-</span><span> </span><span>insiders/index.md</span>
</span><span id="__span-82-5"><span>---</span>
</span><span id="__span-82-6">
</span><span id="__span-82-7"><span># Post title</span>
</span><span id="__span-82-8"><span>...</span>
</span></code>
```

All relative links are resolved from the [`docs` directory](https://www.mkdocs.org/user-guide/configuration/#docs_dir).

___

#### `readtime`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.readtime "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0)[](https://squidfunk.github.io/mkdocs-material/conventions/#metadata "Metadata property")[](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value is computed")

Use this property to explicitly set the reading time of a post in minutes. When [`post_readtime`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_readtime) is enabled, the plugin computes the reading time of a post, which can be overridden with:

```
<span></span><nav></nav><code><span id="__span-85-1"><span>---</span>
</span><span id="__span-85-2"><span>readtime</span><span>:</span><span> </span><span>15</span>
</span><span id="__span-85-3"><span>---</span>
</span><span id="__span-85-4">
</span><span id="__span-85-5"><span># Post title</span>
</span><span id="__span-85-6"><span>...</span>
</span></code>
```

___

#### `slug`[¶](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.slug "Permanent link")

[](https://squidfunk.github.io/mkdocs-material/conventions/#version "Minimum version")[9.2.0](https://squidfunk.github.io/mkdocs-material/changelog/#9.2.0)[](https://squidfunk.github.io/mkdocs-material/conventions/#metadata "Metadata property")[](https://squidfunk.github.io/mkdocs-material/conventions/#default "Default value is computed")

Use this property to explicitly set the slug of a post. By default, the slug of a post is automatically computed by the [`post_slugify`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_slugify) function from the post's title, which can be overridden with:

```
<span></span><nav></nav><code><span id="__span-86-1"><span>---</span>
</span><span id="__span-86-2"><span>slug</span><span>:</span><span> </span><span>help-im-trapped-in-a-universe-factory</span>
</span><span id="__span-86-3"><span>---</span>
</span><span id="__span-86-4">
</span><span id="__span-86-5"><span># Post title</span>
</span><span id="__span-86-6"><span>...</span>
</span></code>
```

Slugs are passed to [`post_url_format`](https://squidfunk.github.io/mkdocs-material/plugins/blog/#config.post_url_format).

___

Missing something?

When setting up your blog or migrating from another blog framework, you might discover that you're missing specific functionality – we're happy to consider adding it to the plugin! You can [open a discussion](https://github.com/squidfunk/mkdocs-material/discussions) to ask a question, or create a [change request](https://squidfunk.github.io/mkdocs-material/contributing/requesting-a-change/) on our [issue tracker](https://github.com/squidfunk/mkdocs-material/issues), so we can find out if it might be a good fit for the plugin.
