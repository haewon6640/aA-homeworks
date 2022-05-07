import * as APIUtil from '../util/api_util';
export const RECEIVE_SEARCH_GIPHYS = "RECEIVE_SEARCH_GIPHYS"
// export "RECEIVE_SEARCH_GIPHYS

export const receiveSearchGiphys = (giphys) => {
    return {
        type: RECEIVE_SEARCH_GIPHYS,
        giphys
    }
}
export const fetchSearchGiphys = (name) => (dispatch) => (
    APIUtil.fetchSearchGiphys()
        .then(giphys =>dispatch(receiveSearchGiphys(giphys.data)))
);