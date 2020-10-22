module.exports = {
  test: /\.vue(\.erb)?$/,
  use: [{
    loader: 'vue-loader',
	options: {
	  loaders: {
	    'scss': 'vue-style-loader!css-loader!sass-loader',
	    'sass': 'vue-style-loader!css-loader!sass-loader?indentedSyntax',
	    'css': 'vue-style-loader!css-loader!sass-loader',
	  }
	}
  }]
}
