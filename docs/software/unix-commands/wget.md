---
created: 2023-06-05T13:16:20+10:00
updated: 2023-06-05T13:16:20+10:00
---
# wget

Save to specified file:

    wget \
      --directory-prefix example.com.html \
      http://example.com

Save to specified file:

    wget -O example.com.html http://example.com

stdout:

    wget -O- http://example.com

## Mirror a website

```
wget --mirror --convert-links --adjust-extension --page-requisites http://www.mywebsite.com/
```

wget --mirror --convert-links --adjust-extension --page-requisites --span-hosts -U Mozilla -e robots=off --no-cookies -D www.mywebsite.com,files.mywebsite.com,images.somewhere.com http://www.mywebsite.com/