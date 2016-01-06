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
} = React;

var TYZEditorViewComponent = require('./app/TYZEditorViewComponent');
var NavigationBar = require('react-native-navbar');
var TYZRNEditor = React.createClass({

  getInitialState: function() {
    return {
      editingButtonTitle: '编辑',
      isEditing: false
    };
  },

  clickRightButton: function() {

    if (this.state.isEditing) {
      this.setState({
        editingButtonTitle: '编辑',
        isEditing: false
      });
      TYZEditorViewComponent.mainContent.editingAction(false);
    } else {

      this.setState({
        editingButtonTitle: '取消',
        isEditing: true
      });
      TYZEditorViewComponent.mainContent.editingAction(true);
    }
    console.log(this.state.isEditing);
  },



  render: function() {
    const rightButtonConfig = {
      title: this.state.editingButtonTitle,
      handler: () => this.clickRightButton(),
      tintColor: '#FFF8FD'
    };

    const titleConfig = {
      title: 'Hello, world',
      tintColor: '#FFF8FD'
    };

    return (
      <View style={{ flex: 1, }}>
      <NavigationBar
        title={titleConfig}
        rightButton={rightButtonConfig} 
        tintColor = {'#FF6124'}/>
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