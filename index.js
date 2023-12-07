import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Button,
  NativeModules
} from 'react-native';

class RNHighScores extends React.Component {
  render() {
    var contents = this.props['scores'].map((score) => (
      <Text key={score.name}>
        {score.name}:{score.value}
        {'\n'}
      </Text>
    ));
    return (
      <View style={styles.container}>
        <Text style={styles.highScoresTitle}>
          马强测试IOS调用reactView的视图
        </Text>
        <Text style={styles.scores}>{contents}</Text>
        <Button
          onPress={() => {
            const CalendarManager = NativeModules.CalendarManager;
            CalendarManager.addEvent(
             'RN_param1',
              'RN_param2'
          );
          }}
         title="点我返回，并调用oc的方法！"
       />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF'
  },
  highScoresTitle: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10
  },
  scores: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5
  }
});

// Module name
AppRegistry.registerComponent('RNHighScores', () => RNHighScores);
