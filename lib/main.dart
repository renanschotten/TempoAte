import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tempo_ate/providers/theme_provider.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: theme.themeMode,
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(
        title: 'Contagem Regressiva',
      ),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  var clickedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var theme = ref.watch(themeProvider);
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const Text("Escolher tema"),
              DropdownMenu(
                dropdownMenuEntries: const [
                  DropdownMenuEntry(
                    value: ThemeMode.dark,
                    label: "Dark",
                  ),
                  DropdownMenuEntry(
                    value: ThemeMode.light,
                    label: "Light",
                  ),
                  DropdownMenuEntry(
                    value: ThemeMode.system,
                    label: "System",
                  ),
                ],
                onSelected: (value) {
                  switch (value) {
                    case ThemeMode.dark:
                      theme.selectDarkThemeMode();
                      break;
                    case ThemeMode.light:
                      theme.selectLightThemeMode();
                      break;
                    case ThemeMode.system:
                      theme.selectSystemThemeMode();
                      break;
                    default:
                  }
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(),
      body: const SizedBox(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
