# templatenotebook
A template for new Jupyter Notebooks to be deployed to JupyterHub

## Instructions
Follow the steps below to get started with a new notebook repository

**Steps**
1. [Create a new repository](#create-a-new-repository)
2. [Clone your newly created repository](#clone-your-newly-created-repository)
3. [Replace template strings](#replace-template-strings)
4. [Replace README](#replace-readme)
5. [Set up project in CircleCI](#set-up-project-in-circleci)
6. [Deploying your notebooks](#deploying-your-notebooks)

### [Create a new repository](#create-a-new-repository)
Create a new repository from the `templatenotebook` template here:
https://github.com/organizations/expel-io/repositories/new

### [Clone your newly created repository](#clone-your-newly-created-repository)
Navigate to your new repository and clone it locally like this:
```
git clone git@github.com:expel-io/<your repository>.git
```

### [Replace template strings](#replace-template-strings)
Replace occurrences of `templatenotebook` with `<yourappname>`:
**CentOS**
```
find . -type f -not -path "./.git/*" -exec sed -i 's/templatenotebook/<yourappname>/g' {} +;`
```
**MacOS**
```
LC_ALL=C find . -type f -not -path "./.git/*" -exec sed -i '' 's/templatenotebook/<yourappname>/g' {} +;
```

### [Replace README](#replace-readme)
* Replace this README.md with a meaningful one for your application.
* If you want a Build Status button for your application, create an API token for your application in CircleCI and then use that token in your README.md.

### [Set up project in CircleCI](#set-up-project-in-circleci)
Follow the steps documented on the Confluence page here to set up CircleCI:
https://expel-io.atlassian.net/wiki/spaces/INFRA/pages/21856258/Create+a+New+Application#CreateaNewApplication-Build

### [Deploying your notebooks](#deploying-your-notebooks)
* Merging master will build a RPM and push it to Artifactory
* Merging master will kick off deployment on JupyterHub in staging
* Tagging a release will kick off deployment on JupyterHub in production