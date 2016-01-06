/* @flow */
'use strict';

var React = require('react-native');

var {
	StyleSheet,
	View,
} = React;

var TYZRNEditorView = require('./component/TYZRNEditorView');
var TYZRNEditorViewManager = require('react-native').NativeModules.TYZRNEditorViewManager;

var TYZEditorViewComponent = React.createClass({

	getInitialState: function() {
		return {
			isEditing: true,
			contentStr: null
		};
	},

	render: function() {
		//讲当前类映射为TYZEditorViewComponent.mainContent
		TYZEditorViewComponent.mainContent = this;
		return (
			<TYZRNEditorView style={styles.contentStyle} isEditing={this.state.isEditing} ref='EditorView'/>
		);
	},

	editingAction: function(flag) {

		this.setState({
			isEditing: flag
		});
		TYZRNEditorViewManager.editingAction(flag);
	},

	//获取编辑器现有内容
	getContent: function() {
		TYZRNEditorViewManager.findEvents((error, events) => {
			if (error) {
				console.error(error);
			} else {
				alert(events);
				this.setState({

					contentStr: events
				});
			}
		});
	}
});


var styles = StyleSheet.create({
	contentStyle: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'center',
	}
});

module.exports = TYZEditorViewComponent;