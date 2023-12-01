import 'dart:io';

l(Object str) => stdout.writeln(str);

void fBorder(Object? value){
  l('\x1b[51m $value \x1b[0m');
}

void fWhite(Object? value){
  l('\x1b[7m $value \x1b[0m');
}

void fRed(Object? value){
  l('\x1b[31m $value\x1b[0m');
}

void fGreen(Object? value){
  l('\x1b[32m $value\x1b[0m');
}

void fBlue(Object? value){
  l('\x1b[34m $value\x1b[0m');
}