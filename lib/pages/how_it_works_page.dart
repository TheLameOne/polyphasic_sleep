import 'dart:async';
import 'dart:convert';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:polyphasic_sleep_new/components/my_textfield.dart';
import 'package:polyphasic_sleep_new/models/qna_model.dart';
import 'package:flutter/services.dart' as rootbundle;

class HowItWorksPage extends StatefulWidget {
  const HowItWorksPage({super.key});

  @override
  State<HowItWorksPage> createState() => _HowItWorksPageState();
}

class _HowItWorksPageState extends State<HowItWorksPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  var ishidden = false;
  dynamic data;
  var q = "h";
  List<Widget> questionList = [];
  List<Widget> answerList = [];

  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDown(),
        );
      }
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Text(" H O W    I T    W O R K S",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 18)),
              ),
            )),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    children: [
                      FutureBuilder(
                          future: readJsonData(),
                          builder: (context, data) {
                            if (data.hasError) {
                              return Center(child: Text("${data.error}"));
                            } else if (data.hasData) {
                              var qna = data.data as List<QnaModel>;
                              return Column(
                                children: [
                                  for (int i = 0; i < qna.length; i++)
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: BubbleSpecialOne(
                                            text: qna[i].question!,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer,
                                            tail: true,
                                            isSender: true,
                                            textStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer,
                                                fontSize: 16),
                                          ),
                                        ),
                                        for (int j = 0;
                                            j < qna[i].answer!.length;
                                            j++)
                                          (j == 0)
                                              ? BubbleSpecialOne(
                                                  text: qna[i].answer![j],
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiaryContainer,
                                                  tail: true,
                                                  isSender: false,
                                                )
                                              : BubbleSpecialOne(
                                                  text: qna[i].answer![j],
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiaryContainer,
                                                  tail: false,
                                                  isSender: false,
                                                ),
                                      ],
                                    ),
                                  if (answerList.isNotEmpty)
                                    Column(
                                      children: [
                                        for (int i = 0;
                                            i < answerList.length;
                                            i++)
                                          Column(children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: questionList[i],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: answerList[i],
                                            )
                                          ])
                                      ],
                                    )

                                  // if (answerList.isNotEmpty)
                                  //   Container(
                                  //     height: 200,
                                  //     width: 200,
                                  //     child: ListView.builder(
                                  //         itemCount: answerList.length,
                                  //         itemBuilder: (context, index) {
                                  //           return Column(
                                  //             children: [
                                  //               for (int i = 0;
                                  //                   i < answerList.length;
                                  //                   i++)
                                  //                 answerList[i]
                                  //             ],
                                  //           );
                                  //         }),
                                  //   )
                                ],
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                      // _buildanswer()
                    ],
                  ),
                ),
              ),
            ),
            _buildUserInput()
          ],
        ));
  }

  Widget _buildquestion(String question) {
    return BubbleSpecialOne(
      text: question,
      color: Theme.of(context).colorScheme.secondaryContainer,
      tail: true,
      isSender: true,
      textStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontSize: 16),
    );
  }

  Widget _buildanswer(String answer) {
    return BubbleSpecialOne(
      text: answer,
      color: Theme.of(context).colorScheme.tertiaryContainer,
      tail: true,
      isSender: false,
      textStyle:
          TextStyle(color: Theme.of(context).colorScheme.onTertiaryContainer),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 8),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: MyTextfield(
              focusNode: myFocusNode,
              hintText: "Ask me more about Polyphasic Sleep",
              controller: _messageController,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () async {
                    var question = _messageController.text;
                    setState(() {
                      questionList.add(_buildquestion(question));
                    });

                    var url = "https://polyphasic-ai.onrender.com/$question";
                    _messageController.clear();
                    var answer = await getAPiData(url);
                    setState(() {
                      answerList.add(_buildanswer(answer));
                    });
                    print(answer);
                  },
                  icon: Icon(
                    Icons.arrow_upward,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

getAPiData(url) async {
  var response = await http.get(Uri.parse(url));
  Map json = jsonDecode(response.body);
  return json['message'].toString();
}

Future<List<QnaModel>> readJsonData() async {
  final jsondata =
      await rootbundle.rootBundle.loadString('json/questions.json');
  // print(jsondata);
  final list = json.decode(jsondata) as List<dynamic>;
  List<QnaModel> res = [];
  for (var item in list) {
    res.add(QnaModel.fromJson(item));
  }
  return res;
  // return list.map((e) => DataModel.fromJson(e)).toList();
}
