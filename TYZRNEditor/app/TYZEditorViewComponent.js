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
			isEditing: true
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