/**
 * worker에서 사용되는 구구단
 */

let dan=5;
let str='';
for(i=1; i<=5000; i++){
	str += dan + " * " + i + " = "+(dan*i)+"\n";
	for(j=0; j<100000; j++){} // 시간 딜레이시키기 위해서 아무 의미 없지만 만번 돌림
}
postMessage(str); // worker에게 메시지 보내기


