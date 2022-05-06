export const fetchSearchGiphys = (name) => {
    const url = `http://api.giphy.com/v1/gifs/search?q=${name}&api_key=${process.env.GIPHY_API_KEY}&limit=2`
    return $.ajax({
        url,
        method: 'GET'
    });
}
