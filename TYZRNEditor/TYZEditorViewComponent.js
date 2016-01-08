/* @flow */
'use strict';

var React = require('react-native');

var {
	StyleSheet,
	View,
	Text,
	TouchableOpacity
} = React;

var TYZRNEditorView = require('./TYZRNEditorView');

var TYZEditorViewComponent = React.createClass({

	_backAction: function() {
		this.props.navigator.pop();
	},

	render: function() {
		//讲当前类映射为TYZEditorViewComponent.mainContent
		TYZEditorViewComponent.mainContent = this;
		return (

			< TYZRNEditorView style = {
				styles.contentStyle
			}
			ref = 'EditorView'
			onRightButtonClicked = {
				this.clickAction
			}
			contentStr = '这是一条初始化的测试内容'
			titleStr = '这是一个标题'
			backAction = {
				this._backAction
			}
			/>
		);
	},
});


var styles = StyleSheet.create({
	contentStyle: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'center',
	}
});

module.exports = TYZEditorViewComponent;