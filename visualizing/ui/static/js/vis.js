function visualize(data, str){
    //calculating the quanity for each category
    const temp_data = new Map();
    for(let i = 51; i < 99; i++){
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
    var i = 51;
    var sum = 0;
    const vis_data = [];
    for(let cat in category_names){
        vis_data.push({
            "name" : category_names[cat],
            "value" : temp_data.get(i)
        });
        sum += temp_data.get(i);
        i++;
    }

    //ordering the vis_data based on values
    vis_data.sort(
        function(d1, d2){
            return (d2['value']) - (d1['value']);
    });

    //top categories out of the 48 ones
    const vis_data_top = [];
    for(let i = 0; i < 5; i++){
        vis_data_top.push({
            "name": vis_data[i].name,
            "value": parseInt(vis_data[i].value*100/sum),
        });
    }
    var subset_sum = 0;
    for(let i = 5; i < vis_data.length; i++){
        subset_sum += vis_data[i].value;
    }
    vis_data_top.push({
        "name": "Other",
        "value": parseInt(subset_sum*100/sum)
    });

    //visualizing

    // Copyright 2021 Observable, Inc.
    // Released under the ISC license.
    // https://observablehq.com/@d3/pie-chart
    function PieChart(data, strname, {
        name = ([x]) => x,  // given d in data, returns the (ordinal) label
        value = ([, y]) => y, // given d in data, returns the (quantitative) value
        title, // given d in data, returns the title text
        width = 640, // outer width, in pixels
        height = 400, // outer height, in pixels
        innerRadius = 0, // inner radius of pie, in pixels (non-zero for donut)
        outerRadius = Math.min(width, height) / 2, // outer radius of pie, in pixels
        labelRadius = (innerRadius * 0.2 + outerRadius * 0.8), // center radius of labels
        format = ",", // a format specifier for values (in the label)
        names, // array of names (the domain of the color scale)
        colors, // array of colors for names
        stroke = innerRadius > 0 ? "none" : "white", // stroke separating widths
        strokeWidth = 1, // width of stroke separating wedges
        strokeLinejoin = "round", // line join of stroke separating wedges
        padAngle = stroke === "none" ? 1 / outerRadius : 0, // angular separation between wedges
    } = {}) {
        // Compute values.
        const N = d3.map(data, name);
        const V = d3.map(data, value);
        const I = d3.range(N.length).filter(i => !isNaN(V[i]));
    
        // Unique the names.
        if (names === undefined) names = N;
        names = new d3.InternSet(names);
    
        // Chose a default color scheme based on cardinality.
        if (colors === undefined) colors = d3.schemeSpectral[names.size];
        if (colors === undefined) colors = d3.quantize(t => d3.interpolateSpectral(t * 0.8 + 0.1), names.size);
    
        // Construct scales.
        const color = d3.scaleOrdinal(names, colors);
    
        // Compute titles.
        if (title === undefined) {
        const formatValue = d3.format(format);
        title = i => `${N[i]}\n${formatValue(V[i])}`;
        } else {
        const O = d3.map(data, d => d);
        const T = title;
        title = i => T(O[i], i, data);
        }
    
        // Construct arcs.
        const arcs = d3.pie().padAngle(padAngle).sort(null).value(i => V[i])(I);
        const arc = d3.arc().innerRadius(innerRadius).outerRadius(outerRadius);
        const arcLabel = d3.arc().innerRadius(labelRadius).outerRadius(labelRadius);

        const container = d3.select("#"+strname)
        
        const svg = d3.select("#svg-"+strname)
            .attr("id", strname)
            .attr("width", width)
            .attr("height", height)
            .attr("viewBox", [-width / 2, -height / 2, width, height])
            .attr("style", "max-width: 100%; height: auto; height: intrinsic;");

        svg.append("g")
            .attr("stroke", stroke)
            .attr("stroke-width", strokeWidth)
            .attr("stroke-linejoin", strokeLinejoin)
        .selectAll("path")
        .data(arcs)
        .join("path")
            .attr("fill", d => color(N[d.data]))
            .attr("d", arc)
        .append("title")
            .text(d => title(d.data));
    
        svg.append("g")
            .attr("font-family", "sans-serif")
            .attr("font-size", 20)
            .attr("text-anchor", "middle")
        .selectAll("text")
        .data(arcs)
        .join("text")
            .attr("transform", d => `translate(${arcLabel.centroid(d)})`)
        .selectAll("tspan")
        .data(d => {
            const lines = `${title(d.data)}`.split(/\n/);
            return (d.endAngle - d.startAngle) > 0.25 ? lines : lines.slice(0, 1);
        })
        .join("tspan")
            .attr("x", 0)
            .attr("y", (_, i) => `${i * 1.1}em`)
            .attr("font-weight", (_, i) => i ? null : "bold")
            .text(d => d + "%");

        return Object.assign(svg.node(), {scales: {color}});
      }

    //generate cards
    const container = d3.select(".my-row")
    container.append("div")
        .attr("class", "card my-card")
        .attr("id", "card-"+str)
        .append("div")
        .attr("class", "card-body")
        .append("h5")
        .attr("class", "card-title")
        .text(str)
    
    container
        .select("#card-"+str)
        .select(".card-body")
        .append("svg")
        .attr("id", "svg-"+str)

    container.select("#card-"+str)
    .select(".card-body")
    .append("a")
    .attr("href", "#")
    .attr("class", "btn btn-primary")
    .text("more")

    PieChart(vis_data_top, str, {
        name: d => d.name,
        value: d => d.value,
        width: 700,
        height: 700
    })
}
