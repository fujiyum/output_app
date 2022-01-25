function showCountdown() {

   var nowDate = new Date();
   var dnumNow = nowDate.getTime();

   var inputYear  = document.getElementById("userYear").value;
   var inputMonth = document.getElementById("userMonth").value - 1;
   var inputDate  = document.getElementById("userDate").value;
   var inputHour  = document.getElementById("userHour").value;
   var inputMin   = document.getElementById("userMin").value;
   var inputSec   = document.getElementById("userSec").value;
   var targetDate = new Date( inputYear, inputMonth, inputDate, inputHour, inputMin, inputSec );
   var dnumTarget = targetDate.getTime();

   var dlYear  = targetDate.getFullYear();
   var dlMonth = targetDate.getMonth() + 1;
   var dlDate  = targetDate.getDate();
   var dlHour  = targetDate.getHours();
   var dlMin   = targetDate.getMinutes();
   var dlSec   = targetDate.getSeconds();
   var msg1 = "期限の" + dlYear + "/" + dlMonth + "/" + dlDate + " " + dlHour + ":" + dlMin + ":" + dlSec;

   var diff2Dates = dnumTarget - dnumNow;

   var dDays  = diff2Dates / ( 1000 * 60 * 60 * 24 );
   diff2Dates = diff2Dates % ( 1000 * 60 * 60 * 24 );
   var dHour  = diff2Dates / ( 1000 * 60 * 60 );
   diff2Dates = diff2Dates % ( 1000 * 60 * 60 );
   var dMin   = diff2Dates / ( 1000 * 60 );
   diff2Dates = diff2Dates % ( 1000 * 60 );
   var dSec   = diff2Dates / 1000;
   var msg2 = Math.floor(dDays) + "日"
            + Math.floor(dHour) + "時間"
            + Math.floor(dMin) + "分"
            + Math.floor(dSec) + "秒";

   var msg;
   if( dnumTarget > dnumNow ) {
      msg = msg1 + "までは、あと" + msg2 + "です。";
   }
   else {
      msg = "インプットを再登録して下さい。";
   }

   document.getElementById("RealtimeCountdownArea").innerHTML = msg;
}
setInterval('showCountdown()',1000);