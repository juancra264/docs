# Poetry install in linux

Installing poetry on linux:
```bash
curl -sSL https://install.python-poetry.org | python3 -
```
Check poetry version
```bash
poetry --version
```
Update Poetry
```bash
poetry self update
```
Uninstall Poetry
```bash
curl -sSL https://install.python-poetry.org | python3 - --uninstall
```
Enable tab completion for Bash
```
poetry completions bash >> ~/.bash_completion
```