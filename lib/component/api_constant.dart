
class ApiConstant {
  static const hostDlUrl ="https://techblog.sasansafari.com";
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  // static const getHomeItems = "${baseUrl}home/?command=index";
  static const getHomeItems =baseUrl + "home/?command=index";
  static const getArticleList =baseUrl + "article/get.php?command=new&user_id=";
  static const getArticleInfo =baseUrl + "article/get.php?command=info&id=1&user_id=1";
  static const postRegister =baseUrl + "register/action.php";
  // static const postRegister = "https://techblog.sasansafari.com/Techblog/api/register/action.php";
}