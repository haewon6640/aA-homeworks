export const fetchSearchGiphys = (name) => {
    const giphy_api_key="hzCx7lBatCScs3t0FtruqtIb31Mi6zr9";
    const url = `http://api.giphy.com/v1/gifs/search?q=${name}&api_key=${giphy_api_key}&limit=2`
    return $.ajax({
        url,
        method: 'GET'
    });
}
