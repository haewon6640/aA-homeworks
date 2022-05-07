import { connect } from 'react-redux';
import GiphysSearch from './giphys_search';
import { fetchSearchGiphys } from '../actions/giphy_actions';

function mapStateToProps(state) {
    return {
        giphys: state.giphys
    }
}

const mapDispatchToProps = dispatch => ({
    fetchSearchGiphys
})

export default connect(null, mapDispatchToProps)(GiphysSearch)