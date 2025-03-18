#!/bin/bash

TESTCASE_ROOT="./DATA/testcase"
TESTCASE_ANSWER_ROOT="./DATA/testcase_answer"
STUDENT_ANSWER_ROOT="./DATA/student_answer"

problems=(
    "factorial" 
    "prime" 
    "calculator" 
    "triangle" 
    "fibonacci"
)


let pattern=0


PASS_TASK() {

    echo -e "\033[31m                                                                                                                                          "        
    echo -e "\033[31m                                                                                \033[36m      :BBQvi.                                              "        
    echo -e "\033[31m                                                              .i7ssrvs7         \033[36m     BBBBBBBBQi                                           "        
    echo -e "\033[31m                        .:r7rrrr:::.        .::::::...   .i7vr:.      .B:       \033[36m    :BBBP :7BBBB.                                         "        
    echo -e "\033[31m                      .Kv.........:rrvYr7v7rr:.....:rrirJr.   .rgBBBBg  Bi      \033[36m    BBBB     BBBB                                         "        
    echo -e "\033[31m                     7Q  :rubEPUri:.       ..:irrii:..    :bBBBBBBBBBBB  B      \033[36m   iBBBv     BBBB       vBr                               "        
    echo -e "\033[31m                    7B  BBBBBBBBBBBBBBB::BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB :R     \033[36m   BBBBBKrirBBBB.     :BBBBBB:                            "        
    echo -e "\033[31m                   Jd .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: Bi    \033[36m  rBBBBBBBBBBBR.    .BBBM:BBB                             "        
    echo -e "\033[31m                  uZ .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB .B    \033[36m  BBBB   .::.      EBBBi :BBU                             "        
    echo -e "\033[31m                 7B .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  B    \033[36m MBBBr           vBBBu   BBB.                             "        
    echo -e "\033[31m                .B  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: JJ   \033[36m i7PB          iBBBBB.  iBBB                              "        
    echo -e "\033[31m                B. BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  Lu             \033[36m  vBBBBPBBBBPBBB7       .7QBB5i                "        
    echo -e "\033[33m               Y1 KBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBi XBBBBBBBi :B            \033[36m :RBBB.  .rBBBBB.      rBBBBBBBB7              "        
    echo -e "\033[33m              :B .BBBBBBBBBBBBBsRBBBBBBBBBBBrQBBBBB. UBBBRrBBBBBBr 1BBBBBBBBB  B.          \033[36m    .       BBBB       BBBB  :BBBB             "        
    echo -e "\033[33m              Bi BBBBBBBBBBBBBi :BBBBBBBBBBE .BBK.  .  .   QBBBBBBBBBBBBBBBBBB  Bi         \033[36m           rBBBr       BBBB    BBBU            "        
    echo -e "\033[33m             .B .BBBBBBBBBBBBBBQBBBBBBBBBBBB       \033[38;2;242;172;172mBBv \033[33m.LBBBBBBBBBBBBBBBBBBBBBB. B7.:ii:   \033[36m           vBBB        .BBBB   :7i.            "        
    echo -e "\033[33m            .B  PBBBBBBBBBBBBBBBBBBBBBBBBBBBBbYQB. \033[38;2;242;172;172mBB: \033[33mBBBBBBBBBBBBBBBBBBBBBBBBB  Jr:::rK7 \033[36m             .7  BBB7   iBBBg                  "        
    echo -e "\033[33m           7M  PBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  \033[38;2;242;172;172mBB. \033[33mBBBBBBBBBBBBBBBBBBBBBBB..i   .   v1                  \033[36mdBBB.   5BBBr                 "        
    echo -e "\033[33m          sZ .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  \033[38;2;242;172;172mBB. \033[33mBBBBBBBBBBBBBBBBBBBBBBBBBBB iD2BBQL.                 \033[36m ZBBBr  EBBBv     YBBBBQi     "        
    echo -e "\033[33m  .7YYUSIX5 .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  \033[38;2;242;172;172mBB. \033[33mBBBBBBBBBBBBBBBBBBBBBBBBY.:.      :B                 \033[36m  iBBBBBBBBD     BBBBBBBBB.   "        
    echo -e "\033[33m LB.        ..BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB. \033[38;2;242;172;172mBB: \033[33mBBBBBBBBBBBBBBBBBBBBBBBBMBBB. BP17si                 \033[36m    :LBBBr      vBBBi  5BBB   "        
    echo -e "\033[33m  KvJPBBB :BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: \033[38;2;242;172;172mZB: \033[33mBBBBBBBBBBBBBBBBBBBBBBBBBsiJr .i7ssr:                \033[36m          ...   :BBB:   BBBu  "        
    echo -e "\033[33m i7ii:.   ::BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBj \033[38;2;242;172;172muBi \033[33mQBBBBBBBBBBBBBBBBBBBBBBBBi.ir      iB                \033[36m         .BBBi   BBBB   iMBu  "        
    echo -e "\033[32mDB    .  vBdBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBg \033[38;2;242;172;172m7Bi \033[32mBBBBBBBBBBBBBBBBBBBBBBBBBBBBB rBrXPv.                \033[36m          BBBX   :BBBr        "        
    echo -e "\033[32m :vQBBB. BQBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBQ \033[38;2;242;172;172miB: \033[32mBBBBBBBBBBBBBBBBBBBBBBBBBBBBB .L:ii::irrrrrrrr7jIr   \033[36m          .BBBv  :BBBQ        "        
    echo -e "\033[32m :7:.   .. 5BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  \033[38;2;242;172;172mBr \033[32mBBBBBBBBBBBBBBBBBBBBBBBBBBBB:            ..... ..YB. \033[36m           .BBBBBBBBB:        "        
    echo -e "\033[32mBU  .:. BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  \033[38;2;242;172;172mB7 \033[32mgBBBBBBBBBBBBBBBBBBBBBBBBBB. gBBBBBBBBBBBBBBBBBB. BL \033[36m             rBBBBB1.         "        
    echo -e "\033[32m rY7iB: BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: \033[38;2;242;172;172mB7 \033[32mBBBBBBBBBBBBBBBBBBBBBBBBBB. QBBBBBBBBBBBBBBBBBi  v5                                "        
    echo -e "\033[32m     us EBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB \033[38;2;242;172;172mIr \033[32mBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBgu7i.:BBBBBBBr Bu                                 "        
    echo -e "\033[32m      B  7BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB.\033[38;2;242;172;172m:i \033[32mBBBBBBBBBBBBBBBBBBBBBBBBBBBv:.  .. :::  .rr    rB                                  "        
    echo -e "\033[32m      us  .BBBBBBBBBBBBBQLXBBBBBBBBBBBBBBBBBBBBBBBBq  .BBBBBBBBBBBBBBBBBBBBBBBBBv  :iJ7vri:::1Jr..isJYr                                   "        
    echo -e "\033[32m      B  BBBBBBB  MBBBM      qBBBBBBBBBBBBBBBBBBBBBB: BBBBBBBBBBBBBBBBBBBBBBBBBB  B:           iir:                                       "        
    echo -e "\033[34m     iB iBBBBBBBL       BBBP. :BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  B.                                                       "        
    echo -e "\033[34m     P: BBBBBBBBBBB5v7gBBBBBB  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: Br                                                        "        
    echo -e "\033[34m     B  BBBs 7BBBBBBBBBBBBBB7 :BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB .B                                                         "        
    echo -e "\033[34m    .B :BBBB.  EBBBBBQBBBBBJ .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB. B.                                                         "        
    echo -e "\033[34m    ij qBBBBBg          ..  .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB .B                                                          "        
    echo -e "\033[34m    UY QBBBBBBBBSUSPDQL...iBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBK EL                                                          "        
    echo -e "\033[34m    B7 BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: B:                                                          "        
    echo -e "\033[34m    B  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBYrBB vBBBBBBBBBBBBBBBBBBBBBBBB. Ls                                                          "        
    echo -e "\033[34m    B  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBi_  /UBBBBBBBBBBBBBBBBBBBBBBBBB. :B:                                                        "        
    echo -e "\033[35m   rM .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  ..IBBBBBBBBBBBBBBBBQBBBBBBBBBB  B                                                        "        
    echo -e "\033[35m   B  BBBBBBBBBdZBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBPBBBBBBBBBBBBEji:..     sBBBBBBBr Br                                                       "        
    echo -e "\033[35m  7B 7BBBBBBBr     .:vXQBBBBBBBBBBBBBBBBBBBBBBBBBQqui::..  ...i:i7777vi  BBBBBBr Bi                                                       "        
    echo -e "\033[35m  Ki BBBBBBB  rY7vr:i....  .............:.....  ...:rii7vrr7r:..      7B  BBBBB  Bi                                                       "        
    echo -e "\033[35m  B. BBBBBB  B:    .::ir77rrYLvvriiiiiiirvvY7rr77ri:..                 bU  iQBB:..rI                                                      "        
    echo -e "\033[35m.S: 7BBBBP  B.                                                          vI7.  .:.  B.                                                     "        
    echo -e "\033[35mB: ir:.   :B.                                                             :rvsUjUgU.                                                      "        
    echo -e "\033[35mrMvrrirJKur                                                                                                                               \033[m"
    echo "                                                                                                                                          "
    echo "------------------------------------------------------------------------------------------------------------------------------------------"
    echo "                                                         Congratulations!                                                                 "
    echo "                                                   You have passed all patterns!                                                          "
    echo "------------------------------------------------------------------------------------------------------------------------------------------"

}


