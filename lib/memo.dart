//List<String> summraize = [];
//[肩の平行具合、ケンダル、ヒップハンド、バックハンド、イズヒップハンド、膝までの角度(右)、腰までの角度(右)、肩までの角度(右)、膝までの角度(左)、腰までの角度(左)、肩までの角度(左)]

//テキストペインター用定義
//バックカラー指定してる

//アドバイスを選択するためにsummaraizeから参照している
// [5]right_hug_height_point)
// [6]right_kendall_point
// [7]right_shoulder_point)
// [8]right_hug_height_point)
// [9]right_kendall_point
// [10]right_shoulder_point)

//TextStyle → main_text_colors
//backgroundColor → main_colors
//AppBar → appbar_colors

//色
// var appbar_colors = Colors.white;
// var appbar_text_colors = Colors.black;
// var main_colors = Colors.black;
// var sub_colors = Colors.black;
// var main_text_colors = Colors.white;
// var sub_text_colors = Colors.white;

// main→ManualPage
//
// 測定buttonのみ表示する
//
// manual.dart
//
// ManualPage→JunbiINPage
//
// 環境説明とばす
//
// ManualPage→JunbiOUTPage
//
// 撮影の流れをアニメーションで説明する
//
// junbi.dart
//
// JunbiINPage→TakePictureScreen
//
// JunbiOUTPage→OutTakePicture1
//
// inget.dart
//
// TakePictureScreen→BlazePage1→Pause1Page→BlazePage2→Pause2Page→BlazePage3→Pause3Page
//
// 楕円と矢印常に表示（矢印方向をむいてください）
//
// 撮影終了後音声案内をする
//
// outget.dart
//
// OutTakePicture1→OutBlazePage1→OutBlazePage2→OutBlazePage3
//
// 修正ページのUI変更する
//
// inget.dart
//
// BlazePage1→TakePictureScreen1→TakePictureScreen2→TakePictureScreen3→SavePageIn
//
// 確認画面なにしていいかわからない
//
// outblaze.dart
//
// OutBlazePage1→OutTakePicture2→OutTakePicture3→SavePageOut
//
//
//
// blazepaint.dart
//
// SavePageIn→BlazeLandmarkPage1→BlazeLandmarkPage2→BlazeLandmarkPage3→Evaluation
//
// SavePageOut→BlazeLandmarkPage1→BlazeLandmarkPage2→BlazeLandmarkPage3→Evaluation