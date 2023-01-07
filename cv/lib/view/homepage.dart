import 'package:cv/view/Modal/education_modal.dart';
import 'package:cv/view/Modal/expriendModal.dart';
import 'package:cv/view/Modal/exprinece_worksModal.dart';
import 'package:cv/view/Modal/language_modal.dart';
import 'package:cv/view/Modal/person_detial_modal.dart';
import 'package:cv/view/Modal/skills_modal.dart';
import 'package:cv/view/design_pdf.dart';
import 'package:cv/view/providers/education_add.dart';
import 'package:cv/view/providers/exp_works.dart';
import 'package:cv/view/providers/exprience_add.dart';
import 'package:cv/view/providers/language.dart';
import 'package:cv/view/providers/skills.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person> persons = [];

  List<String> genderOption = [
    'Male',
    'Female',
    'Other',
  ];
  String? selectedGender;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addreshController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController githubUserNameController = TextEditingController();
  TextEditingController instaUsernameController = TextEditingController();
  TextEditingController likedenUsernameController = TextEditingController();
  TextEditingController aboutYouController = TextEditingController();
  TextEditingController languagesControler = TextEditingController();
  TextEditingController postTitleControler = TextEditingController();
  TextEditingController orgNameControler = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController boardNameController = TextEditingController();
  TextEditingController educationtitleController = TextEditingController();
  TextEditingController passYearController = TextEditingController();
  TextEditingController gradeControler = TextEditingController();
  GlobalKey<FormState> educationFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> exprienceFormKey = GlobalKey<FormState>();
  TextEditingController skillControler = TextEditingController();
  TextEditingController workdListControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final educationFromProvider = Provider.of<Educ>(context, listen: true);
    final languageFromProvider = Provider.of<Langu>(context, listen: true);

    final skillFromProvider = Provider.of<Skill>(context, listen: true);
    final exprienceFromProvider = Provider.of<Exprience>(context, listen: true);
    final worksFromProvider = Provider.of<ExpWorks>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text("")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            textForm(firstNameController, "First Name:", 'Ram',
                                TextInputType.text, 1),
                            const SizedBox(
                              height: 15,
                            ),
                            textForm(middleNameController, "Middle Name:",
                                'Prashad', TextInputType.text, 1),
                            const SizedBox(
                              height: 15,
                            ),
                            textForm(lastNameController, "Last Name:", 'Subedi',
                                TextInputType.text, 1),
                            const SizedBox(
                              height: 15,
                            ),
                            textForm(
                                aboutYouController,
                                "About you(max:500 min:100) words",
                                'I am an energetic....',
                                TextInputType.text,
                                4),
                            const SizedBox(
                              height: 15,
                            ),
                            textForm(addreshController, "Address", 'Butwal',
                                TextInputType.text, 1),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Phone Number:",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w500),
                            ),
                            TextFormField(
                              validator: ((value) {
                                if (value!.isEmpty) {
                                  return 'field can\'t be empty ';
                                }
                                if (value.length != 10) {
                                  return 'Mobile Number must be of 10 digit ';
                                }
                                return null;
                              }),
                              cursorColor: Colors.grey,
                              controller: phoneNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 14),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                hintText: '9843248593',
                                hintStyle: TextStyle(color: Colors.grey[600]),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            textForm(
                                emailController,
                                "Email",
                                'email@gmail.com',
                                TextInputType.emailAddress,
                                1),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Select Gender:",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 60,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                      )),
                                  value: selectedGender,
                                  validator: ((value) {
                                    if (value!.isEmpty) {
                                      return 'field can\'t be empty ';
                                    }
                                    return null;
                                  }),
                                  items: genderOption.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value!;
                                    });
                                  }),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            textFormNoValidate(
                                githubUserNameController,
                                "Github Username:(Optional)",
                                '@ramsubedi',
                                TextInputType.multiline,
                                1),
                            const SizedBox(
                              height: 15,
                            ),
                            textFormNoValidate(
                                instaUsernameController,
                                "Instagaram username:(Optional)",
                                '@iamram',
                                TextInputType.multiline,
                                1),
                            const SizedBox(
                              height: 15,
                            ),
                            textFormNoValidate(
                                likedenUsernameController,
                                "Linkeden Username:(Optional)",
                                '@ram_subedi',
                                TextInputType.multiline,
                                1),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TypeAndAdd(
                        hintText: "Add languags",
                        headingText: "Languages",
                        onPress: () {
                          if (languagesControler.text.isNotEmpty) {
                            languageFromProvider.addLanguage(
                                Lang(languagesKnown: languagesControler.text));
                            languagesControler.clear();
                          }
                        },
                        textController: languagesControler,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      languageFromProvider.languageList.isEmpty
                          ? const SizedBox()
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 3,
                                crossAxisCount: 3,
                              ),
                              itemCount:
                                  languageFromProvider.languageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                Lang la =
                                    languageFromProvider.languageList[index];
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    elevation: 0,
                                    child: Card(
                                      color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "${la.languagesKnown}",
                                                style: const TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                languageFromProvider
                                                    .removeLanguage(index);
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20,
                                                shadows: [
                                                  Shadow(
                                                      blurRadius: 5,
                                                      color: Colors.white)
                                                ],
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                      const SizedBox(
                        height: 15,
                      ),
                      TypeAndAdd(
                          headingText: "Skill",
                          hintText: "Add Skills",
                          textController: skillControler,
                          onPress: () {
                            if (skillControler.text.isNotEmpty) {
                              skillFromProvider.addSkill(
                                  SkillsModal(skillName: skillControler.text));
                              skillControler.clear();
                            }
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      skillFromProvider.skillList.isEmpty
                          ? const SizedBox()
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 3,
                                crossAxisCount: 3,
                              ),
                              itemCount: skillFromProvider.skillList.length,
                              itemBuilder: (BuildContext context, int index) {
                                SkillsModal s =
                                    skillFromProvider.skillList[index];
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    elevation: 0,
                                    child: Card(
                                      color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "${s.skillName}",
                                                style: const TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                skillFromProvider
                                                    .removeSkill(index);
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20,
                                                shadows: [
                                                  Shadow(
                                                      blurRadius: 5,
                                                      color: Colors.white)
                                                ],
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                      const SizedBox(
                        height: 15,
                      ),
                      Card(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Form(
                                key: educationFormKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textForm(
                                        educationtitleController,
                                        "Education Level",
                                        'SEE',
                                        TextInputType.text,
                                        1),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    textForm(boardNameController, "Board",
                                        'NEB', TextInputType.text, 1),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    textForm(
                                        schoolNameController,
                                        "School Name",
                                        'Chirag secondary school',
                                        TextInputType.text,
                                        1),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    textForm(
                                        passYearController,
                                        "Passed Year(B.S)",
                                        '2075',
                                        TextInputType.number,
                                        1),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    textForm(
                                        passYearController,
                                        "Passed Year(B.S)",
                                        '2075',
                                        TextInputType.number,
                                        1),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Grade",
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextFormField(
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          return 'field can\'t be empty ';
                                        } else if (value.length > 2) {
                                          return 'not valid ';
                                        }
                                        return null;
                                      }),
                                      cursorColor: Colors.grey,
                                      controller: gradeControler,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 14),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        hintText: 'A+',
                                        hintStyle:
                                            TextStyle(color: Colors.grey[600]),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    if (educationFormKey.currentState!
                                        .validate()) {
                                      educationFormKey.currentState!.save();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      var aa = Education(
                                          title: educationtitleController.text,
                                          schoolName: schoolNameController.text,
                                          boardName: boardNameController.text,
                                          passYear: passYearController.text,
                                          grade: gradeControler.text);

                                      educationFromProvider.addLt(aa);
                                    }
                                  },
                                  child: const Text("Add"))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      educationFromProvider.edu.isEmpty
                          ? const SizedBox()
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: educationFromProvider.edu.length,
                              itemBuilder: ((context, index) {
                                return Consumer<Educ>(
                                    builder: (context, value, child) {
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${value.edu[index].schoolName}"),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "Board:${value.edu[index].boardName}"),
                                                        Text(
                                                            "Year:${value.edu[index].passYear}"),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "Level:${value.edu[index].title}"),
                                                        Text(
                                                            "Grade:${value.edu[index].grade}"),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    value.removeLt(index);
                                                  },
                                                  child:
                                                      const Icon(Icons.remove),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              })),
                      const SizedBox(
                        height: 15,
                      ),
                      Card(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Form(
                                key: exprienceFormKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textForm(postTitleControler, "Post",
                                        'Accountant', TextInputType.text, 1),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    textForm(orgNameControler, "Org name",
                                        'ABC pvt ltd', TextInputType.text, 1),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TypeAndAdd(
                                        headingText: "Responsibilites",
                                        hintText: "balance check",
                                        textController: workdListControler,
                                        onPress: () {
                                          if (workdListControler
                                              .text.isNotEmpty) {
                                            worksFromProvider.addWorks(
                                                WorksModal(
                                                    detials: workdListControler
                                                        .text));
                                            workdListControler.clear();
                                          }
                                        }),
                                    worksFromProvider.workList.isEmpty
                                        ? const SizedBox()
                                        : GridView.builder(
                                            shrinkWrap: true,
                                            physics: const ScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 3,
                                              crossAxisCount: 3,
                                            ),
                                            itemCount: worksFromProvider
                                                .workList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              WorksModal s = worksFromProvider
                                                  .workList[index];
                                              return SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                child: Card(
                                                  margin: EdgeInsets.zero,
                                                  elevation: 0,
                                                  child: Card(
                                                    color: Colors.red,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 4),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              s.detials,
                                                              style: const TextStyle(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              worksFromProvider
                                                                  .removeWorks(
                                                                      index);
                                                            },
                                                            child: const Icon(
                                                              Icons.remove,
                                                              size: 20,
                                                              shadows: [
                                                                Shadow(
                                                                    blurRadius:
                                                                        5,
                                                                    color: Colors
                                                                        .white)
                                                              ],
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    if (exprienceFormKey.currentState!
                                        .validate()) {
                                      exprienceFormKey.currentState!.save();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      var ex = ExprienceModal(
                                          jobPost: postTitleControler.text,
                                          orgName: orgNameControler.text,
                                          works: worksFromProvider.workList);

                                      exprienceFromProvider.addExprience(ex);
                                    }
                                  },
                                  child: const Text("Add"))
                            ],
                          ),
                        ),
                      ),
                      exprienceFromProvider.exprienceList.isEmpty
                          ? const SizedBox()
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  exprienceFromProvider.exprienceList.length,
                              itemBuilder: ((context, index) {
                                return Consumer<Exprience>(
                                    builder: (context, value, child) {
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${value.exprienceList[index].jobPost}"),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    value
                                                        .removeExprience(index);
                                                  },
                                                  child:
                                                      const Icon(Icons.remove),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              })),
                      ElevatedButton(
                        onPressed: () {
                          persons.clear();
                          persons.add(
                            //  validation on personal info
                            Person(
                                about: aboutYouController.text,
                                firstName: firstNameController.text,
                                middleName: middleNameController.text,
                                lastName: lastNameController.text,
                                phone: phoneNumberController.text,
                                email: emailController.text,
                                gender: selectedGender.toString(),
                                address: addreshController.text,
                                githubUsername: githubUserNameController.text,
                                instaUsername: instaUsernameController.text,
                                likedenUsername:
                                    likedenUsernameController.text),
                          );
                          DesignPdfClass.displayPdf(
                              context,
                              persons,
                              educationFromProvider.edu,
                              languageFromProvider,
                              skillFromProvider,
                              exprienceFromProvider.exprienceList,
                              worksFromProvider);
                        },
                        child: const Text(
                          'Display PDF',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TypeAndAdd extends StatelessWidget {
  String hintText, headingText;
  VoidCallback onPress;
  TextEditingController textController;
  TypeAndAdd(
      {Key? key,
      required this.headingText,
      required this.hintText,
      required this.textController,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headingText,
          style:
              TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
        ),
        TextFormField(
          cursorColor: Colors.grey,
          keyboardType: TextInputType.text,
          controller: textController,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            hintText: hintText,
            suffix:
                GestureDetector(onTap: onPress, child: const Icon(Icons.add)),
            hintStyle: TextStyle(color: Colors.grey[600]),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget textForm(
    textController, headingName, hintName, TextInputType type, int lines) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$headingName",
        style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
      ),
      TextFormField(
        validator: ((value) {
          if (value!.isEmpty) {
            return 'field can\'t be empty ';
          }
          return null;
        }),
        cursorColor: Colors.grey,
        keyboardType: type,
        controller: textController,
        maxLines: lines,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          hintText: '$hintName',
          hintStyle: TextStyle(color: Colors.grey[600]),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget textFormNoValidate(
    textController, headingName, hintName, TextInputType type, int lines) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$headingName",
        style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
      ),
      TextFormField(
        cursorColor: Colors.grey,
        keyboardType: type,
        controller: textController,
        maxLines: lines,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          hintText: '$hintName',
          hintStyle: TextStyle(color: Colors.grey[600]),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    ],
  );
}
