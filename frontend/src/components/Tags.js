
const _tags = [
    "Italian",
    "Beef",]

export default function Tags({ tags }) {
    return (
        <div className="flex gap-2">
            {tags.map((tag) => (
                <span key={tag.tag_id} className="bg-[#a4a507] text-white px-3 py-1 rounded-full">
                    {tag.tag_name}
                </span>
            ))}
        </div>
    );
}