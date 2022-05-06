import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from "./giphys_search_container"
import { fetchSearchGiphys } from '../util/api_util';


export default class Root extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <Provider store={this.props.store}>
                <GiphysSearchContainer />
            </Provider>
        )
    }
}