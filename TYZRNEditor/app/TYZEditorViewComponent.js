/* @flow */
'use strict';

var React = require('react-native');

var {
	StyleSheet,
	View,
	Text,
	TouchableOpacity
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

			<TYZRNEditorView style={styles.contentStyle} 
							ref='EditorView' 
							onRightButtonClicked={this.clickAction} 
							contentStr = '哈哈哈哈'
							/>
		);
	},

	editingAction: function() {
		console.log(this.refs.EditorView.state);
		console.log(TYZRNEditorView.context.getContentString());
		console.log(TYZRNEditorView.context.getTitleString());
	},

	//获取编辑器现有内容
	getContent: function() {
		TYZRNEditorViewManager.findEvents((error, events) => {
			if (error) {
				console.error(error);
			} else {
				alert(events);
				console.log(events);
				this.setState({
					contentStr: events
				});
				//改变编辑器内容
				var cont = "I'm a test post.<strong>Bold text</strong><em>Italic text</em><a href=\"http://www.wordpress.com\" > I 'm a link!</a>";
				TYZRNEditorViewManager.insertHTML(cont);
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