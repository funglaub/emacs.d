# Emacs configuration

## Requirements
Works only with Emacs 24. Check out
[batsov's blog](http://batsov.com/articles/2011/10/09/getting-started-with-emacs-24/)
and [Emacs Redux](http://emacsredux.com/) to get an overview about some cool new
features in Emacs 24.

Packages are installed from Milkypostman’s Emacs Lisp Package Archive
([MELPA](http://melpa.org )) through [Cask](https://github.com/cask/cask).

## Installation

Install cask

```
brew install cask
```

To install all LISP packages from MELPA:

```
cask
```

You can update all your dependencies with:

```
cask update
```

Alternatively you can use Emacs' built-in package list and upgrade your packages
there (`M-x list-Packages`).

## Customisation

I tried to group all LISP code by major mode mostly with some exceptions like
key bindings that didn't fit anywhere else (cleaning up the whole mess is on my
agenda). There's a slim `init.el` with some very basic settings, most of the
work is done in separate files in `site-start.d` where you can adjust settings
to your needs.

To add new packages you wish to have installed automagically when running cask
(invoked directly or through the Makefile), add a line to `Cask`.

If you wish to add custom lisp libraries, place them in `site-lisp` which is part of
`autoload-path`.

## Credits

Heavily inspired by [batsov's Emacs prelude](http://batsov.com/prelude/)
and [technomancy's Emacs starter kit](https://github.com/technomancy/emacs-starter-kit)
