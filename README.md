## testgzip

Bash-function that shows resorce size in compressed and uncompressed form and helps you to determine whether its server supports gzip-compression at all.


#### Usage
Execute the script and you’ll have `testgzip` function in your shell. You may also copy its contents to your `.bash_profile`

Example:
```
~$ testgzip http://www.google.ru
        non-compressed:
109181  100%  ████████████████████████████████████████████████████████████████████████████████████████████████████
        gzip:
30706   28%   ████████████████████████████     
```

#### Dependencies
You need to have `curl` installed.

#### Acknowledgments
Function for showing progress-bar is courtesy of Ben Bradley: http://moblog.bradleyit.com/2010/02/simple-bash-progress-bar-function.html
