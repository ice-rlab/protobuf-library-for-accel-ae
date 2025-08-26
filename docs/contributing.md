# Contributing Guidelines

> [!IMPORTANT]
> This guidelines ONLY apply to the protocol buffers work done by the [ICE-RLab](https://www.github.com/ice-rlab). They do not apply to the protocol buffers work done by Google (and S Karandikar, et. al.)

## Software and Hardware Guidelines

Contributions are accepted through Pull Requests to the corresponding repository.

## Docs Guidelines

### Recommended Pre-requisites

The following tools are recommended to have installed to contribute to the docs:

- [MkDocs](mkdocs.org)
- [GitHub Admonitions for MkDocs plugin](https://github.com/PGijsbers/admonitions)

> [!NOTE]
> The docs website is generated with [MkDocs](mkdocs.org) which is a static site generator.
>
> Why Markdown instead of reStructuredText? Why MkDocs instead of another static site generator? 
>
> One of the goals is to entice docs contributions. We expect Markdown to be familiar to potential docs contributors. MkDocs will most likely not be familiar, however, we expect it to be straighforward without much complexity. We feel confident that our choices keep the barrier to contribute to these docs low. If you disagree feel free to open an issue in the [ice-rlab/protobuf-library-for-accel-ae](https://www.github.com/ice-rlab/protobuf-library-for-accel-ae).
>
> Admonitions (like this one) are written as GitHub admonitions which the GitHub Admonitions for MkDocs plugin then converts into MkDocs admonitions. This allows the admonitions in the docs to be viewable in GitHub and in website form.

Install MkDocs and the GitHub Admonition for MkDocs plugin as Python packages with your Python package manager of choice in your Python (v)env of choice. The following command uses `pip` to install them in your default Python (v)env:

```bash
pip install mkdocs mkdocs-github-admonitions-plugin
```

### Working with MkDocs

Check out MkDocs' [Getting Started](https://www.mkdocs.org/getting-started/) and [User Guide](https://www.mkdocs.org/user-guide/) pages to get you up to speed on how to add new pages and have them show up on the nav bar, seeing your changes on your local browser and changing the MkDocs configuration to make these docs better!

### Writing/Editing Docs Guidelines

#### Admonitions (aka Alerts)

Admonitions, such as the note messages you've probably seen in the docs, must follow the GitHub admonition style as specified in the [Alerts section](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts) of the GitHub docs.

### Deploying the Docs

> [!IMPORTANT]
> Deploying docs is a manual process done from a local [ice-rlab/protobuf-library-for-accel-ae](https://www.github.com/ice-rlab/protobuf-library-for-accel-ae) repo. Therefore, make sure to have the latest changes to the docs before deploying.
>
> This could be automated with a GitHub Actions workflow. It hasn't been necessary so far.

To deploy the docs to the GitHub Pages site execute the command:

```bash
mkdocs gh-deploy
```

