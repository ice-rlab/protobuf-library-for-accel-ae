# Contributing to the Docs

## Recommended Pre-requisites

The following tools are recommended to have installed to contribute to the docs:

- [MkDocs](mkdocs.org)
- [GitHub Admonitions for MkDocs plugin](https://github.com/PGijsbers/admonitions)

> [!NOTE]
> The docs website is generated with [MkDocs](mkdocs.org) which is a static site generator. 
>
> Admonitions (like this one) are written as GitHub admonitions which the GitHub Admonitions for MkDocs plugin then converts into MkDocs admonitions. This allows the admonitions in the docs to be viewable in GitHub and in website form.

Install MkDocs and the GitHub Admonition for MkDocs plugin as Python packages with your Python package manager of choice in your Python (v)env of choice. The following command uses `pip` to install them in your default Python (v)env:

```bash
pip install mkdocs mkdocs-github-admonitions-plugin
```

## Working with MkDocs

Check out MkDocs' [Getting Started](https://www.mkdocs.org/getting-started/) and [User Guide](https://www.mkdocs.org/user-guide/) pages to get you up to speed on how to add new pages and have them show up on the nav bar, seeing your changes on your local browser and changing the MkDocs configuration to make these docs better!

## Docs Guidelines

### Admonitions (aka Alerts)

Admonitions must follow the GitHub admonition style as specified in the [Alerts section](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts) of the GitHub docs.
