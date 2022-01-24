function showCountdown() {
   // 現在日時を数値(1970-01-01 00:00:00からのミリ秒)に変換
   var nowDate = new Date();
   var dnumNow = nowDate.getTime();

   // 指定日時を数値(1970-01-01 00:00:00からのミリ秒)に変換
   var inputYear  = document.getElementById("userYear").value;
   var inputMonth = document.getElementById("userMonth").value - 1;
   var inputDate  = document.getElementById("userDate").value;
   var inputHour  = document.getElementById("userHour").value;
   var inputMin   = document.getElementById("userMin").value;
   var inputSec   = document.getElementById("userSec").value;
   var targetDate = new Date( inputYear, inputMonth, inputDate, inputHour, inputMin, inputSec );
   var dnumTarget = targetDate.getTime();

   // 表示を準備
   var dlYear  = targetDate.getFullYear();
   var dlMonth = targetDate.getMonth() + 1;
   var dlDate  = targetDate.getDate();
   var dlHour  = targetDate.getHours();
   var dlMin   = targetDate.getMinutes();
   var dlSec   = targetDate.getSeconds();
   var msg1 = "期限の" + dlYear + "/" + dlMonth + "/" + dlDate + " " + dlHour + ":" + dlMin + ":" + dlSec;

   // 引き算して日数(ミリ秒)の差を計算
   var diff2Dates = dnumTarget - dnumNow;

   // 差のミリ秒を、日数・時間・分・秒に分割
   var dDays  = diff2Dates / ( 1000 * 60 * 60 * 24 );   // 日数
   diff2Dates = diff2Dates % ( 1000 * 60 * 60 * 24 );
   var dHour  = diff2Dates / ( 1000 * 60 * 60 );   // 時間
   diff2Dates = diff2Dates % ( 1000 * 60 * 60 );
   var dMin   = diff2Dates / ( 1000 * 60 );   // 分
   diff2Dates = diff2Dates % ( 1000 * 60 );
   var dSec   = diff2Dates / 1000;   // 秒
   var msg2 = Math.floor(dDays) + "日"
            + Math.floor(dHour) + "時間"
            + Math.floor(dMin) + "分"
            + Math.floor(dSec) + "秒";

   // 表示文字列の作成
   var msg;
   if( dnumTarget > dnumNow ) {
      // まだ期限が来ていない場合
      msg = msg1 + "までは、あと" + msg2 + "です。";
   }
   else {
      // 期限が過ぎた場合
      msg = "インプットを再登録して下さい。";
   }

   // 作成した文字列を表示
   document.getElementById("RealtimeCountdownArea").innerHTML = msg;
}
// 1秒ごとに実行
setInterval('showCountdown()',1000);