import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_states.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key, required this.title});
  final String title;

  @override
  State<WeatherForecastScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WeatherForecastScreen> {
  @override
  void initState() {
    context.read<WeatherCubit>().getWeatherFromDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: BlocConsumer<WeatherCubit, WeatherStates>(
          listener: (context, state) {
            if (state is WeatherException) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            if (state is WeatherLoading || state is WeatherInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherFetched) {
              return dataWidget(state);
            } else {
              final st = state as WeatherException;
              return errorWidget(st.error);
            }
          },
        ));
  }

  Widget errorWidget(String msg) {
    return Center(child: Text(msg));
  }

  Widget dataWidget(WeatherStates state) {
    final st = state as WeatherFetched;
    final itemList = st.list;
    if (itemList != null && itemList.isEmpty) {
      return errorWidget("No data found");
    }
    return ListView.builder(
      itemCount: itemList?.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            itemList?[index].forecast_day ?? "null",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(itemList?[index].condition ?? "null"),
          trailing: Text(
            "${itemList?[index].maxtemp_c}/${itemList?[index].mintemp_c}˚C",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        );
        // return Container(
        //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(itemList?[index].forecast_day ?? "null"),
        //       Text(itemList?[index].condition ?? "null"),
        //       Text(
        //         "${itemList?[index].maxtemp_c}/${itemList?[index].mintemp_c}˚C",
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }
}
