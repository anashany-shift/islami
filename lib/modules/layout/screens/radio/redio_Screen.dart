import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:islami/core/setting_provider/radio_provider.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

class radioScreen extends StatefulWidget {
  const radioScreen({super.key});

  @override
  State<radioScreen> createState() => _radioScreenState();
}

class _radioScreenState extends State<radioScreen> {
  late RadioProvider provider;
  @override
  void dispose() {
    super.dispose();
    provider.player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) {
        final provider = RadioProvider();
        provider.getRadio(); // Trigger data fetching
        return provider;
      },
      child: Consumer<RadioProvider>(
        builder: (context, value, child) {
          provider=value;
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (value.errorMessage != null) {
            return Center(child: Text(value.errorMessage ?? 'NO message'));
          } else {
            return Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Bounceable(
                      duration: const Duration(seconds: 1),
                      onTap: () {},
                      child: Image.asset('assets/images/Radio.png')),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  value.radio?.name ?? "No name",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Bounceable(
                        duration: const Duration(seconds: 2),
                        onTap: () {
                          value.previous();
                        },
                        child:
                            Image.asset('assets/icons/Icon metro-next-1.png')),
                    Bounceable(
                        onTap: () {
                          value.play();
                        },
                        child: value.isPlaying
                            ? const Icon(Icons.pause,
                          size: 40,
                          color: AppTheme.lightPrimaryColor,

                        )
                            : Image.asset(
                                'assets/icons/Icon awesome-play.png')),
                    Bounceable(
                        duration: const Duration(seconds: 2),
                        onTap: () {
                          value.next();
                        },
                        child: Image.asset('assets/icons/Icon metro-next.png')),
                  ],
                )
              ],
            );
          }
        },
      ),
    );
  }
}
