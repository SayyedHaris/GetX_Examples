import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_/counter_controller/login_controller.dart';
// import 'package:get_x_/screen_one.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("GetX")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text("This is Title"),
                subtitle: const Text("This is Subtitle"),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("This is Title 1"),
                subtitle: const Text("This is Subtitle 1"),
                onTap: () {
                  Get.bottomSheet(Container(
                    color: Colors.blue,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.light_mode,
                          ),
                          title: const Text("Light Mode"),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.dark_mode,
                          ),
                          title: const Text("Dark Mode"),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                        ),
                      ],
                    ),
                  ));
                },
              ),
            ),

            Obx(
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.emailController.value,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: controller.passwordController.value,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Password"),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        controller.getLogin();
                      },
                      child: controller.isLoading.value
                          ? CircularProgressIndicator()
                          : Container(
                              color: Colors.grey,
                              height: 40,
                              child: Center(child: Text("Login")),
                            ),
                    ),
                  ],
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Get.toNamed(
                  '/screenOne',
                  // arguments: [
                  //   'I myself Harry',
                  //   'Sayyed',
                  // ],
                );
                // Get.to(ScreenOne(
                //   name: " Harry",
                // ));
              },
              child: const Text("Move to First Screen"),
            ),

            //for Language Translations
            // Row(
            //   children: [
            //     OutlinedButton(
            //       onPressed: () {
            //         Get.updateLocale(Locale('en', 'US'));
            //       },
            //       child: Text("English"),
            //     ),
            //     OutlinedButton(
            //       onPressed: () {
            //         Get.updateLocale(Locale('ur', 'PK'));

            //       },
            //       child: Text("Urdu"),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.snackbar(
          //     icon: Icon(Icons.add_a_photo_outlined),
          //     backgroundColor: Colors.blue,
          //     snackPosition: SnackPosition.BOTTOM,
          //     "Hello Harry",
          //     "How Are You");

          Get.defaultDialog(
              title: "Delete Chat",
              middleText: "Are you sure want to delete this?",
              confirm: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Yes")),
              cancel: TextButton(onPressed: () {}, child: const Text("No")));
        },
      ),
    );
  }
}
