INVOICING PROGRAMME

0 REM COPYRIGHT M.J.BALDWIN 1985
1 LPRINT CHR$ 4; CHR$ 27; CHR$ 69
2 POKE 2369, 80
10 REM MENU
15 CLS
20 POKE CAP,8: PRINT AT 0,3; INVERSE 1; BRIGHT 1; “TRADE PRINTING COMPANY”
22 PRINT AT 2,10; BRIGHT 1; “INVOICING”
30 PRINT “ “
40 PRINT AT 6,3; BRIGHT 1; “1”; BRIGHT 0; “. TO PREPARE AN INVOICE.”
50 PRINT AT 8,3; BRIGHT 1; “2”; BRIGHT 0; “. TO PRINT ANOTHER COPY OF LAST ITEM.”
60 PRINT AT 11,3; BRIGHT 1; “3”; BRIGHT 0;  “. CUSTOMER FILES.”
70 PRINT AT 13,3; BRIGHT 1; “4”; BRIGHT 0; “. TO SAVE PROGRAMME.”
80 PRINT AT 15,3; BRIGHT 1; “5”; BRIGHT 0; “. ENTER PAID INVOICE OR CREDIT NOTE.”
90 PRINT AT 18,3; BRIGHT 1; “6”; BRIGHT 0; “.TO CLEAR MEMORY.”
100 PRINT AT 20,3; BRIGHT 1; “7”; BRIGHT 0; “. TO PREPARE A CREDIT NOTE.”
111 BEEP .1,15
120 PAUSE 0: LET I$=INKEY$
130 IF INKEY$<> “ “ THEN GO TO 130
140 IF I$=“1” OR I$=“7” THEN GO TO 1000
150 IF I$=“2” AND W$<>”CREDIT” THEN GO TO 700
160 IF I$=“2” AND W$=“CREDIT” THEN GO TO 700
170 IF I$=“3” THEN GO TO 3100
190 IF I$=“4” THEN GO TO 9905
200 IF I$=“5” THEN GO TO 4000
210 IF I$=“6” THEN GO TO 6000
220 GO TO 1
225 REM ************
230 REM GO SUB STACK
235 REM ************
310 RETURN
320 IF C$=“0” THEN GO TO 365
325 LET SX=VAL C$: LET V$=“ “
330 IF SX=INT SX THEN LET V$=“.00” : GO TO 350
340 IF CODE (C$(LEN C$-1))=46 THEN LET V$=“0”
350 LET C$=C$+V$
360 RETURN
365 IF C$=“0” THEN LET C$=“0.00” : RETURN
370 STOP
500 PRINT AT 21,0; BRIGHT 1; “Press P to print or M for menu”: PRINT £1;AT 1,12; BRIGHT 1; FLASH 1;”P”; BRIGHT 0; FLASH 0; “ or “; BRIGHT 1; FLASH 1; “M” : PAUSE 0: LET P$=INKEY$: IF P$<>”P” AND P$<>”M” THEN GO TO 500
501 RETURN
600 IF R$=“TPC” THEN PRINT AT 21,0; BRIGHT 1; “ Do you want to add to account ? “; £1;AT 1,12; BRIGHT 1; FLASH 1; “Y”; BRIGHT 0; FLASH 0; “ or “; BRIGHT 1; FLASH 1; “N”: PAUSE 0: LET P$=INKEY$<>”Y” AND INKEY$<>”N” THEN GO TO 600
601 RETURN
700 CLS : PRINT AT 15,3; BRIGHT 1; “ TO PRINT ANOTHER COPY “: IF L$=“INVOICE” THEN PRINT AT 17,9; BRIGHT 1 “OF “; L$: GO SUB 500
710 IF L$=“CREDIT NOTE” THEN PRINT AT 17,7; BRIGHT 1; “OF “; L$: GO SUB 500
720 IF P$=“P” AND W$=“CREDIT” THEN GO TO 5100
730 IF P$=“P” AND W$<>”CREDIT” THEN GO TO 1600
740 IF P$=“M” THEN GO TO 10
760 GO TO 10
810 INPUT “Enter Percent Discount:”;  LINE H$: LET xx=810: LET PER=VAL H$
820 LET DIS=(TOT*PER)/100: LET DIS=INT (DIS*100+0.5)/100
825 LET TOT1=TOT-DIS
830 RETURN
850 INPUT (“If VAT rate “;per1;”% press ENTER “); LINE H$: IF CODE H$=0 THEN GO TO 856
855 LET PER1=VAL H$
860 LET VAT=(TOT1*PER1)/100: LET VAT= INT (VAT*100+0.5)/100
870 RETURN
900 PRINT £1; AT 0,0;
905 IF INKEY$<>”” THEN GO TO 905
910 PRINT £1, AT 1,12; FLASH 1; BRIGHT 1; “Y”; BRIGHT 0; FLASH 0; “ or “; FLASH 1; BRIGHT 1; “N”: PAUSE 0: IF INKEY$<>”Y” AND INKEY$<>”N” THEN GO TO 900
930 RETURN
997 REM *******
998 REM INVOICE
999 REM *******
1000 LET W$=“MJB”
1001 LET L$=“INVOICE”: IF I$=“7” THEN LET L$=“CREDIT NOTE”
1010 LET TOT=0: LET TOT1=TOT
1020 CLS : POKE CAP, 0
1025 INPUT (“ENTER NEXT “; BRIGHT 1;L$; BRIGHT 0;” NO:”); LINE H$: IF CODE H$=0 THEN GO TO 10
1030 LET IN=VAL H$: FOR P=1 TAT-1: IF in=c(P,2) THEN PRINT AT 21,0; BRIGHT 1; FLASH 1; “ERROR INVOICE No ALREADY ENTERED” : PAUSE 100: CLS: GO TO 1017
1040 NEXT P : PRINT BRIGHT 1; L$; “ No: “; BRIGHT 0; “ “; BRIGHT 1; IN
1050 PRINT””
1060 PRINT AT 21,0; BRIGHT 1; “ENTER CLIENTS NAME: “ : INPUT ; LINE R$: IF CODE R$=0 THEN GO TO 1060
1070 PRINT AT 1,0: GO SUB 3500: LET B$(1)=R$
1080 PRINT B$(1): PRINT AT 21,0; FLASH 1; BRIGHT 1; “NOT ON FILE”; FLASH 0; “ ENTER to continue.”: PAUSE 0
1090 FOR P=2 to 6: PRINT AT 21,0; “Enter Line “; p-1; “ of address.        “: INPUT LINE B$(p): PRINT AT p+2,0; B$(p) : NEXT p
1095 PRINT AT 0,16; BRIGHT 1; “Account No. “; BRIGHT 0; “ “; BRIGHT 1; y
1100 IF I$=“7” THEN GO TO 4600
1110 PRINT AT 21,0; BRIGHT 1; “ENTER CLIENTS ORDER NO. OR REF: “ : INPUT LINE B$(7)
1120 PRINT AT 10,0; “ORDER REF: “; B$(7)
1130 PRINT AT 21,0; BRIGHT 1; “ENTER DATE: “
1140 IF E$(2)<>”                “THEN PRINT AT 21,11; BRIGHT 1; “   (IF E$”(2);”) ENTER”
1150 INPUT “    “; LINE E$(1): IF E$(1)=“           “ THEN LET E$(1)=E$(2)
1160 LET E$(2)=E$(1) : PRINT AT 20,0; M$(2); AT 12,0; “DATE:”; E$(1)
1170 POKE CAP ,8: GO SUB 8000 : IF J$=“E” THEN GO TO 10
1190 CLS : PRINT BRIGHT 1; L$; “  No:”; BRIGHT 0; “ “; BRIGHT 1; IN
1191 PRINT AT 0,18; BRIGHT 1; “Account No. “; BRIGHT 0; “   “; BRIGHT 1; y
1192 DIM A$ (8,64)
1193 FOR D=1 TO 8
1194 PRINT AT 2,1; BRIGHT 1; “ENTER INVOICE DETAILS LINE  “: PRINT AT 2,29; BRIGHT 1; D
1195 POKE CAP ,0; INPUT LINE D$
1196 IF LEN D$>64 THEN BEEP .25,30: BEEP.25,20: PRINT £1, AT 0,0; BRIGHT 1; “Line is too long, please re-type”: PAUSE 50: BRIGHT 0: FLASH 0: GO TO 1195
1197 PRINT AT 3+D+D,0;D$
1198 LET A$(D)=D$
1200 NEXT D
1210 POKE CAP,8: GO SUB 8000: IF J$=“E” THEN GO TO 1190
1211 CLS : PRINT AT 0,0; BRIGHT 1; “INVOICE NO. “; BRIGHT 0; “   “; BRIGHT 1; IN: PRINT “  “
1212 PRINT AT 0,10; BRIGHT 1; “Account No. “; BRIGHT 0; “   “; BRIGHT 1; y
1213 PRINT””: FOR P=1 TO 6
1214 PRINT B$(P)
1215 NEXT P
1230 INPUT BRIGHT 1; “ENTER JOB COST  “; BRIGHT 0; “£ “; TOT
1240 PRINT AT 11,0; “JOB COST.......£ “; TAB 28-LEN STR$ INT TOT;TOT
1250 GO SUB 8000: IF J$=“E” THEN GO TO 1230
1260 LET TOT=TOT
1270 POKE CAP,8
1280 LET TOT1=TOT
1290 CLS: PRINT AT 0,0; BRIGHT 1; “INVOICE NO. “; BRIGHT 0; “   “; BRIGHT 1; IN: PRINT “”
1295 PRINT AT 0,18; BRIGHT 1; “Account No. “; BRIGHT 0; “   “; BRIGHT 1; y
1297 PRINT “”; FOR P=1 TO 6
1300 PRINT B$(P)
1310 NEXT P
1360 PRINT AT 11,0; “TOTAL ............”; TAB 28-LEN STR$ INT TOT;TOT
1370 PRINT AT 21,0; BRIGHT 1; “   Is there any discount ?         “
1380 GO SUB 900: LET F$=INKEY$: IF F$=“Y” AND F$=“N” THEN GO TO 1380
1390 IF F$=“Y” THEN GO SUB 800
1400 IF F$=“Y” THEN PRINT AT 12,0; “DISCOUNT AT  “;PER; “ %......”; TAB 28-LEN STR$ INT DIS;DIS
1410 IF F$=“Y” THEN PRINT AT 13,0; “TOTAL LESS DISCOUNT..”; TAB 28-LEN STR$ INT TOT;TOT
1420 PRINT AT 21,0; BRIGHT 1; “   ENTER V.A.T.  %   “
1430 GO SUB 850
1440 PRINT AT 14,0; “VAT AT. “; PER1; “%............”; TAB 29-LEN STR$ INT VAT;VAT
1450 PRINT ‘ “TOTAL..................”; TAB 28-LEN STR$ INT (TOT1+VAT); TOT1+VAT
1460 GO SUB 600
1470 IF INKEY$=“Y” THEN GO SUB 4500
1480 GO SUB 500
1490 IF P$=“N” THEN GO TO 10
1500 IF P$=“P” THEN GO TO 1600
1510 GO TO 10
1520 REM **********
1530 REM *INV PRINT*
1540 REM **********
1700 LET a=1: LET b=2: LET c=3: LET d=4: LET e=5: LET f=6: LET g=7
1710 LPRINT : LPRINT : LPRINT : LPRINT TAB 8; B$(a) : LPRINT TAB 8; B$(b) ; TAB 53; L$; “ NO:   “; IN: LPRINT TAB 8; B$(c): LPRINT TAB 8 B$(d); TAB 53; “Date:   “; E$(1) : LPRINT TAB 8; IN: LPRINT TAB 8; B$(e): LPRINT TAB 8; B$(f); TAB 53; “Ref:  “; B$(g)
1720 GO TO 10
1730 IF W$=“CREDIT” THEN RETURN
1740 LPRINT : LPRINT : IF R$=“TPC” THEN LPRINT TAB 31; “Account No.   “;y
1750 LPRINT : LPRINT : LPRINT
1760 LPRINT TAB 8; A$(1) : LPRINT TAB 8; A$(2) : LPRINT TAB 8; A$(4) : LPRINT TAB 8; A$(5) : LPRINT TAB 8; A$(6) : LPRINT TAB 8; A$(7) : LPRINT TAB 8; A$(8) : LPRINT : LPRINT
1770 LPRINT
1780 LET C$=STR$ (TOT) : GO SUB 320
1790 LPRINT TAB 41; “TOTAL”; TAB 69-LEN C$;C$
1800 IF F$=“Y” THEN LET C$= STR$ (DIS) : GO SUB 320 : LPRINT TAB 41; “DISCOUNT AT  “; PER; “%”; TAB 69-LEN C$; C$
1810 IF F$=“Y” THEN LET C$=STR$ (TOT1) : GO SUB 320 : LPRINT TAB 41; “TOTAL LESS DISCOUNT”; TAB 69-LEN C$; C$
1820 LET C$=STR$ (VAT) : GO SUB 320
1830 LPRINT TAB 41; “VAT AT  “; PER1; “%”; TAB 69-LEN C$; C$
1840 LET C$=STR$ (TOT1+VAT) : GO SUB 320 : LPRINT ‘ TAB 41; “TOTAL DUE    “; TAB 69-LEN C$; C$
1850 CLS : GO TO 1
1860 GO TO 1
2500 CLS : PRINT AT 1,4: BRIGHT 1; “ENTERING NEW ACCOUNT”
2510 IF s1>50 THEN PRINT AT 10,9; BRIGHT 1; FLASH 1; “FILE FULL” : PAUSE 100 : GO TO 10
2520 POKE CAP,0 : PRINT AT 21,0; “ENTER Clients name:            “ : INPUT LINE r$ : POKE CAP,8 : IF CODE r$=0 THEN GO TO 3100
2530 FOR K=1 TO s1-1 : IF r$=s$(k,1, TO LEN r$) THEN PRINT AT 12,3; BRIGHT 1; FLASH 1; “ NAME IS ALREADY IN MEMORY” : PAUSE 110 : GO TO 3100
2540 NEXT K : LET s$(s1,1)=r$
2550 PRINT AT 4,0; R$
2560 FOR k=2 TO 6 : PRINT AT 21,0; “ENTER Line  “; k-1; “ of address.” : POKE CAP, 0: INPUT LINE s$(s1,k) : PRINT AT k+4,0; s$(s1,k) : POKE CAP, 8 : NEXT k : GO SUB 8000
2570 IF j$=“E” THEN GO TO 3000
2580 LET s1=s1+1 : GO TO 3100
3100 CLS : LET Q$=“”
3110 PRINT AT 0,8; BRIGHT 1; “CUSTOMER FILES”
3120 PRINT AT 4,1; BRIGHT 1; “1”; BRIGHT 0; “.  TO SEARCH FOR A CLIENT BY ACCOUNT NUMBER.”
3130 PRINT AT 7,1; BRIGHT 1; “2”; BRIGHT 0; “.  TO SEARCH FOR A CLIENT BY NAME.”
3140 PRINT AT 10,1; BRIGHT 1; “3”; BRIGHT 0; “.  TO SCAN NAMES AND ADDRESSES.”
3142 PRINT AT 12,1; BRIGHT 1; “4”; BRIGHT 0; “.  TPRINT OUT TOTAL INVOICED.”
3143 PRINT AT 14,1; BRIGHT 1; “5”; BRIGHT 0; “.  TO PRINT NAMES AND ACC.NO’S.”
3144 PRINT AT 16,1; BRIGHT 1; “6”; BRIGHT 0; “.  TO ENTER NEW ACCOUNT.”
3145 PRINT AT 21,5; BRIGHT 1; “PRESS ENTER TO RETURN.”
3146 BEEP .1,15
3147 PAUSE 0 : LET I$= INKEY$
3148 IF INKEY$<>”” THEN GO TO 3148
3150 IF I$ = “1” THEN GO TO 3161
3152 IF I$ = “2” THEN GO TO 3170
3154 IF I$ = “3” THEN GO TO 3300
3156 IF I$ = “4” THEN GO TO 6200
3158 IF I$ = “5” THEN GO TO 3196
3159 IF I$ = “6” THEN GO TO 2500
3160 GO TO 10
3161 IF I$ = “1” THEN PRINT AT 21,3; BRIGHT 1; “      ENTER Account Number.     “ : INPUT “            No:  “; LINE H$ : LET k=VAL H$ : IF k > s1-1 OR k<1 THEN GO TO 3171
3162 LET Q$ = “*” : GO TO 3315
3170 LET Q$ = “*” : POKE CAP, 0 : PRINT AT 21,3; BRIGHT 1 ; “   ENTER Customer name:  “ : INPUT “    “; LINE j$ : POKE CAP, 8 : FOR k=1 TO s1 : IF j$ = s$ (k,1, TO LEN j$) THEN GO TO 3315
3171 NEXT k : PRINT AT 21,0; BRIGHT 1 ; FLASH 1 ; “ NO NAME OF FILE / WRONG SPELLING” : PAUSE 150 : PRINT AT 21,0; M$(2) : GO TO 3110
3172 GO TO 3110
3191 IF I$ = “4” THEN LPRINT “   COMPANY                 INVOICE NO            DATE            TOTAL”
3192 LPRINT : LET YZ = 0 : FOR K = 1 TO TAT -1 : LET TP=C(k,3) : LET C$ = STR$ (TP) : GO SUB 320
3193 LPRINT TAB 1; S$(C(K,1),1); TAB 29; C(K,2); TAB 40; O$(K); TAB 68-LEN C$; C$ : LET YZ=YZ + C(K,3) : NEXT K : LET TP=YZ : LET C$=STR$ (TP) : GO SUB 320 : LPRINT TAB 43; “GRAND TOTAL”; TAB 68-LEN C$; C$
3194 GO TO 3100
3196 PRINT AT 19,7; BRIGHT 1; “ACCOUNT NUMBERS” : GO SUB 500
3197 IF P$ =“P” THEN GO TO 3200
3198 IF P$ = “M” THEN GO TO 3100
3200 LPRINT “CUSTOMER               ACC.NO. “ : LPRINT : FOR k=1TO s1-1 : FOR p=1 TO 1
3201 LPRINT s$(k,  p) ; k : NEXT k
3202 GO TO 3100
3310 FOR k=1 TO s1-1
3315 CLS : PRINT AT 1,3; BRIGHT 1; “Account No.  “ : PRINT AT 1,16; BRIGHT 1; k : PRINT “” : FOR p=1 TO 6: PRINT TAB 3; s$(k,p)
3318 NEXT p
3320 PRINT AT 11,3; BRIGHT 1; “A”; BRIGHT 0; “  TO ALTER DETAILS.”
3322 PRINT AT 13,3; BRIGHT 1; “L”; BRIGHT 0; “  TO PRINT A LABEL.”
3324 PRINT AT 15,3; BRIGHT 1; “M”; BRIGHT 0; “  TO RETURN TO FILE MENU.”
3325 PRINT AT 17,3; BRIGHT 1; “S”; BRIGHT 0; “  TO PREPARE STATEMENT.”
3326 IF Q$ = “*” THEN PRINT AT 19,3; “             “ : GO TO 3329
3328 PRINT AT 19,3; BRIGHT 1; “N” BRIGHT 0; “  FOR NEXT ACCOUNT.”
3329 PRINT AT 21,3; BRIGHT 1; “PRESS ENTER FOR MAIN MENU”
3330 PAUSE 0 : LET I$=INKEY$
3332 IF CODE I$=13 THEN GO TO 10
3334 IF Q$=“*” AND I$=“N” THEN GO TO 3100
3345 IF I$=“N” THEN NEXT k : GO TO 3100
3355 IF I$=“A” THEN FOR p=1 TO 6: PRINT AT P+1, 1; BRIGHT 1; p : NEXT p : PRINT AT 21,0; BRIGHT 1; “ENTER Line number you want to alter” : INPUT “                 “; LINE H$: LET Line=VAL H$: IF Line<1 OR Line>6 THEN GO TO 3100
3356 IF I$=“A” THEN POKE CAP,0 : PRINT AT 21,0; BRIGHT 1; “      ENTER New details.     “ : INPUT “   “; LINE s$(k,Line) : POKE CAP, 8: LET I$=“1” : GO TO 3315
3360 IF I$=“L” THE GO SUB 500
3361 IF INKEY$=“M” THEN GO TO 3100
3364 IF INKEY$=“P” THEN FOR A=1 TO 6: LPRINT s$(k,A) : NEXT A : GO TO 3315
3365 IF I$ = “M” THEN GO TO 3100
3370 IF I$ = “S” THEN GO TO 3534
3380 GO TO 3100
3520 FOR y=1 TO s1-1
3530 IF r$ = s$(y,1, TO LEN r$) THEN FOR p=1 TO 6 : LET B$(P)=S$(y,P) : PRINT s$(y,p) : NEXT P : LET R$=“TPC” : GO TO 1095
3532 NEXT y : RETURN
3533 GO TO 3100
3534 CLS : FOR  p=1 TO 1: PRINT AT 0,2; BRIGHT 1; s$(k,p); BRIGHT 0; “  “; BRIGHT 1; k : PRINT “”
3536 LET yt=0
3537 FOR p=1 TO tat-1 : IF  c(p,2)=k THEN LET CX=1: LET FA=C(P,3) : LET C$=STR$ (FA) : GO SUB 320 : PRINT TAB 12,O$(P); TAB 30-LEN C$; C$ : LET yt=yt+c(P,3)
3358 POKE 23692,255: NEXT p: PRINT TAB 23; “————————“ : LET C$=STR$ (YT) : GO SUB 320 : PRINT TAB 13; “Total :”; TAB 30-LEN C$; C$
3539 PRINT AT 21,0; BRIGHT 1; “Do you want to prepare statement” : GO SUB 900
3540 LET F$= INKEY$ : IF F$=“N” THEN GO TO 3315 : IF F$=“Y” THEN GO TO 3541
3541 PRINT AT 21,0; BRIGHT 1; “   Is there an Overdue Account   “ : GO SUB 900
3542 LET F$= INKEY$ : IF F$=“Y” AND F$=“N” THEN GO TO 3542
3543 IF F$=“Y” THEN GO TO 3550
3544 IF F$=“N” THEN GO TO 3605
3550 PRINT AT 21,2; BRIGHT 1; “ENTER Amount Overdue:       “
3560 INPUT “    “; LINE X$
3606 PRINT AT 21,0; BRIGHT 1; “ENTER DATE:”
3607 IF E$(2) <>”         “ THEN PRINT AT 21,11; BRIGHT 1; “     (IF. “;E$(2);”) ENTER “
3608 INPUT “ “; LINE E$ (1) : IF E$ (1) = “       “ THEN LET E$ (1) = E$ (2)
3609 LET E$ (2) = E$ (1) : PRINT AT 20,0; M$ (2)
3610 GO SUB 500
3614 IF P$ = “P” THEN GO TO 3618
3615 IF P$ = “M” THEN GO TO 3100
3618 LET yt = 0 : LPRINT : LPRINT : LPRINT ‘ TAB yu; s$ (k,1) ; TAB YU+47 ; “Date:   “ ; E$ (1) ‘ TAB yu ; s$ (k,2) ‘ TAB yu ; s$ (k,3) ; TAB YU+47 ; “Account No:  “ ; k ; ‘ TAB yu ; s$ (k,4) ‘ TAB yu ; s$ (k,5) ‘ TAB yu ; s$ (k,6)
3620 LPRINT : LPRINT : LPRINT ‘ TAB YU ; “Invoice no        Date           Total”
3625 LPRINT : LPRINT
3630 FOR p=1 TO tat-1 : IF c ( p,1 )= k THEN LET CX=1 : LET FA=C (P,3) : LET C$= STR$ ( FA ) : GO SUB 320 : LPRINT TAB YU ; c (p,2) ; TAB YU+27 ; o$ (p) ; TAB YU+59-LEN C$ ; C$ : LET yt=yt + c(P,3)
3640 NEXT p : LET C$= STR$ (YT) : GO SUB 320 : LPRINT ‘ TAB yu+41 ; TAB YU+59- LEN C$; C$
3641 IF F$= “N” THEN GO TO 3315
3642 LET MK= VAL X$ : LET C$= STR$ (MK) : GO SUB 320
3643 LPRINT : LPRINT TAB YU+31 ; “Overdue Balance  :” ; TAB yu+59-LEN C$ ; C$
3644 LET KM= VAL C$ : LET X$= STR$ (KM)
3660 LET C$= STR$ (YT) : LET AA= VAL C$ : LET BB= VAL X$ : LET CC=AA+BB : LET C$= STR$ (CC) : GO SUB 320
3700 LPRINT : LPRINT TAB yu+ 33 ; “Total Balance  :” ; TAB YU+59-LEN C$;C$ : GO TO 3315
3800 GO TO 3100
4000 CLS : PRINT AT 8,5; BRIGHT 1; “TO ENTER PAID INVOICES”
4020 PRINT AT 14,1; BRIGHT 0; “  PRESS  “; BRIGHT 1; “ENTER”; “              PAID INVOICES” : PAUSE 0
4030 IF CODE INKEY$= 13 THEN GO TO 10
4040 BRIGHT 1; “ENTER”; BRIGHT 0; “  INVOICE/CREDIT NO:  “; LINE H$ : LET in2= VAL H$
4050 FOR k=1 TO tat-1 : IF in2=c (k,2) THEN GO TO 4100
4060 NEXT k : PRINT AT 21,1; BRIGHT 1; FLASH 1; “NO RECORD OF THIS NO. IN FILE” : PAUSE 100 : GO TO 4000
4100 CLS : PRINT AT 1,2; “INVOICE/CREDIT NO:  “ ; BRIGHT 1; c(k,2)
4110 PRINT “” : FOR p=1 TO 6 : PRINT “   “; s$ (c(k,1),p) : NEXT p
4120 PRINT ‘ “   Date: “; o$ (k)
4130 PRINT AT 16,9; BRIGHT 1; “Total:   “; c(k,3)
4140 PRINT AT 21,1; BRIGHT 1; “Is this the correct Account  ?” : GO SUB 910
4150 IF INKEY$ <> “Y” THEN GO TO 10
4160 CLS : PRINT AT 10,5; FLASH 1; BRIGHT 1; “FILE IS NOW UPDATED” : PAUSE 30; FOR p=k TO tat-1 : LET c(p,1)=c(p+1,1) : LET c(p,2)=c(p+1,2) : LET c(p,3)=c(p+1,3) : LET o$(p) = o$(p+1) : NEXT p : LET tat=tat-1 : GO TO 10
4510 IF tat> STA THEN PRINT AT 11,8; BRIGHT 1; FLASH 1; “FILE IS FULL” : PAUSE 80 : RETURN
4515 IF INKEY$ <>”” THEN GO TO 4515
4516 PRINT AT 20,0; M$(2); BRIGHT 1; “     to confirm add to account.    “
4517 GO SUB 900 : IF INKEY$ <> “Y” THEN RETURN
4520 LET c(tat,1)=y : LET c(tat,2)=in : LET o$(tat)=e$(1)
4530 LET c(tat,3)=TOT+VAT : IF F$=“Y” THEN LET c(tat,3)=TOT1+vat
4540 LET tat=tat+1 : RETURN
4560 REM ***************
4570 REM **CREDIT NOTE **
4580 REM ***************
4600 LET W$=“CREDIT” : POKE CAP, 8
4630 INPUT “ENTER the Date:   “; LINE e$(1) : PRINT AT 7,0; “Date:”; e$(1)
4640 GO SUB 8000 : IF J$=“E” THEN GO TO 10
4650 PRINT AT 0,0;
4660 POKE CAP,0
4670 FOR D=1 TO 4 : PRINT AT 21,0; “ENTER Line “: PRINT AT 21,11; D-0; “ of details:” : INPUT LINE D$(D) : PRINT AT D+12,0; D$(D) : NEXT D
4680 POKE CAP, 8
4700 GO SUB 8000 : IF j$=“E” THEN GO TO 4660
4850 INPUT “ENTER   Credit:  “; CRE
4900 LET TOT=CRE-CRE-CRE
4920 PRINT AT 16,0; “Credit........  “; TOT
4940 INPUT “” : IF R$=“TPC” THE GO SUB 600
4960 IF R$<>”TPC” THE GO TO 5000
4980 IF INKEY$=“Y” THEN GO SUB 4500
5010 GO SUB 500
5020 IF P$=“M” THEN GO TO 10
5100 LPRINT
5110 GO SUB 1710 : LPRINT : LPRINT : LPRINT
5120 LET m=1 : LET mm=2 : LET mj=3 : LET mb=4 : LET da=5 : LET db=6 : LET lm=7 : LET lb=8 : LET o=9 : LET ob=10 : LET b=11 : LET bb=12
5130 LPRINT TAB tab; D$(m); D$(mm) : LPRINT TAB D$(mj); D$(mb) : LPRINT TAB tab; D$(da); D$(db) : LPRINT TAB tab; D$(lm); D$(lb) : LPRINT TAB tab; D$(o); D$(ob) : LPRINT TAB tab; D$(b); D$(bb) : LPRINT : LPRINT : LPRINT : LPRINT
5140 LET C$=STR$ (CRE) : GO SUB 320
5150 LPRINT TAB 43; “Total Credit  “; TAB 73-LEN C$; C$
5160 CLS : GO TO 10
6000 CLS
6010 PRINT AT 10,2; BRIGHT 1; “  TO CLEAR INVOICES IN MEMORY”
6020 PRINT AT 16,6; BRIGHT 1; “  PRESS Y TO CONFIRM”
6030 PRINT AT 18,5; BRIGHT 1; “OR ANY KEY TO RETURN”
6040 PAUSE 0
6050 IF INKEY$<> “Y” THEN GO TO 10
6060 CLS
6070 PRINT AT 10,2; BRIGHT 1; “  TO CLEAR INVOICES IN MEMORY”
6080 PRINT AT 16,6; BRIGHT 1; “PRESS Y TO CONFIRM”
6090 PRINT AT 18,5; BRIGHT 1; “OR ANY KEY TO RETURN”
6100 PAUSE 0
6110 IF INKEY$<>”Y” THEN GO TO 1
6120 LET tat=1
6130 CLS
6140 PRINT AT 11,8; BRIGHT 1; FLASH 1; “FILE CLEARED”
6150 PAUSE 60
6160 GO TO 10
6200 CLS : PRINT AT 0,8; BRIGHT 1; TOTAL INVOICED : PRINT : LET YZ=0 : FOR K=1 TO TAT-1 : LET TP=C(K,3) : LET C$=STR$ (TP) : GO SUB 320
6210 PRINT TAB 0; S$(C(K,1),1); TAB 32-LEN C$; C$ : LET YZ=YZ+C(K,3) : POKE 23692,255 : NEXT K : LET TP=YZ : LET C$=STR$ (TP) : GO SUB 320 : PRINT ‘ TAB 8; “GRAND TOTAL”; TAB 32-LEN C$; C$
6220 PRINT : PRINT : GO SUB 500
6230 IF P$ = “M” THEN GO TO 3100
6240 IF P$ = “P” THEN GO TO 3191
6250 GO TO 3100
7000 PAUSE 0
7001 STOP
8010 IF INKEY$<>”” THEN GO TO 8010
8020 PRINT AT 21,0; m$(2) : PRINT £1; INK 1; AT 0,0; BRIGHT 1; FLASH 1; “PRESS KEY E IF YOU HAVE MADE AN ERROR OR ENTER TO CONTINUE.”
8030 IF INKEY$=“” THEN GO TO 8025
8040 LET J$=INKEY$
8050 RETURN
8999 STOP
9029 GO TO 10
9405 LET VAT=0 : LET S1=1 : LET et1=25 : LET sta=250 : LET TAT=1 : LET in1=0 LET S=0 : LET PER1=15 : LET W$=“”
9415 DIM B$(8,et1) : DIM e$(2,8)
9416 DIM s$(50,6,et1)
9417 DIM o$(sta,8)
9418 DIM c(sta,3)
9420 LET ET=1; LET CAP=23658
9430 DIM Q(ET)
9440 DIM U(ET)
9461 LET m$(2)=*
9500 CLS : GO TO 1
9501 REM ******
9570 REM *SAVE*
9571 REM ******
9905 CLS : PRINT AT 16,2; BRIGHT 1; “  Y TO CONFIRM SAVE PROGRAMME.” : PRINT AT 18,10; BRIGHT 1; “  N TO RETURN.”
9906 GO SUB 900
9908 IF INKEY$=“Y” THEN GO TO 9915
9910 IF INKEY$=“N” THEN GO TO 10
9915 CLS : PRINT AT 11,8; BRIGHT 1; FLASH 1; “ CLEARING TAPE” : PRINT AT 13,8; BRIGHT 1; FLASH 1; “DO NOT TOUCH” : ERASE “m”;1;”run” : GO TO 9916
9916 PAUSE 25
9920 SAVE *”m” ;1;”run” LINE 1
9922 CLS : PRINT AT 10,3; BRIGHT 1; “  PRESS ANY KEY TO VERIFY  “
9924 PAUSE 0
9932 VERIFY *”m”;1;”run”
9936 CLS : PRINT AT 10,6; BRIGHT 1; FLASH 1; “PROGRAMME NOW SAVED”
9938 PAUSE 185
9940 FLASH 0 : CLS : GO TO 10