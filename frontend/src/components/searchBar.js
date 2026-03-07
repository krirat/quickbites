import React, { useEffect, useState } from 'react';
import useDebounce from './useDebounce';




/**
@param {Array} recipe_tags - The array of recipe tags to display in the filter dropdown
@param {string} initialInput - The initial value for the search input field (optional)
@param {function} onInput - Callback function to handle changes in the search input and selected tags
@param {function} onTagToggle - Callback function to handle tag selection changes
@returns {JSX.Element} The SearchBar component
*/
function SearchBar({ recipe_tags, initialInput = '', onInput, onTagToggle }) {
    const [isFilterOpen, setIsFilterOpen] = useState(false);

    const toggleTag = (id) => {
        onTagToggle(id);
    };

    const handleSearchInput = (e) => onInput(e.target.value);

    return (
        <div className="flex border-black border-2 max-w-screen-sm">
            <input
                id="search"
                className="w-full p-2 focus:outline-none"
                type="text"
                spellCheck="false"
                placeholder="Find a recipe"
                value={initialInput}
                onChange={handleSearchInput}
            />
            <div className="relative h-full">
                <button
                    className="border-black border-l-2 px-5 py-2 bg-[#a4a507] hover:bg-[#8a8b06] h-full"
                    onClick={() => setIsFilterOpen(!isFilterOpen)}
                    onBlur={() => setIsFilterOpen(false)}
                >
                    Filter
                </button>
                {isFilterOpen && (
                    <ul className="absolute top-full right-0 w-max border-black border-2 bg-white max-h-40 overflow-y-scroll">
                        {recipe_tags.map((item) => (
                            <li key={item.tag_id} className="p-2 hover:bg-gray-200" onMouseDown={(e) => e.preventDefault()}>
                                <input
                                    type="checkbox"
                                    className="mr-2"
                                    checked={item.selected}
                                    onChange={() => toggleTag(item.tag_id)}
                                />
                                {item.tag_name}
                            </li>
                        ))}
                    </ul>
                )}
            </div>
        </div>
    );
}

export default SearchBar;