FALI_TASK() {

    echo -e "\033[38;2;252;238;238m                                                                                                                                           "      
    echo -e "\033[38;2;252;238;238m                                                                                                :L777777v7.                                "
    echo -e "\033[31m  i:..::::::i.      :::::         ::::    .:::.       \033[38;2;252;238;238m                                       .vYr::::::::i7Lvi                             "
    echo -e "\033[31m  BBBBBBBBBBBi     iBBBBBL       .BBBB    7BBB7       \033[38;2;252;238;238m                                      JL..\033[38;2;252;172;172m:r777v777i::\033[38;2;252;238;238m.ijL                           "
    echo -e "\033[31m  BBBB.::::ir.     BBB:BBB.      .BBBv    iBBB:       \033[38;2;252;238;238m                                    :K: \033[38;2;252;172;172miv777rrrrr777v7:.\033[38;2;252;238;238m:J7                         "
    echo -e "\033[31m  BBBQ            :BBY iBB7       BBB7    :BBB:       \033[38;2;252;238;238m                                   :d \033[38;2;252;172;172m.L7rrrrrrrrrrrrr77v: \033[38;2;252;238;238miI.                       "
    echo -e "\033[31m  BBBB            BBB. .BBB.      BBB7    :BBB:       \033[38;2;252;238;238m                                  .B \033[38;2;252;172;172m.L7rrrrrrrrrrrrrrrrr7v..\033[38;2;252;238;238mBr                      "
    echo -e "\033[31m  BBBB:r7vvj:    :BBB   gBBs      BBB7    :BBB:       \033[38;2;252;238;238m                                  S:\033[38;2;252;172;172m v7rrrrrrrrrrrrrrrrrrr7v. \033[38;2;252;238;238mB:                     "
    echo -e "\033[31m  BBBBBBBBBB7    BBB:   .BBB.     BBB7    :BBB:       \033[38;2;252;238;238m                                 .D \033[38;2;252;172;172mi7rrrrrrr777rrrrrrrrrrr7v. \033[38;2;252;238;238mB.                    "
    echo -e "\033[31m  BBBB    ..    iBBBBBBBBBBBP     BBB7    :BBB:       \033[38;2;252;238;238m                                 rv\033[38;2;252;172;172m v7rrrrrr7rirv7rrrrrrrrrr7v \033[38;2;252;238;238m:I                    "
    echo -e "\033[31m  BBBB          BBBBi7vviQBBB.    BBB7    :BBB.       \033[38;2;252;238;238m                                 2i\033[38;2;252;172;172m.v7rrrrrr7i  :v7rrrrrrrrrrvi \033[38;2;252;238;238mB:                   "
    echo -e "\033[31m  BBBB         rBBB.      BBBQ   .BBBv    iBBB2ir777L7\033[38;2;252;238;238m                                 2i.\033[38;2;252;172;172mv7rrrrrr7v \033[38;2;252;238;238m:..\033[38;2;252;172;172mv7rrrrrrrrr77 \033[38;2;252;238;238mrX                   "
    echo -e "\033[31m .BBBB        :BBBB       BBBB7  .BBBB    7BBBBBBBBBBB\033[38;2;252;238;238m                                 Yv \033[38;2;252;172;172mv7rrrrrrrv.\033[38;2;252;238;238m.B \033[38;2;252;172;172m.vrrrrrrrrrrL.\033[38;2;252;238;238m:5                   "
    echo -e "\033[31m  . ..        ....         ...:   ....    ..   .......\033[38;2;252;238;238m                                 .q \033[38;2;252;172;172mr7rrrrrrr7i \033[38;2;252;238;238mPv \033[38;2;252;172;172mi7rrrrrrrrrv.\033[38;2;252;238;238m:S                   "
    echo -e "\033[38;2;252;238;238m                                                                                        Lr \033[38;2;252;172;172m77rrrrrr77 \033[38;2;252;238;238m:B. \033[38;2;252;172;172mv7rrrrrrrrv.\033[38;2;252;238;238m:S                   "
    echo -e "\033[38;2;252;238;238m                                                                                         B: \033[38;2;252;172;172m7v7rrrrrv. \033[38;2;252;238;238mBY \033[38;2;252;172;172mi7rrrrrrr7v \033[38;2;252;238;238miK                   "
    echo -e "\033[38;2;252;238;238m                                                                              .::rriii7rir7. \033[38;2;252;172;172m.r77777vi \033[38;2;252;238;238m7B  \033[38;2;252;172;172mvrrrrrrr7r \033[38;2;252;238;238m2r                   "
    echo -e "\033[38;2;252;238;238m                                                                       .:rr7rri::......    .     \033[38;2;252;172;172m.:i7s \033[38;2;252;238;238m.B. \033[38;2;252;172;172mv7rrrrr7L..\033[38;2;252;238;238mB                    "
    echo -e "\033[38;2;252;238;238m                                                        .::7L7rriiiirr77rrrrrrrr72BBBBBBBBBBBBvi:..  \033[38;2;252;172;172m.  \033[38;2;252;238;238mBr \033[38;2;252;172;172m77rrrrrvi \033[38;2;252;238;238mKi                    "
    echo -e "\033[38;2;252;238;238m                                                    :rv7i::...........    .:i7BBBBQbPPPqPPPdEZQBBBBBr:.\033[38;2;252;238;238m ii \033[38;2;252;172;172mvvrrrrvr \033[38;2;252;238;238mvs                     "
    echo -e "\033[38;2;252;238;238m                    .S77L.                      .rvi:. ..:r7QBBBBBBBBBBBgri.    .:BBBPqqKKqqqqPPPPPEQBBBZi  \033[38;2;252;172;172m:777vi \033[38;2;252;238;238mvI                      "
    echo -e "\033[38;2;252;238;238m                    B: ..Jv                   isi. .:rBBBBBQZPPPPqqqPPdERBBBBBi.    :BBRKqqqqqqqqqqqqPKDDBB:  \033[38;2;252;172;172m:7. \033[38;2;252;238;238mJr                       "
    echo -e "\033[38;2;252;238;238m                   vv SB: iu                rL: .iBBBQEPqqPPqqqqqqqqqqqqqPPPPbQBBB:   .EBQKqqqqqqPPPqqKqPPgBB:  .B:                        "
    echo -e "\033[38;2;252;238;238m                  :R  BgBL..s7            rU: .qBBEKPqqqqqqqqqqqqqqqqqqqqqqqqqPPPEBBB:   EBEPPPEgQBBQEPqqqqKEBB: .s                        "
    echo -e "\033[38;2;252;238;238m               .U7.  iBZBBBi :ji         5r .MBQqPqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPKgBB:  .BBBBBdJrrSBBQKqqqqKZB7  I:                      "
    echo -e "\033[38;2;252;238;238m              v2. :rBBBB: .BB:.ru7:    :5. rBQqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPPBB:  :.        .5BKqqqqqqBB. Kr                     "
    echo -e "\033[38;2;252;238;238m             .B .BBQBB.   .RBBr  :L77ri2  BBqPqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPbBB   \033[38;2;252;172;172m.irrrrri  \033[38;2;252;238;238mQQqqqqqqKRB. 2i                    "
    echo -e "\033[38;2;252;238;238m              27 :BBU  rBBBdB \033[38;2;252;172;172m iri::::: \033[38;2;252;238;238m.BQKqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqKRBs\033[38;2;252;172;172mirrr7777L: \033[38;2;252;238;238m7BqqqqqqqXZB. BLv772i              "
    echo -e "\033[38;2;252;238;238m               rY  PK  .:dPMB \033[38;2;252;172;172m.Y77777r.\033[38;2;252;238;238m:BEqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPPBqi\033[38;2;252;172;172mirrrrrv: \033[38;2;252;238;238muBqqqqqqqqqgB  :.:. B:             "
    echo -e "\033[38;2;252;238;238m                iu 7BBi  rMgB \033[38;2;252;172;172m.vrrrrri\033[38;2;252;238;238mrBEqKqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPQgi\033[38;2;252;172;172mirrrrv. \033[38;2;252;238;238mQQqqqqqqqqqXBb .BBB .s:.           "
    echo -e "\033[38;2;252;238;238m                i7 BBdBBBPqbB \033[38;2;252;172;172m.vrrrri\033[38;2;252;238;238miDgPPbPqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPQDi\033[38;2;252;172;172mirr77 \033[38;2;252;238;238m:BdqqqqqqqqqqPB. rBB. .:iu7         "
    echo -e "\033[38;2;252;238;238m                iX.:iBRKPqKXB.\033[38;2;252;172;172m 77rrr\033[38;2;252;238;238mi7QPBBBBPqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPB7i\033[38;2;252;172;172mrr7r \033[38;2;252;238;238m.vBBPPqqqqqqKqBZ  BPBgri: 1B        "
    echo -e "\033[38;2;252;238;238m                 ivr .BBqqKXBi \033[38;2;252;172;172mr7rri\033[38;2;252;238;238miQgQi   QZKqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPEQi\033[38;2;252;172;172mirr7r.  \033[38;2;252;238;238miBBqPqqqqqqPB:.QPPRBBB LK        "
    echo -e "\033[38;2;252;238;238m                   :I. iBgqgBZ \033[38;2;252;172;172m:7rr\033[38;2;252;238;238miJQPB.   gRqqqqqqqqPPPPPPPPqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPQ7\033[38;2;252;172;172mirrr7vr.  \033[38;2;252;238;238mUBqqPPgBBQPBBKqqqKB  B         "
    echo -e "\033[38;2;252;238;238m                     v7 .BBR: \033[38;2;252;172;172m.r7ri\033[38;2;252;238;238miggqPBrrBBBBBBBBBBBBBBBBBBQEPPqqPPPqqqqqqqqqqqqqqqqqqqqqqqqqPgPi\033[38;2;252;172;172mirrrr7v7  \033[38;2;252;238;238mrBPBBP:.LBbPqqqqqB. u.        "
    echo -e "\033[38;2;252;238;238m                      .j. . \033[38;2;252;172;172m :77rr\033[38;2;252;238;238miiBPqPbBB::::::.....:::iirrSBBBBBBBQZPPPPPqqqqqqqqqqqqqqqqqqqqEQi\033[38;2;252;172;172mirrrrrr7v \033[38;2;252;238;238m.BB:     :BPqqqqqDB .B        "
    echo -e "\033[38;2;252;238;238m                       YL \033[38;2;252;172;172m.i77rrrr\033[38;2;252;238;238miLQPqqKQJ. \033[38;2;252;172;172m ............       \033[38;2;252;238;238m..:irBBBBBBZPPPqqqqqqqPPBBEPqqqdRr\033[38;2;252;172;172mirrrrrr7v \033[38;2;252;238;238m.B  .iBB  dQPqqqqPBi Y:       "
    echo -e "\033[38;2;252;238;238m                     :U:.\033[38;2;252;172;172mrv7rrrrri\033[38;2;252;238;238miPgqqqqKZB.\033[38;2;252;172;172m.v77777777777777ri::..   \033[38;2;252;238;238m  ..:rBBBBQPPqqqqPBUvBEqqqPRr\033[38;2;252;172;172mirrrrrrvi\033[38;2;252;238;238m iB:RBBbB7 :BQqPqKqBR r7       "
    echo -e "\033[38;2;252;238;238m                    iI.\033[38;2;252;172;172m.v7rrrrrrri\033[38;2;252;238;238midgqqqqqKB:\033[38;2;252;172;172m 77rrrrrrrrrrrrr77777777ri:..   \033[38;2;252;238;238m .:1BBBEPPB:   BbqqPQr\033[38;2;252;172;172mirrrr7vr\033[38;2;252;238;238m .BBBZPqqDB  .JBbqKPBi vi       "
    echo -e "\033[38;2;252;238;238m                   :B \033[38;2;252;172;172miL7rrrrrrrri\033[38;2;252;238;238mibgqqqqqqBr\033[38;2;252;172;172m r7rrrrrrrrrrrrrrrrrrrrr777777ri:.  \033[38;2;252;238;238m .iBBBBi  .BbqqdRr\033[38;2;252;172;172mirr7v7: \033[38;2;252;238;238m.Bi.dBBPqqgB:  :BPqgB  B        "
    echo -e "\033[38;2;252;238;238m                   .K.i\033[38;2;252;172;172mv7rrrrrrrri\033[38;2;252;238;238miZgqqqqqqEB \033[38;2;252;172;172m.vrrrrrrrrrrrrrrrrrrrrrrrrrrr777vv7i.  \033[38;2;252;238;238m :PBBBBPqqqEQ\033[38;2;252;172;172miir77:  \033[38;2;252;238;238m:BB:  .rBPqqEBB. iBZB. Rr        "
    echo -e "\033[38;2;252;238;238m                    iM.:\033[38;2;252;172;172mv7rrrrrrrri\033[38;2;252;238;238mUQPqqqqqPBi\033[38;2;252;172;172m i7rrrrrrrrrrrrrrrrrrrrrrrrr77777i.   \033[38;2;252;238;238m.  :BddPqqqqEg\033[38;2;252;172;172miir7. \033[38;2;252;238;238mrBBPqBBP. :BXKqgB  BBB. 2r         "
    echo -e "\033[38;2;252;238;238m                     :U:.\033[38;2;252;172;172miv77rrrrri\033[38;2;252;238;238mrBPqqqqqqPB: \033[38;2;252;172;172m:7777rrrrrrrrrrrrrrr777777ri.   \033[38;2;252;238;238m.:uBBBBZPqqqqqqPQL\033[38;2;252;172;172mirr77 \033[38;2;252;238;238m.BZqqPB:  qMqqPB. Yv:  Ur          "
    echo -e "\033[38;2;252;238;238m                       1L:.\033[38;2;252;172;172m:77v77rii\033[38;2;252;238;238mqQPqqqqqPbBi \033[38;2;252;172;172m .ir777777777777777ri:..   \033[38;2;252;238;238m.:rBBBRPPPPPqqqqqqqgQ\033[38;2;252;172;172miirr7vr \033[38;2;252;238;238m:BqXQ: .BQPZBBq ...:vv.           "
    echo -e "\033[38;2;252;238;238m                         LJi..\033[38;2;252;172;172m::r7rii\033[38;2;252;238;238mRgKPPPPqPqBB:.  \033[38;2;252;172;172m ............     \033[38;2;252;238;238m..:rBBBBPPqqKKKKqqqPPqPbB1\033[38;2;252;172;172mrvvvvvr  \033[38;2;252;238;238mBEEDQBBBBBRri. 7JLi              "
    echo -e "\033[38;2;252;238;238m                           .jL\033[38;2;252;172;172m  777rrr\033[38;2;252;238;238mBBBBBBgEPPEBBBvri:::::::::irrrbBBBBBBDPPPPqqqqqqXPPZQBBBBr\033[38;2;252;172;172m.......\033[38;2;252;238;238m.:BBBBg1ri:....:rIr                 "
    echo -e "\033[38;2;252;238;238m                            vI \033[38;2;252;172;172m:irrr:....\033[38;2;252;238;238m:rrEBBBBBBBBBBBBBBBBBBBBBBBBBBBBBQQBBBBBBBBBBBBBQr\033[38;2;252;172;172mi:...:.   \033[38;2;252;238;238m.:ii:.. .:.:irri::                    "
    echo -e "\033[38;2;252;238;238m                             71vi\033[38;2;252;172;172m:::irrr::....\033[38;2;252;238;238m    ...:..::::irrr7777777777777rrii::....  ..::irvrr7sUJYv7777v7ii..                         "
    echo -e "\033[38;2;252;238;238m                               .i777i. ..:rrri77rriiiiiii:::::::...............:::iiirr7vrrr:.                                             "
    echo -e "\033[38;2;252;238;238m                                                      .::::::::::::::::::::::::::::::                                                      \033[m"
    echo "-------------------------------------------------------------------------------------------------------------------------------------------"
    echo "                                                         Congratulations!                                                                  "
    echo "                                                       You FAIL Successfully!                                                              "
    echo "-------------------------------------------------------------------------------------------------------------------------------------------"
    echo ""
    echo ""

}

