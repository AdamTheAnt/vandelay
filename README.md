# Vandelay industries

This docker image is in the LaTeX import/export business.  It is based on a
[Centos](https://hub.docker.com/_/centos/) 7 docker image.

The LaTeX installation packaged by CentOS doesn't allow you to manually install
packages from CTAN.  This image uses texlive to manage LaTeX packages so you
can install any packages you need since it bypasses the CentOS packages.

We're looking to [hire George Costanza as our latex
salesman](https://www.youtube.com/watch?v=_T35QhLx_KI).

## Using the image

Available from Docker hub: https://hub.docker.com/r/thiagofigueiro/vandelay/

If you already have a sphinx-doc project, you can compile like this:

```bash
docker run -itv $(pwd):/project thiagofigueiro/vandelay bash -c 'cd /project && make html && make latexpdf'

```

If you don't have a project, you can create one; e.g.:

```
docker run -itv $(pwd):/project thiagofigueiro/vandelay bash

[root@267754f4f45c /]# cd /project/
[root@267754f4f45c project]# sphinx-quickstart
Welcome to the Sphinx 1.4.8 quickstart utility.

Please enter values for the following settings (just press Enter to
accept a default value, if one is given in brackets).

Enter the root path for documentation.
> Root path for the documentation [.]:

You have two options for placing the build directory for Sphinx output.
Either, you use a directory "_build" within the root path, or you separate
"source" and "build" directories within the root path.
> Separate source and build directories (y/n) [n]:

Inside the root directory, two more directories will be created; "_templates"
for custom HTML templates and "_static" for custom stylesheets and other static
files. You can enter another prefix (such as ".") to replace the underscore.
> Name prefix for templates and static dir [_]:

The project name will occur in several places in the built documentation.
> Project name: myproject
> Author name(s): Thiago

Sphinx has the notion of a "version" and a "release" for the
software. Each version can have multiple releases. For example, for
Python the version is something like 2.5 or 3.0, while the release is
something like 2.5.1 or 3.0a1.  If you don't need this dual structure,
just set both to the same value.
> Project version: 1.0.0
> Project release [1.0.0]:

If the documents are to be written in a language other than English,
you can select a language here by its language code. Sphinx will then
translate text that it generates into that language.

For a list of supported codes, see
http://sphinx-doc.org/config.html#confval-language.
> Project language [en]:

The file name suffix for source files. Commonly, this is either ".txt"
or ".rst".  Only files with this suffix are considered documents.
> Source file suffix [.rst]:

One document is special in that it is considered the top node of the
"contents tree", that is, it is the root of the hierarchical structure
of the documents. Normally, this is "index", but if your "index"
document is a custom template, you can also set this to another filename.
> Name of your master document (without suffix) [index]:

Sphinx can also add configuration for epub output:
> Do you want to use the epub builder (y/n) [n]:

Please indicate if you want to use one of the following Sphinx extensions:
> autodoc: automatically insert docstrings from modules (y/n) [n]:
> doctest: automatically test code snippets in doctest blocks (y/n) [n]:
> intersphinx: link between Sphinx documentation of different projects (y/n) [n]:
> todo: write "todo" entries that can be shown or hidden on build (y/n) [n]:
> coverage: checks for documentation coverage (y/n) [n]:
> imgmath: include math, rendered as PNG or SVG images (y/n) [n]:
> mathjax: include math, rendered in the browser by MathJax (y/n) [n]:
> ifconfig: conditional inclusion of content based on config values (y/n) [n]:
> viewcode: include links to the source code of documented Python objects (y/n) [n]:
> githubpages: create .nojekyll file to publish the document on GitHub pages (y/n) [n]:

A Makefile and a Windows command file can be generated for you so that you
only have to run e.g. `make html' instead of invoking sphinx-build
directly.
> Create Makefile? (y/n) [y]:
> Create Windows command file? (y/n) [y]:

Creating file ./conf.py.
Creating file ./index.rst.
Creating file ./Makefile.
Creating file ./make.bat.

Finished: An initial directory structure has been created.

You should now populate your master file ./index.rst and create other documentation
source files. Use the Makefile to build the docs, like so:
   make builder
where "builder" is one of the supported builders, e.g. html, latex or linkcheck.
```

Or build it yourself by cloning this repo and then `docker built -t vandelay .`.


## Contents

This image contains:

* [Pandoc](http://pandoc.org/).  Useful for converting between formats; e.g. markdown to reST.
* [pypandoc](https://pypi.python.org/pypi/pypandoc). Use Pandoc from Python.
* [TeX Live](https://www.tug.org/texlive/)
* [Sphinx](http://www.sphinx-doc.org/en/stable/).
* [texttable](https://pypi.python.org/pypi/texttable/).  Use from Python to generate text ("ascii") tables in reST format.


### Locales

To make the image smaller I have removed all non-English locales from the
system.  If you find you need them back, find the line below in the
`Dockerfile` and remove/comment it:

```
 13     && localedef --list-archive | grep -v -i ^en | xargs localedef --delete-from-archive \
```

