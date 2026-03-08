
const tagColorMap = {
    "German": "#D9534F",
    "Comfort Food": "#8B4513",
    "Main Dish": "#2E4053",
    "Asian": "#C0392B",
    "Noodles": "#F1C40F",
    "Quick": "#E67E22",
    "Vegan": "#27AE60",
    "Soup": "#F39C12",
    "Autumn": "#D35400",
    "Pasta": "#FFD700",
    "Baking": "#D2B48C",
    "Cookies": "#6F4E37",
    "Holiday": "#C03028",
    "Italian": "#008C45",
    "Winter": "#AED6F1",
    "Spicy": "#FF0000",
    "Vegetarian": "#2ECC71",
    "Salad": "#1E8449",
    "Fish": "#5DADE2",
    "Bowl": "#5D6D7E",
    "Dinner": "#34495E",
    "Greek": "#005A9C",
    "Tart": "#EB984E",
    "Indonesian": "#A93226",
    "Beef": "#7B241C",
    "American": "#3498DB",
    "Dessert": "#AF7AC5",
    "Cake": "#F5B7B1",
    "Indulgent": "#4A235A",
    "Breakfast": "#F4D03F",
    "Healthy": "#16A085",
    "Rice": "#FBFCFC",
    "Mexican": "#F39C12",
    "Chicken": "#F8C471",
    "Fried": "#B7950B",
    "Easy": "#82E0AA",
    "General": "#95A5A6"
};


export default function Tags({ tags, small = false }) {
    return (
        <div className={`flex gap-2 ${small ? 'text-xs' : ''}`}>
            {tags.map((tag) => (
                <span
                    key={tag.tag_id || tag.tag_name}
                    className="text-white px-3 py-1 rounded-full border-2 border-black"
                    style={{ backgroundColor: tagColorMap[tag.tag_name] || '#95A5A6' }}
                >
                    {small ? tag.tag_name.slice(0, 2).toUpperCase() : tag.tag_name}
                </span>
            ))}
        </div>
    );
}