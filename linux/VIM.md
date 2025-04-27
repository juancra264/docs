**Modos:**

<Esc>     NORMAL
i              INSERT
v             VISUAL
R             REPLACE
:              COMMAND-LINE (also known as the command prompt)
<C-v>     VISUAL-BLOCK

**Find a word in Vim or vi text editor**

To search using Vim/vi, for the current word:

1. In normal mode, you can search forward or backward.
2. One can search forward in vim/vi by pressing **/** and then typing your search pattern/word.
3. To search backward in vi/vim by pressing **?** and then typing your search pattern/word.
4. Once word found in vim, you can press the **n** key to go directly to the next occurrence of the word in backwards. Press the **N** key to go directly to the opposite direction, i.e. forwards.

**Search and Replace Within the Current Buffer**

:[range]s/{pattern}/{replacement}/[flags]

example:

:%s/DataStore/VimStore/g

**Comandos Utiles**

:q!ENTER       sale de vi sin grabar cambios

/expresiónENTER busca la expresión indicada

dd : Borra lineas

x: Borra caracteres

u: deshace el cambio

Y o yy copiar línea

P pegar antes del cursor

p pegar después del cursor

yw copiar palabra

y$ copiar de cursor a fin de línea

ctrl+f – Jump forward one full screen.

ctrl+b – Jump backwards one full screen

ctrl+d – Jump forward (down) a half screen

ctrl+u – Jump back (up) one half screen

G – Go to the end of the file.

gg – Go to the beginning of the file.

ZZ –  grabar cambios si los hubo y salir

**Cut and paste:**

Position the cursor where you want to begin cutting.

Press v to select characters (or uppercase V to select whole lines, or Ctrl-v to select rectangular blocks).

Move the cursor to the end of what you want to cut.

Press d to cut (or y to copy).

Move to where you would like to paste.

Press P to paste before the cursor, or p to paste after.

d stands for delete in Vim, which in other editors is usually called cut

y stands for yank in Vim, which in other editors is usually called copy