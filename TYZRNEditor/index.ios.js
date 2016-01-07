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
  Navigator,
  TouchableOpacity
} = React;

var TYZEditorViewComponent = require('./app/TYZEditorViewComponent');
var TYZRNEditor = React.createClass({

  getInitialState: function() {
    return {
      editingButtonTitle: '编辑',
      isEditing: false
    };
  },

  _onPressButton: function() {
    TYZEditorViewComponent.mainContent.editingAction();
  },

  render: function() {
    return (
      <View style={{ flex: 1, }}>
      <TouchableOpacity onPress={this._onPressButton}>
          <Text style={{ flex: 1, backgroundColor: '#F5FCFF',marginTop:100}} ref="textF">点我</Text>
        </TouchableOpacity>
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