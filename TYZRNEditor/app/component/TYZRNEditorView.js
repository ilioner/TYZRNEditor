var React = require('react-native');
var PropTypes = require('ReactPropTypes');
var {
	requireNativeComponent
} = React;

var TYZRNEditorViewManager = React.NativeModules.TYZRNEditorViewManager;

var TYZRNEditorView = React.createClass({

	propTypes: {
		contentStr: PropTypes.string,
		titleStr: PropTypes.string,
	},

	getInitialState: function() {
		return {
			contentStr: this.props.contentStr,
			titleStr: this.props.string
		};
	},

	//获取编辑器内容
	getContentString: function() {
		TYZRNEditorViewManager.getContentStrMethod((error, events) => {
			debugger;
			if (error) {
				console.error(error);
				return null;
			} else {
				console.log(events);
				this.setState({
					contentStr: events
				});
				return events;
			}
		});
	},
	//获取编辑器内容题目
	getTitleString: function() {
		TYZRNEditorViewManager.getTitleStrMethod((error, events) => {
			debugger;
			if (error) {
				console.error(error);
				return null;
			} else {
				console.log(events);
				this.setState({
					titleStr: events
				});
				return events;
			}
		});
	},

	render: function() {
		TYZRNEditorView.context = this;
		return ( < RCTMyEditorView {...this.props
			}
			/>
		);
	}
});


var RCTMyEditorView = requireNativeComponent('TYZRNEditorView', TYZRNEditorView);

module.exports = TYZRNEditorView;