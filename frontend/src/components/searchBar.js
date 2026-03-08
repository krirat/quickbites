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
        <div className="flex justify-center w-full ">
            <input
                id="search"
                className="p-4 max-w-screen-sm w-full focus:outline-none border-2 border-black rounded-l-lg border-r-0"
                type="text"
                spellCheck="false"
                placeholder="Find a recipe"
                value={initialInput}
                onChange={handleSearchInput}
            />
            <div className="relative h-full ">
                <button
                    className="border-black border-2 rounded-r-lg px-5 py-4 bg-[#a4a507] hover:bg-[#8a8b06] h-full font-bold"
                    onClick={() => setIsFilterOpen(!isFilterOpen)}
                    onBlur={() => setIsFilterOpen(false)}
                >
                    Filters
                </button>
                {isFilterOpen && (
                    <ul className="absolute top-full right-0 w-max border-black border-2 bg-white max-h-40 overflow-y-scroll z-10">
                        {recipe_tags.map((item) => (
                            <li key={item.tag_id} className="p-2 hover:bg-gray-200" onMouseDown={(e) => e.preventDefault()} onClick={() => toggleTag(item.tag_id)}>
                                <input
                                    type="checkbox"
                                    className="mr-2"
                                    checked={item.selected}
                                    onChange={(e) => {
                                        e.stopPropagation(); // Prevent the click event from bubbling up to the <li> element
                                        toggleTag(item.tag_id);
                                    }}
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