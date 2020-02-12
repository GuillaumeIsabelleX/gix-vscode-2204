# vscode

<img src="https://assets.gitlab-static.net/uploads/-/system/project/avatar/13865455/1200px-Visual_Studio_Code_1.35_icon.svg.png" width="200" height="200"/>

## INDEX

- [vscode](#vscode)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/vscode/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/vscode/commits/master)

## INTRODUCTION

Docker image of :

- [vscode](https://code.visualstudio.com/)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/vscode/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/vscode/).

## PREREQUISITES

Use [docker](https://www.docker.com)

## INSTALL

```docker run -d --name vscode -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v ${HOME}:/home/vscode -e DISPLAY --privileged --network host alexandreoda/vscode```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/vscode/blob/master/LICENSE)
