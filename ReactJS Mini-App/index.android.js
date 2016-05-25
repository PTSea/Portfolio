/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */

import React, {
  AppRegistry,
  Component,
  StyleSheet,
  Image,
  Text,
  View,
  TouchableHighlight,
  TouchableNativeFeedback,
  TextInput,
  Alert,
  Button
} from 'react-native';

class philipProject extends Component {
  constructor(props) {
  super(props);
    this.state = {
      make: null,
      model: null,
      year: null,
      text: null
    }
  }
  onPressButtonGET() {
    var url = "http://192.168.56.1:3000/" + this.state.text; //use your own IP
    return fetch(url)
      .then((res) => res.json())
      .then((resdata) =>
        this.setState({
          make: resdata.Make,
          model: resdata.Model,
          year: resdata.Year,
          loaded: true,
        })
      )
      .done();
  }
  render() {
      return (
            <View style={styles.container}>
              <Text style={styles.title}>Enter your VIN!</Text>
              <Text style={styles.info}>Make: {this.state.make} </Text>
              <Text style={styles.info}>Model: {this.state.model} </Text>
              <Text style={styles.info}>Year: {this.state.year} </Text>
               <TextInput
                style={{height: 40, width: 175, borderColor: 'black', borderWidth: 1}}
                onChangeText={(text) => this.setState({text})}
                value={this.state.text}
               />
              <TouchableHighlight
                style={styles.button}
                onPress={this.onPressButtonGET.bind(this)}>
                <View>
                  <Text style={styles.buttonText}>View Car Info</Text>
                </View>
              </TouchableHighlight>

            </View>
      );
  }
}


var styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  thumbnail: {
    width: 53,
    height: 81,
  },
  title: {
    fontSize: 20,
    marginBottom: 8,
    textAlign: 'center',
  },
  year: {
    textAlign: 'center',
  },
  button: {

    padding: 5,
    backgroundColor: '#EEEEEE',
    height: 30,
  },
  info: {
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
  },
});

AppRegistry.registerComponent('philipProject', () => philipProject);
