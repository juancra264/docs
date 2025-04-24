Install the poetry venv in the same project forder:

```bash
poetry config virtualenvs.in-project true
```

Init project:
```
poetry init
```

Or install a current enviroment:

```bash
poetry install
```

Add modules or libraries:

```
poetry add {librery/modules}
```

Add modules or libraries to development:
```
poetry add pytest flake8 --dev
```

Get enviroment info
```
poetry env info -p
```

Show dependencies:
```
poetry show --tree
```
```
poetry show
```

Run your script:
```
poetry run python your_script.py
````

Update modules or libraries:
```
poetry update
````

Remove modules or libraries:
```
poetry remove {librery/module}
```

poetry new {new proyect}

shows the name of the current environment**
```
poetry env list
```

Remove the current poetry venv.
```
poetry env remove <current environment>
```
