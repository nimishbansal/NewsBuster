import 'package:newsbuster/src/notifiers/article_list_model.dart';
import 'package:newsbuster/src/screens/base_article_list_screen.dart';


class TrendingScreen extends BaseArticleListScreen{
  TrendingScreen({ArticlesType articleType}):super(articleType:articleType);
  @override
  TrendingScreenState createState() {
    return TrendingScreenState();
  }
}
class TrendingScreenState extends BaseArticleListScreenState{}
