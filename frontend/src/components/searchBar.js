import React, { useEffect, useState } from 'react';

/**
@param {string} data_source - The URL of the data source to fetch data from
@returns {JSX.Element} The SearchBar component
*/
function SearchBar({ data_source }) {
    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await fetch(data_source);

                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }

                const result = await response.json(); // response example: [{"id":1,"name":"example"}]
                setData(result);
            } catch (err) {
                setError(err);
            } finally {
                setIsLoading(false);
            }
        };

        fetchData();
    }, [data_source]);

    return (
        <div className="search-bar">
            <input
                type="text"
                placeholder="Search..."
                className="border border-gray-300 rounded-md p-2 w-full"
            />
        </div>
    );
}

export default SearchBar;