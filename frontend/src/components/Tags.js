
const tags = [
    "Italian",
    "Beef",]

export default function Tags({ ta }) {
    return (
        <div className="flex gap-2">
            {tags.map((tag, index) => (
                <span key={index} className="bg-[#a4a507] text-white px-3 py-1 rounded-full">
                    {tag}
                </span>
            ))}
        </div>
    );
}