import React from 'react';

import GiphysIndex from './giphys_index';

export default class GiphysSearch extends React.Component {
    constructor(props) {
        super(props);
    }
    componentDidMount() {
        this.props.fetchSearchGiphys();
    }

    render() {
        return (
        <div>
            Hi
        </div>
        )
    }
}