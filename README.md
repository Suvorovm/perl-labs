# perl-labs
 Статья про Perl :
 https://habr.com/ru/company/regru/blog/232933/
 
 
# Tips

In Perl, several functions and operators use this variable as a default, in case no parameter is explicitly used. In general, I'd say you should NOT see $_ in real code. I think the whole point of $_ is that you don't have to write it explicitly.(source = https://perlmaven.com/the-default-variable-of-perl)
#### How to compare string ?
cmp Compare

'a' cmp 'b' # -1
'b' cmp 'a' #  1
'a' cmp 'a' #  0
eq Equal to

'a' eq  'b' #  0
'b' eq  'a' #  0
'a' eq  'a' #  1
ne Not-Equal to

'a' ne  'b' #  1
'b' ne  'a' #  1
'a' ne  'a' #  0
lt Less than

'a' lt  'b' #  1
'b' lt  'a' #  0
'a' lt  'a' #  0
le Less than or equal to

'a' le  'b' #  1
'b' le  'a' #  0
'a' le  'a' #  1
gt Greater than

'a' gt  'b' #  0
'b' gt  'a' #  1
'a' gt  'a' #  0
ge Greater than or equal to

'a' ge  'b' #  0
'b' ge  'a' #  1
'a' ge  'a' #  1
source = https://stackoverflow.com/questions/1175390/how-do-i-compare-two-strings-in-perl
