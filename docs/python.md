# Python

Install and manage python versions using [pyenv].

## pyenv

This process uses [pyenv] to manage Python installation and versions. [pyenv] is a Python
version manager that can manage and install different versions of Python.

Install [pyenv] with [homebrew]

```shell
brew install pyenv
```

Add the following lines to update your `~/.zshrc` / `~/.zprofile` files,
instructing them to use [pyenv] to manage Python:

```shell
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

Install additional dependencies required to build Python

```shell
brew install openssl readline sqlite3 xz zlib tcl-tk
```

```shell
pyenv install 3.12
pyenv install 3.11
pyenv install 3.10
pyenv install 3.9
pyenv install 3.8
pyenv global 3.11 3.12 3.10 3.9 3.8
pyenv rehash
```

![pyenv.png](_static/pyenv.png)

## IPython

Install [IPython]

```shell
pip install 'ipython[zmq,qtconsole,notebook,test]'
```

![ipython.png](_static/ipython.png)

## pipx

Install [pipx]

pipx is a tool to help you install and run end-user applications written in
Python. It's roughly similar to macOS's brew, JavaScript's npx, and
Linux's apt.

It's closely related to pip. In fact, it uses pip, but is focused on installing
and managing Python packages that can be run from the command line directly as
applications.

```shell
brew install pipx
pipx ensurepath
```

Add the following lines to update your `~/.zshrc` file, instructing it to use
`pyenv`'s default Python version to bootstrap `pipx` applications:

```shell
export PIPX_DEFAULT_PYTHON=$(pyenv which python)
```

![pipx_demo.gif](_static/pipx_demo.gif)

[Python]: https://python.org/
[pipx]: https://github.com/pypa/pipx
[pyenv]: https://github.com/yyuu/pyenv
[IPython]: http://ipython.org/
[homebrew]: https://brew.sh/
