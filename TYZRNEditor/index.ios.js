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
  NavigatorIOS,
  ListView,
  TouchableOpacity
} = React;

var TYZEditorViewComponent = require('./TYZEditorViewComponent');
var TYZMKEditorViewComponent = require('./TYZMKEditorViewComponent');


var ListDate = ['查看富文本编辑器', '查看markdown编辑器'];

var TYZRNEditor = React.createClass({


  render: function() {
    return ( < NavigatorIOS style = {
        styles.container
      }
      barTintColor = {
        '#FF0700'
      }
      titleTextColor = {
        '#FFFBF9'
      }
      initialRoute = {
        {
          title: '富文本编辑器',
          component: ListViewContent
        }
      }
      />
    );
  }
});


var ListViewContent = React.createClass({

  getInitialState: function() {
    var ds = new ListView.DataSource({
      rowHasChanged: (r1, r2) => r1 !== r2
    });
    return {
      dataSource: ds.cloneWithRows(['row 1', 'row 2']),
    };
  },
  componentWillMount: function() {
    this.setState({
      dataSource: this.state.dataSource.cloneWithRows(ListDate)
    });
  },

  onClickRow: function(rowData) {
    console.log(rowData);
    if (rowData === '查看富文本编辑器') {

      this.props.navigator.push({
        component: TYZEditorViewComponent,
        navigationBarHidden: true
      });
    } else {
      this.props.navigator.push({
        component: TYZMKEditorViewComponent,
        navigationBarHidden: true
      });

    };

  },

  _renderRow: function(rowData, sectionID, rowID, highlightRow) {
    console.log(rowData);
    return (
      <View style={styles.rowStyle}>
          < TouchableOpacity onPress = {()=>this.onClickRow(rowData)
          } >
        <Text style={styles.rowStyle}>{rowData}</Text>
        </TouchableOpacity>
      </View>
    );
  },

  render: function() {
    return (
      <ListView
        dataSource={this.state.dataSource}
        renderRow={this._renderRow} 
        />);
  }

});

var styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  rowStyle: {
    flex: 1,
    height: 50
  }
});

AppRegistry.registerComponent('TYZRNEditor', () => TYZRNEditor);