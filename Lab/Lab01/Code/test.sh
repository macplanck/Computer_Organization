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


PASS_TASK() {

    echo "                                                                                      :BBQvi.                                             "
    echo "                                                              .i7ssrvs7              BBBBBBBBQi                                           "
    echo "                        .:r7rrrr:::.        .::::::...   .i7vr:.      .B:           :BBBP :7BBBB.                                         "
    echo "                      .Kv.........:rrvYr7v7rr:.....:rrirJr.   .rgBBBBg  Bi          BBBB     BBBB                                         "
    echo "                     7Q  :rubEPUri:.       ..:irrii:..    :bBBBBBBBBBBB  B         iBBBv     BBBB       vBr                               "
    echo "                    7B  BBBBBBBBBBBBBBB::BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB :R        BBBBBKrirBBBB.     :BBBBBB:                            "
    echo "                   Jd .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: Bi      rBBBBBBBBBBBR.    .BBBM:BBB                             "
    echo "                  uZ .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB .B      BBBB   .::.      EBBBi :BBU                             "
    echo "                 7B .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  B     MBBBr           vBBBu   BBB.                             "
    echo "                .B  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: JJ    i7PB          iBBBBB.  iBBB                              "
    echo "                B. BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  Lu               vBBBBPBBBBPBBB7       .7QBB5i                "
    echo "               Y1 KBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBi XBBBBBBBi :B             :RBBB.  .rBBBBB.      rBBBBBBBB7              "
    echo "              :B .BBBBBBBBBBBBBsRBBBBBBBBBBBrQBBBBB. UBBBRrBBBBBBr 1BBBBBBBBB  B.              .       BBBB       BBBB  :BBBB             "
    echo "              Bi BBBBBBBBBBBBBi :BBBBBBBBBBE .BBK.  .  .   QBBBBBBBBBBBBBBBBBB  Bi                    rBBBr       BBBB    BBBU            "
    echo "             .B .BBBBBBBBBBBBBBQBBBBBBBBBBBB       BBv .LBBBBBBBBBBBBBBBBBBBBBB. B7.:ii:              vBBB        .BBBB   :7i.            "
    echo "            .B  PBBBBBBBBBBBBBBBBBBBBBBBBBBBBbYQB. BB: BBBBBBBBBBBBBBBBBBBBBBBBB  Jr:::rK7              .7  BBB7   iBBBg                  "
    echo "           7M  PBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  BB. BBBBBBBBBBBBBBBBBBBBBBB..i   .   v1                  dBBB.   5BBBr                 "
    echo "          sZ .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  BB. BBBBBBBBBBBBBBBBBBBBBBBBBBB iD2BBQL.                  ZBBBr  EBBBv     YBBBBQi     "
    echo "  .7YYUSIX5 .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  BB. BBBBBBBBBBBBBBBBBBBBBBBBY.:.      :B                   iBBBBBBBBD     BBBBBBBBB.   "
    echo " LB.        ..BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB. BB: BBBBBBBBBBBBBBBBBBBBBBBBMBBB. BP17si                     :LBBBr      vBBBi  5BBB   "
    echo "  KvJPBBB :BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: ZB: BBBBBBBBBBBBBBBBBBBBBBBBBsiJr .i7ssr:                          ...   :BBB:   BBBu  "
    echo " i7ii:.   ::BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBj uBi QBBBBBBBBBBBBBBBBBBBBBBBBi.ir      iB                         .BBBi   BBBB   iMBu  "
    echo "DB    .  vBdBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBg 7Bi BBBBBBBBBBBBBBBBBBBBBBBBBBBBB rBrXPv.                          BBBX   :BBBr        "
    echo " :vQBBB. BQBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBQ iB: BBBBBBBBBBBBBBBBBBBBBBBBBBBBB .L:ii::irrrrrrrr7jIr             .BBBv  :BBBQ        "
    echo " :7:.   .. 5BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  Br BBBBBBBBBBBBBBBBBBBBBBBBBBBB:            ..... ..YB.            .BBBBBBBBB:        "
    echo "BU  .:. BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  B7 gBBBBBBBBBBBBBBBBBBBBBBBBBB. gBBBBBBBBBBBBBBBBBB. BL              rBBBBB1.         "
    echo " rY7iB: BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: B7 BBBBBBBBBBBBBBBBBBBBBBBBBB. QBBBBBBBBBBBBBBBBBi  v5                                "
    echo "     us EBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB Ir BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBgu7i.:BBBBBBBr Bu                                 "
    echo "      B  7BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB.:i BBBBBBBBBBBBBBBBBBBBBBBBBBBv:.  .. :::  .rr    rB                                  "
    echo "      us  .BBBBBBBBBBBBBQLXBBBBBBBBBBBBBBBBBBBBBBBBq  .BBBBBBBBBBBBBBBBBBBBBBBBBv  :iJ7vri:::1Jr..isJYr                                   "
    echo "      B  BBBBBBB  MBBBM      qBBBBBBBBBBBBBBBBBBBBBB: BBBBBBBBBBBBBBBBBBBBBBBBBB  B:           iir:                                       "
    echo "     iB iBBBBBBBL       BBBP. :BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  B.                                                       "
    echo "     P: BBBBBBBBBBB5v7gBBBBBB  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: Br                                                        "
    echo "     B  BBBs 7BBBBBBBBBBBBBB7 :BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB .B                                                         "
    echo "    .B :BBBB.  EBBBBBQBBBBBJ .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB. B.                                                         "
    echo "    ij qBBBBBg          ..  .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB .B                                                          "
    echo "    UY QBBBBBBBBSUSPDQL...iBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBK EL                                                          "
    echo "    B7 BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: B:                                                          "
    echo "    B  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBYrBB vBBBBBBBBBBBBBBBBBBBBBBBB. Ls                                                          "
    echo "    B  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBi_  /UBBBBBBBBBBBBBBBBBBBBBBBBB. :B:                                                        "
    echo "   rM .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  ..IBBBBBBBBBBBBBBBBQBBBBBBBBBB  B                                                        "
    echo "   B  BBBBBBBBBdZBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBPBBBBBBBBBBBBEji:..     sBBBBBBBr Br                                                       "
    echo "  7B 7BBBBBBBr     .:vXQBBBBBBBBBBBBBBBBBBBBBBBBBQqui::..  ...i:i7777vi  BBBBBBr Bi                                                       "
    echo "  Ki BBBBBBB  rY7vr:i....  .............:.....  ...:rii7vrr7r:..      7B  BBBBB  Bi                                                       "
    echo "  B. BBBBBB  B:    .::ir77rrYLvvriiiiiiirvvY7rr77ri:..                 bU  iQBB:..rI                                                      "
    echo ".S: 7BBBBP  B.                                                          vI7.  .:.  B.                                                     "
    echo "B: ir:.   :B.                                                             :rvsUjUgU.                                                      " 
    echo "                                                                                                                                          "
    echo "------------------------------------------------------------------------------------------------------------------------------------------"
    echo "                                                         Congratulations!                                                                 "
    echo "                                                   You have passed all patterns!                                                          "
    echo "------------------------------------------------------------------------------------------------------------------------------------------"

}


