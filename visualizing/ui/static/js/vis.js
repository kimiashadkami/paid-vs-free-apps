console.log(d3);

function visualize(data){
    
    //testing to see if data is loaded
    console.log(data);

    //calculating the quanity for each category
    const temp_data = new Map();
    //51 - 99
    for(let i = 1; i < 49; i++){
        temp_data.set(i, 0);
    }
    for(let i = 0; i < data.length; i++){
        var temp = temp_data.get(parseInt(data[i]["Category"]));
        temp ++;
        temp_data.set(parseInt(data[i]["Category"]), temp);
    }
    
    //getting the category names
    var category_names = ["Action", "Adventure", "Arcade", "Art & Design", "Auto & Vehicles", "Beauty", "Board", "Books & Reference", "Business",
    "Card", "Casino", "Casual", "Comics", "Communication", "Dating", "Education", "Educational", "Entertainment", "Events", 
    "Finance", "Food & Drink", "Health & Fitness", "House & Home", "Libraries & Demo", "Lifestyle", "Maps & Navigation", 
    "Medical", "Music", "Music & Audio", "News & Magazines", "Parenting", "Personalization", "Photography", "Productivity", 
    "Puzzle", "Racing", "Role Playing", "Shopping", "Simulation", "Social", "Sports", "Strategy", "Tools", "Travel & Local", 
    "Trivia", "Video Players & Editors", "Weather", "Word"];
    var i = 1;
    const vis_data = [];
    for(let cat in category_names){
        vis_data.push({
            "name" : category_names[cat],
            "value" : temp_data.get(i)
        });
    }
    
    //visualizing
    
}
