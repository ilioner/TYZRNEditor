/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Navigator
} = React;

var TYZEditorViewComponent = require('./TYZEditorViewComponent');
var TYZRNEditor = React.createClass({

  getInitialState: function() {
    return {
      editingButtonTitle: '编辑',
      isEditing: false
    };
  },

  render: function() {
    return (
      <View style={{ flex: 1, }}>
        <TYZEditorViewComponent/>
    </View>
    );
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5FCFF',
  }
});

AppRegistry.registerComponent('TYZRNEditor', () => TYZRNEditor);