# every.hs

every is a simple tool, that shows every *n*'th line (hence the name) or up to *m* lines every (*n-1*)'th line of its stdin.

It can be used as a poor-man's status monitor for output intense programs.

Simply compile it using ghc.

    ghc -O2 every.hs

## Usage:

    every [n] [m]


## Examples:

```
jot 10 | every 3
``` 

produces

```
3
6
9
``` 

and

```
jot 10 | every 4 3
``` 

produces

```
4
5
6
10
```
