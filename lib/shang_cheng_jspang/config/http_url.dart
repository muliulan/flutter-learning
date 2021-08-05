import 'package:dio/dio.dart';
import 'package:untitled/shang_cheng_jspang/entity/list_entity.dart';

const httpHead = {
  'Accept': 'application/json, text/plain, */*',
  'Accept-Encoding': 'gzip, deflate, br',
  'Accept-Language': 'zh-CN,zh;q=0.9',
  'Connection': 'keep-alive',
  'Content-Type': 'application/json',
  'Cookie':
      'GCID=0634289-0618c65-0acf98f-bb15e2d; GRID=0634289-0618c65-0acf98f-bb15e2d; gksskpitn=f4850b08-9d95-4137-a1b3-e4b02a67c722; Hm_lvt_59c4ff31a9ee6263811b23eb921a5083=1627288713; Hm_lvt_022f847c4e3acd44d4a2481d9187f1e6=1627288713; LF_ID=1627288713209-9809812-4230153; sajssdk_2015_cross_new_user=1; sensorsdata2015jssdkcross=%7B%22distinct_id%22%3A%2217ae1f7381731a-059230f9c90db3-34637600-2007040-17ae1f73818b81%22%2C%22first_id%22%3A%22%22%2C%22props%22%3A%7B%22%24latest_traffic_source_type%22%3A%22%E8%87%AA%E7%84%B6%E6%90%9C%E7%B4%A2%E6%B5%81%E9%87%8F%22%2C%22%24latest_search_keyword%22%3A%22%E6%9C%AA%E5%8F%96%E5%88%B0%E5%80%BC%22%2C%22%24latest_referrer%22%3A%22https%3A%2F%2Fwww.baidu.com%2Flink%22%2C%22%24latest_landing_page%22%3A%22https%3A%2F%2Ftime.geekbang.org%2F%22%7D%2C%22%24device_id%22%3A%2217ae1f7381731a-059230f9c90db3-34637600-2007040-17ae1f73818b81%22%7D; _ga=GA1.2.1351747255.1627288713; _gid=GA1.2.65561151.1627288713; _gat=1; SERVERID=1fa1f330efedec1559b3abbcb6e30f50|1627288740|1627288713; Hm_lpvt_59c4ff31a9ee6263811b23eb921a5083=1627288740; Hm_lpvt_022f847c4e3acd44d4a2481d9187f1e6=1627288740; gk_process_ev={%22count%22:3}',
  'Host': 'time.geekbang.org',
  'Origin': 'https://time.geekbang.org',
  'Referer': 'https://time.geekbang.org/',
  'sec-ch-ua': '" Not;A Brand";v="99", "Google Chrome";v="91", "Chromium";v="91"',
  'sec-ch-ua-mobile': '?0',
  'Sec-Fetch-Dest': 'empty',
  'Sec-Fetch-Mode': 'cors',
  'Sec-Fetch-Site': 'same-origin',
  'User-Agent':
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36',
};

//    {"message":["afghan","basset","blood","english","ibizan","plott","walker"],"status":"success"}
const list_url = "https://dog.ceo/api/breed/hound/list";

String detailsUrl(String type) {
  return "https://dog.ceo/api/breed/hound/$type/images/random/13";
}

Future<ListEntity> getListDeta() async {
  var response = await Dio().get(list_url);
  var listEntity = ListEntity.fromJson(response.data);
  return listEntity;
}

Future<ListEntity> getDetailsDeta(String type) async {
  var data = {"name": "222"};
  var response = await Dio().get(detailsUrl(type));
  return ListEntity.fromJson(response.data);
}

Future<ListEntity> getDetailsDeta1() async {
  var response = await Dio().get(detailsUrl("afghan"));
  return ListEntity.fromJson(response.data);
}

List<String> getImageList() {
  return [
    "https://images.dog.ceo/breeds/hound-ibizan/n02091244_1340.jpg",
    "https://images.dog.ceo/breeds/hound-ibizan/n02091244_177.jpg",
    "https://images.dog.ceo/breeds/hound-ibizan/n02091244_2198.jpg",
    "https://images.dog.ceo/breeds/hound-ibizan/n02091244_2648.jpg",
    "https://images.dog.ceo/breeds/hound-ibizan/n02091244_2709.jpg",
    "https://images.dog.ceo/breeds/hound-ibizan/n02091244_3552.jpg",
    "https://images.dog.ceo/breeds/hound-ibizan/n02091244_3822.jpg",
    "https://images.dog.ceo/breeds/hound-ibizan/n02091244_4110.jpg",
    "https://images.dog.ceo/breeds/hound-ibizan/n02091244_4177.jpg",
    "https://images.dog.ceo/breeds/hound-ibizan/n02091244_4395.jpg",
  ];
}

String getImage(int aa) {
  return getImageList()[aa];
}