FALI_TASK() {
    echo "                                                                                                                                           "
    echo "                                                                                                :L777777v7.                                "
    echo "  i:..::::::i.      :::::         ::::    .:::.                                              .vYr::::::::i7Lvi                             "
    echo "  BBBBBBBBBBBi     iBBBBBL       .BBBB    7BBB7                                             JL..:r777v777i::.ijL                           "
    echo "  BBBB.::::ir.     BBB:BBB.      .BBBv    iBBB:                                           :K: iv777rrrrr777v7:.:J7                         "
    echo "  BBBQ            :BBY iBB7       BBB7    :BBB:                                          :d .L7rrrrrrrrrrrrr77v: iI.                       "
    echo "  BBBB            BBB. .BBB.      BBB7    :BBB:                                         .B .L7rrrrrrrrrrrrrrrrr7v..Br                      "
    echo "  BBBB:r7vvj:    :BBB   gBBs      BBB7    :BBB:                                         S: v7rrrrrrrrrrrrrrrrrrr7v. B:                     "
    echo "  BBBBBBBBBB7    BBB:   .BBB.     BBB7    :BBB:                                        .D i7rrrrrrr777rrrrrrrrrrr7v. B.                    "
    echo "  BBBB    ..    iBBBBBBBBBBBP     BBB7    :BBB:                                        rv v7rrrrrr7rirv7rrrrrrrrrr7v :I                    "
    echo "  BBBB          BBBBi7vviQBBB.    BBB7    :BBB.                                        2i.v7rrrrrr7i  :v7rrrrrrrrrrvi B:                   "
    echo "  BBBB         rBBB.      BBBQ   .BBBv    iBBB2ir777L7                                 2i.v7rrrrrr7v :..v7rrrrrrrrr77 rX                   "
    echo " .BBBB        :BBBB       BBBB7  .BBBB    7BBBBBBBBBBB                                 Yv v7rrrrrrrv..B .vrrrrrrrrrrL.:5                   "
    echo "  . ..        ....         ...:   ....    ..   .......                                 .q r7rrrrrrr7i Pv i7rrrrrrrrrv.:S                   "
    echo "                                                                                        Lr 77rrrrrr77 :B. v7rrrrrrrrv.:S                   "
    echo "                                                                                         B: 7v7rrrrrv. BY i7rrrrrrr7v iK                   "
    echo "                                                                              .::rriii7rir7. .r77777vi 7B  vrrrrrrr7r 2r                   "
    echo "                                                                       .:rr7rri::......    .     .:i7s .B. v7rrrrr7L..B                    "
    echo "                                                        .::7L7rriiiirr77rrrrrrrr72BBBBBBBBBBBBvi:..  .  Br 77rrrrrvi Ki                    "
    echo "                                                    :rv7i::...........    .:i7BBBBQbPPPqPPPdEZQBBBBBr:. ii vvrrrrvr vs                     "
    echo "                    .S77L.                      .rvi:. ..:r7QBBBBBBBBBBBgri.    .:BBBPqqKKqqqqPPPPPEQBBBZi  :777vi vI                      "
    echo "                    B: ..Jv                   isi. .:rBBBBBQZPPPPqqqPPdERBBBBBi.    :BBRKqqqqqqqqqqqqPKDDBB:  :7. Jr                       "
    echo "                   vv SB: iu                rL: .iBBBQEPqqPPqqqqqqqqqqqqqPPPPbQBBB:   .EBQKqqqqqqPPPqqKqPPgBB:  .B:                        "
    echo "                  :R  BgBL..s7            rU: .qBBEKPqqqqqqqqqqqqqqqqqqqqqqqqqPPPEBBB:   EBEPPPEgQBBQEPqqqqKEBB: .s                        "
    echo "               .U7.  iBZBBBi :ji         5r .MBQqPqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPKgBB:  .BBBBBdJrrSBBQKqqqqKZB7  I:                      "
    echo "              v2. :rBBBB: .BB:.ru7:    :5. rBQqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPPBB:  :.        .5BKqqqqqqBB. Kr                     "
    echo "             .B .BBQBB.   .RBBr  :L77ri2  BBqPqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPbBB   .irrrrri  QQqqqqqqKRB. 2i                    "
    echo "              27 :BBU  rBBBdB  iri::::: .BQKqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqKRBsirrr7777L: 7BqqqqqqqXZB. BLv772i              "
    echo "               rY  PK  .:dPMB .Y77777r.:BEqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPPBqiirrrrrv: uBqqqqqqqqqgB  :.:. B:             "
    echo "                iu 7BBi  rMgB .vrrrrrirBEqKqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPQgiirrrrv. QQqqqqqqqqqXBb .BBB .s:.           "
    echo "                i7 BBdBBBPqbB .vrrrriiDgPPbPqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPQDiirr77 :BdqqqqqqqqqqPB. rBB. .:iu7         "
    echo "                iX.:iBRKPqKXB. 77rrri7QPBBBBPqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPB7irr7r .vBBPPqqqqqqKqBZ  BPBgri: 1B        "
    echo "                 ivr .BBqqKXBi r7rriiQgQi   QZKqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPEQiirr7r.  iBBqPqqqqqqPB:.QPPRBBB LK        "
    echo "                   :I. iBgqgBZ :7rriJQPB.   gRqqqqqqqqPPPPPPPPqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqPQ7irrr7vr.  UBqqPPgBBQPBBKqqqKB  B         "
    echo "                     v7 .BBR: .r7riiggqPBrrBBBBBBBBBBBBBBBBBBQEPPqqPPPqqqqqqqqqqqqqqqqqqqqqqqqqPgPiirrrr7v7  rBPBBP:.LBbPqqqqqB. u.        "
    echo "                      .j. .  :77rriiBPqPbBB::::::.....:::iirrSBBBBBBBQZPPPPPqqqqqqqqqqqqqqqqqqqqEQiirrrrrr7v .BB:     :BPqqqqqDB .B        "
    echo "                       YL .i77rrrriLQPqqKQJ.  ............       ..:irBBBBBBZPPPqqqqqqqPPBBEPqqqdRrirrrrrr7v .B  .iBB  dQPqqqqPBi Y:       "
    echo "                     :U:.rv7rrrrriiPgqqqqKZB..v77777777777777ri::..     ..:rBBBBQPPqqqqPBUvBEqqqPRrirrrrrrvi iB:RBBbB7 :BQqPqKqBR r7       "
    echo "                    iI..v7rrrrrrriidgqqqqqKB: 77rrrrrrrrrrrrr77777777ri:..    .:1BBBEPPB:   BbqqPQrirrrr7vr .BBBZPqqDB  .JBbqKPBi vi       "
    echo "                   :B iL7rrrrrrrriibgqqqqqqBr r7rrrrrrrrrrrrrrrrrrrrr777777ri:.   .iBBBBi  .BbqqdRrirr7v7: .Bi.dBBPqqgB:  :BPqgB  B        "
    echo "                   .K.iv7rrrrrrrriiZgqqqqqqEB .vrrrrrrrrrrrrrrrrrrrrrrrrrrr777vv7i.   :PBBBBPqqqEQiir77:  :BB:  .rBPqqEBB. iBZB. Rr        "
    echo "                    iM.:v7rrrrrrrriUQPqqqqqPBi i7rrrrrrrrrrrrrrrrrrrrrrrrr77777i.   .  :BddPqqqqEgiir7. rBBPqBBP. :BXKqgB  BBB. 2r         "
    echo "                     :U:.iv77rrrrrirBPqqqqqqPB: :7777rrrrrrrrrrrrrrr777777ri.   .:uBBBBZPqqqqqqPQLirr77 .BZqqPB:  qMqqPB. Yv:  Ur          "
    echo "                       1L:.:77v77riiqQPqqqqqPbBi  .ir777777777777777ri:..   .:rBBBRPPPPPqqqqqqqgQiirr7vr :BqXQ: .BQPZBBq ...:vv.           "
    echo "                         LJi..::r7riiRgKPPPPqPqBB:.   ............     ..:rBBBBPPqqKKKKqqqPPqPbB1rvvvvvr  BEEDQBBBBBRri. 7JLi              "
    echo "                           .jL  777rrrBBBBBBgEPPEBBBvri:::::::::irrrbBBBBBBDPPPPqqqqqqXPPZQBBBBr........:BBBBg1ri:....:rIr                 "
    echo "                            vI :irrr:....:rrEBBBBBBBBBBBBBBBBBBBBBBBBBBBBBQQBBBBBBBBBBBBBQri:...:.   .:ii:.. .:.:irri::                    "
    echo "                             71vi:::irrr::....    ...:..::::irrr7777777777777rrii::....  ..::irvrr7sUJYv7777v7ii..                         "
    echo "                               .i777i. ..:rrri77rriiiiiii:::::::...............:::iiirr7vrrr:.                                             "
    echo "                                                      .::::::::::::::::::::::::::::::                                                      "
    echo "-------------------------------------------------------------------------------------------------------------------------------------------"
    echo "                                                         Congratulations!                                                                  "
    echo "                                                       You FAIL Successfully!                                                              "
    echo "-------------------------------------------------------------------------------------------------------------------------------------------"
    echo ""
    echo ""

}


test_problem() {
    local prolbem=$1
    local source_c_file="./CPP/${problem}.c"
    local source_asm_file="./SPIM/${problem}.s"
    local executable_file="./$problem"
    
    # echo "Testing Problem: $problem"

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
        fi

    done

    rm "$executable_file"
}


mkdir -p "$TESTCASE_ANSWER_ROOT"
mkdir -p "$STUDENT_ANSWER_ROOT"

for problem in "${problems[@]}"; do
    test_problem "$problem"
    echo "YOU PASSED PROBLEM:    ${problem}"
done

PASS_TASK



