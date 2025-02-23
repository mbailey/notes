## Hosting on user-images.githubusercontent.com subdomain

- Users risk unknowingly publishing sensitive material on public web when using GitHub.
- Dragging certain files into GitHub Issue or Markdown file using GitHub Web causes upload to public site.
- Assets are published using an obscure URL.
- Removing file requires contact with GitHub support

Dragging an asset (image, video, document, etc) into a GitHub.com Issue or
editing window (for a Markdown file in the repo) will result in the asset being
immediately uploaded to a publicly accessible URL location, even if the repo
you're editing is not public.

The URL looks something like the real example below:

![example file](https://user-images.githubusercontent.com/4409/191630770-ae8ea473-a0e8-47f1-9ad4-f8fde4f0af99.jpg)

`https://user-images.githubusercontent.com/4409/191630770-ae8ea473-a0e8-47f1-9ad4-f8fde4f0af99.jpg`

GitHub advise against using this for sensitive media.

> To host your images, GitHub uses the [open-source project Camo](https://github.com/atmos/camo). Camo generates an anonymous URL proxy for each file which hides your browser details and related information from other users. The URL starts `https://<subdomain>.githubusercontent.com/`, with different subdomains depending on how you uploaded the image.
>
> Videos also get anonymized URLs with the same format as image URLs, but are not processed through Camo. This is because GitHub does not support externally hosted videos, so the anonymized URL is a link to the uploaded video hosted by GitHub.
>
> ==Anyone who receives your anonymized URL, directly or indirectly, may view your image or video. To keep sensitive media files private, restrict them to a private network or a server that requires authentication instead of using Camo.==
>
> - [Anonymised URLs - GitHub.com](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/about-anonymized-urls)