Print_PASS() {

    let pattern+=1
    # let colour=pattern/3
    # let colour=colour%7

    let current+=1
    let colour=current/3
    let colour=colour%7

    if   [ $colour -eq 0 ]; then
        echo -e "\033[0;31mPASS PATTERN NO. $pattern, \033[m"
    elif [ $colour -eq 1 ]; then
        echo -e "\033[1;31mPASS PATTERN NO. $pattern, \033[m"
    elif [ $colour -eq 2 ]; then
        echo -e "\033[1;33mPASS PATTERN NO. $pattern, \033[m"
    elif [ $colour -eq 3 ]; then
        echo -e "\033[0;32mPASS PATTERN NO. $pattern, \033[m"
    elif [ $colour -eq 4 ]; then
        echo -e "\033[0;36mPASS PATTERN NO. $pattern, \033[m"
    elif [ $colour -eq 5 ]; then
        echo -e "\033[0;34mPASS PATTERN NO. $pattern, \033[m"
    else
        echo -e "\033[0;35mPASS PATTERN NO. $pattern, \033[m"
    fi


}


Print_TEST() {


    # let current+=3
    # let colour=current%7 

    let current+=1
    let colour=current/3
    let colour=colour%7

    if   [ $colour -eq 0 ]; then
        echo -e "\033[0;31m-------------------------------------------------------\033[m"
        echo -e "\033[0;31m   TESTED FOR PROBLEM:  ${problem}                     \033[m"
        echo -e "\033[0;31m-------------------------------------------------------\033[m"
    elif [ $colour -eq 1 ]; then
        echo -e "\033[1;31m-------------------------------------------------------\033[m"
        echo -e "\033[1;31m   TESTED FOR PROBLEM:  ${problem}                     \033[m"
        echo -e "\033[1;31m-------------------------------------------------------\033[m"
    elif [ $colour -eq 2 ]; then
        echo -e "\033[1;33m-------------------------------------------------------\033[m"
        echo -e "\033[1;33m   TESTED FOR PROBLEM:  ${problem}                     \033[m"
        echo -e "\033[1;33m-------------------------------------------------------\033[m"
    elif [ $colour -eq 3 ]; then
        echo -e "\033[0;32m-------------------------------------------------------\033[m"
        echo -e "\033[0;32m   TESTED FOR PROBLEM:  ${problem}                     \033[m"
        echo -e "\033[0;32m-------------------------------------------------------\033[m"
    elif [ $colour -eq 4 ]; then 
        echo -e "\033[0;32m-------------------------------------------------------\033[m"
        echo -e "\033[0;36m   TESTED FOR PROBLEM:  ${problem}                     \033[m"
        echo -e "\033[0;32m-------------------------------------------------------\033[m"
    elif [ $colour -eq 5 ]; then
        echo -e "\033[0;34m-------------------------------------------------------\033[m"
        echo -e "\033[0;34m   TESTED FOR PROBLEM:  ${problem}                     \033[m"
        echo -e "\033[0;34m-------------------------------------------------------\033[m"
    else
        echo -e "\033[0;35m-------------------------------------------------------\033[m"
        echo -e "\033[0;35m   TESTED FOR PROBLEM:  ${problem}                     \033[m"
        echo -e "\033[0;35m-------------------------------------------------------\033[m"
    fi

    echo ""

}


