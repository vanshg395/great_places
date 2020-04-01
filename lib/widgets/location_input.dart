import 'package:flutter/material.dart';

import 'package:location/location.dart';
import '../helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentLocation() async {
    final localData = await Location().getLocation();
    _previewImageUrl = LocationHelper.generateLocationPreview(
        latitude: localData.latitude, longitude: localData.longitude);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          width: double.infinity,
          height: 170,
          child: _previewImageUrl == null
              ? Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.my_location),
              label: Text('Current Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () => _getCurrentLocation(),
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text('Pick a Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
