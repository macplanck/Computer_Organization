path="../generated/testcase"

rm "${path}/*"



for((i=1; i<20; i++)); do
    echo $i > "${path}/prime.${i}"
done


g++ calculator.cpp 

for((i=1; i<101; i++)); do
    ./a.out > "${path}/calculator.${i}"
done


# g++ prime.cpp 

for((i=1; i<501; i++)); do
    echo $i > "${path}/prime.${i}"
    # ./a.out > "${path}/prime.${i}"
done


# g++ triangle.cpp 

# for((i=1; i<101; i++)); do
#     ./a.out > "${path}/triangle.${i}"
# done


for((i=0; i<101; i++)); do
    echo "1\n$i" > "${path}/triangle.${i}"
done

for((i=101; i<201; i++)); do
    let j=i/2
    echo "2\n$j" > "${path}/triangle.${i}"
done

# g++ fibonacci.cpp 

# for((i=1; i<31; i++)); do
#     ./a.out > "${path}/fibonacci.${i}"
# done


for((i=1; i<31; i++)); do
    echo $i > "${path}/fibonacci.${i}"
    # ./a.out > "${path}/prime.${i}"
done
