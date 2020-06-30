import 'package:newsbuster/src/notifiers/article_list_model.dart';
import 'package:newsbuster/src/screens/base_article_list_screen.dart';


class HomeScreen extends BaseArticleListScreen{
  HomeScreen({ArticlesType articleType}):super(articleType:articleType);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends BaseArticleListScreenState{}