Here is an article with **special formatting**.

``` command-line
$ echo 'input'
# Prints out 'input'
> input
```

{{#intro}}

This is an intro
I hope u liek it

{{/intro}}

``` helper
#### This is the helper title
This is the helper content
```

{{#mac}}

Mac-specific line one
Mac-specific line two

{{/mac}}

{{#windows}}

Windows-specific line one
Windows-specific line two

{{/windows}}

{{#linux}}

Linux-specific line one
Linux-specific line two

{{/linux}}

{{#all}}

All-platforms line one
All-platforms line two

{{/all}}

{{#tip}}

Here's a hot tip: line one
Here's a hot tip: line two

{{/tip}}

{{#warning}}

Yo, check this out: line one
Yo, check this out: line two

{{/warning}}

{{#error}}

Sheeeeit, this is a problem: line one
Sheeeeit, this is a problem: line two

{{/error}}

And that's the end

And what about code tags? `{{#windows}}`

This should not be in a tag.

And what about pre tags?

```
{{#windows}}
````

This should not be in a tag.
