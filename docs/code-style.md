# code-style

## Align Line continuations (\\)

**VIM**: `glip\` ([vim-lion](https://github.com/tommcdo/vim-lion))

 
 Great question:
> When working in the C language, sometimes you have to write multi line macros like the following.
> 
>     #define SOME_FUNCTION_LIKE_MACRO(a,b)     \
>        foo(a);                                \
>        bar(b);                                \
>        baz(a+b);
> 
> Typically, after a few iterations of editing your code, the backslashes end up unaligned like:
> 
>     #define SOME_FUNCTION_LIKE_MACRO(a,b)             \
>        foo(a);                 \
>        bar(b);                                  \
>        baz(a+b);
> 
> And it drives me crazy. I always end up wasting a lot of time manually aligning them. 
>
> [stackexchange.com](https://vi.stackexchange.com/questions/17128/working-with-line-continuations)



Great answer:

> - `glip\` ([vim-lion](https://github.com/tommcdo/vim-lion))
> - https://github.com/junegunn/vim-easy-align
> - https://github.com/godlygeek/tabular
> - http://drchip.org/astronaut/vim/index.html#ALIGN
> 
> [Answer](https://vi.stackexchange.com/a/17130)