test_problem() {
    local prolbem=$1
    local source_c_file="./CPP/${problem}.c"
    local source_asm_file="./SPIM/${problem}.s"
    local executable_file="./$problem"
    
    let pattern=0

    if [ ! -f "$source_c_file" ]; then
        echo "Source c file not found: $source_c_file"
        return
    fi

    if [ ! -f "$source_asm_file" ]; then
        echo "Source asm file not found: $source_asm_file"
        return
    fi

    gcc "$source_c_file" -o "$executable_file"
    
    testcase_files=($(ls $TESTCASE_ROOT | grep $problem))
    for file in "${testcase_files[@]}"; do
        local testcase_path="$TESTCASE_ROOT/$file"
        local testcase_answer_path="$TESTCASE_ANSWER_ROOT/$file"
        local student_answer_path="$STUDENT_ANSWER_ROOT/$file"

        "$executable_file" < "$testcase_path" > "$testcase_answer_path"
        spim -file "$source_asm_file" < "$testcase_path" | tail -n $(awk 'END {print NR}' $testcase_answer_path) > "$student_answer_path"

        diff_output=$(diff $testcase_answer_path $student_answer_path)

        if [ "$diff_output" ]; then
            echo "$file FAIL"
            FALI_TASK
            exit 1
        else
            Print_PASS
        fi

    done

    rm "$executable_file"
}

mkdir -p "$TESTCASE_ANSWER_ROOT"
mkdir -p "$STUDENT_ANSWER_ROOT"

echo ""

let current=0

for problem in "${problems[@]}"; do
    Print_TEST
    test_problem "$problem"
    echo ""
    echo ""
done

PASS_TASK

trap FAIL_TASK Err

