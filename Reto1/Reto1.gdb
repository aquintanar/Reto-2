
set logging file output.txt

set print pretty on

set disassembly-flavor intel


set pagination off


file RETO1



b _start
b terminar

define hook-echo
echo <<<---
end

define hookpost-echo
echo --->>>\n
end


echo INICIO

r

c
i r rax
i r rbx
i r rcx
i r rdx
i r rdi
i r rsi
i r rsp
i r rbp


printf "El resultado de la derecha es %d\n",$r15

printf "El resultado de la izquierda  es %d\n",$r14



echo FIN
