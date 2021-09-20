
var quotes=new Array()

//change the quotes if desired. Add/ delete additional quotes as desired.

quotes[0]='삶이 있는 한 희망은 있다. <i>-키케로</i>'

quotes[1]='산다는것 그것은 치열한 전투이다. <i>-로망로랑</i>'

quotes[2]='Have a good day !'

quotes[3]='언제나 현재에 집중할수 있다면 행복할것이다. <i>-파울로 코엘료</i>'

quotes[4]='오늘도 좋은 하루 보내세요 !'

quotes[5]='피할수 없으면 즐겨라. <i>-로버트 엘리엇</i>'

quotes[6]='자신감 있는 표정을 지으면 자신감이 생긴다. <i>-찰스다윈</i>'

quotes[7]='평생 살 것처럼 꿈을 꾸어라.그리고 내일 죽을 것처럼 오늘을 살아라. <i>-제임스 딘</i>'

quotes[8]='길을 잃는 다는 것은 곧 길을 알게 된다는 것이다. <i>-동아프리카 속담</i>'

quotes[9]='인생에 뜻을 세우는데 있어 늦은 때라곤 없다. <i>-볼드윈</i>'

quotes[10]='인생을 다시 산다면 다음번에는 더 많은 실수를 저지르리라. <i>-나딘 스테어</i>'


var whichquote=Math.floor(Math.random()*(quotes.length))
document.write(quotes[whichquote])
