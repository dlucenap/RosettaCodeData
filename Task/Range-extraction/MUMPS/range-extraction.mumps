RANGCONT(X) ;Integer range contraction
 NEW Y,I,CONT,NOTFIRST,CURR,PREV,NEXT,SEQ SET Y="",SEQ=0,PREV="",CONT=0
 FOR I=1:1:$LENGTH(X,",") DO
 .SET NOTFIRST=$LENGTH(Y),CURR=$PIECE(X,",",I),NEXT=$PIECE(X,",",I+1)
 .FOR  Q:$EXTRACT(CURR)'=" "  S CURR=$EXTRACT(CURR,2,$LENGTH(CURR))  ;clean up leading spaces
 .S SEQ=((CURR-1)=PREV)&((CURR+1)=NEXT)
 .IF 'NOTFIRST SET Y=CURR
 .IF NOTFIRST DO
 ..;Order matters due to flags
 ..IF CONT&SEQ ;Do nothing
 ..IF 'CONT&'SEQ SET Y=Y_","_CURR
 ..IF CONT&'SEQ SET Y=Y_CURR,CONT=0
 ..IF 'CONT&SEQ SET Y=Y_"-",CONT=1
 .SET PREV=CURR
 IF CONT SET Y=Y_PREV
 K I,CONT,NOTFIRST,CURR,PREV,NEXT,SEQ
 QUIT Y