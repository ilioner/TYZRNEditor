var React = require('react-native');
var {
	requireNativeComponent
} = React;


class TYZRNEditorView extends React.Component {


	_onChange(event: Event) {
		if (!this.props.contentStr || !this.props.titleStr) {
			return;
		}
		debugger;
		console.log(event);
		this.setProps({
			contentStr: React.PropTypes.string,
			titleStr: React.PropTypes.string
		});

	}

	render() {
		return ( < RCTMyEditorView {...this.props
			}
			onChange = {
				this._onChange
			}
			/>
		);
	}
}


TYZRNEditorView.propTypes = {
	contentStr: React.PropTypes.string,
	titleStr: React.PropTypes.string
};


// requireNativeComponent 自动把这个组件提供给 "TYZRNEditorViewManager"

var RCTMyEditorView = requireNativeComponent('TYZRNEditorView', TYZRNEditorView);

module.exports = TYZRNEditorView;