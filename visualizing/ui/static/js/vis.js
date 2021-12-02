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
    
    //sum
    var sum = 0;
    for(let i = 51; i < 99; i++){
        sum += temp_data.get(i);
    }
    
    //getting the category names
    var category_names = ["Action", "Adventure", "Arcade", "Art & Design", "Auto & Vehicles", "Beauty", "Board", "Books & Reference", "Business",
    "Card", "Casino", "Casual", "Comics", "Communication", "Dating", "Education", "Educational", "Entertainment", "Events", 
    "Finance", "Food & Drink", "Health & Fitness", "House & Home", "Libraries & Demo", "Lifestyle", "Maps & Navigation", 
    "Medical", "Music", "Music & Audio", "News & Magazines", "Parenting", "Personalization", "Photography", "Productivity", 
    "Puzzle", "Racing", "Role Playing", "Shopping", "Simulation", "Social", "Sports", "Strategy", "Tools", "Travel & Local", 
    "Trivia", "Video Players & Editors", "Weather", "Word"];
    var i = 51;
    const vis_data = [];
    for(let cat in category_names){
        vis_data.push({
            "name" : category_names[cat],
            "value" : temp_data.get(i)/sum
        });
        sum += temp_data.get(i);
        i++;
    }

    //top 10 categories
    //ordering the vis_data based on values
    vis_data.sort(
        function(d1, d2){
            return (d2['value']) - (d1['value']);
    });

    //top categories out of the 48 ones
    const vis_data_top = [];
    for(let i = 0; i < 20; i++){
        vis_data_top.push({
            "name": vis_data[i].name,
            "value": vis_data[i].value,
        });
    }
    console.log("hi")
    console.log(vis_data)
    console.log(vis_data_top)
    //visualizing
    //bar plot
    // Copyright 2021 Observable, Inc.
    // Released under the ISC license.
    // https://observablehq.com/@d3/bar-chart
    function BarChart(data, strname, {
        x = (d, i) => i, // given d in data, returns the (ordinal) x-value
        y = d => d, // given d in data, returns the (quantitative) y-value
        title, // given d in data, returns the title text
        marginTop = 20, // the top margin, in pixels
        marginRight = 0, // the right margin, in pixels
        marginBottom = 30, // the bottom margin, in pixels
        marginLeft = 40, // the left margin, in pixels
        width = 640, // the outer width of the chart, in pixels
        height = 400, // the outer height of the chart, in pixels
        xDomain, // an array of (ordinal) x-values
        xRange = [marginLeft, width - marginRight], // [left, right]
        yType = d3.scaleLinear, // y-scale type
        yDomain, // [ymin, ymax]
        yRange = [height - marginBottom, marginTop], // [bottom, top]
        xPadding = 0.1, // amount of x-range to reserve to separate bars
        yFormat, // a format specifier string for the y-axis
        yLabel, // a label for the y-axis
        color = "currentColor" // bar fill color
        } = {}) {
        // Compute values.
        const X = d3.map(data, x);
        const Y = d3.map(data, y);

        // Compute default domains, and unique the x-domain.
        if (xDomain === undefined) xDomain = X;
        if (yDomain === undefined) yDomain = [0, d3.max(Y)];
        xDomain = new d3.InternSet(xDomain);

        // Omit any data not present in the x-domain.
        const I = d3.range(X.length).filter(i => xDomain.has(X[i]));

        // Construct scales, axes, and formats.
        const xScale = d3.scaleBand(xDomain, xRange).padding(xPadding);
        const yScale = yType(yDomain, yRange);
        const xAxis = d3.axisBottom(xScale).tickSizeOuter(0);
        const yAxis = d3.axisLeft(yScale).ticks(height / 40, yFormat);

        // Compute titles.
        if (title === undefined) {
            const formatValue = yScale.tickFormat(100, yFormat);
            title = i => `${X[i]}\n${formatValue(Y[i])}`;
        } else {
            const O = d3.map(data, d => d);
            const T = title;
            title = i => T(O[i], i, data);
        }

        const container = d3.select("#"+strname)
        
        const svg = d3.select("#svg-"+strname)
            .attr("id", strname)
            .attr("width", width)
            .attr("height", height)
            .attr("viewBox", [0, 0, width, height])
            .attr("style", "max-width: 100%; height: auto; height: intrinsic;");

        svg.append("g")
            .attr("transform", `translate(${marginLeft},0)`)
            .call(yAxis)
            .call(g => g.select(".domain").remove())
            .call(g => g.selectAll(".tick line").clone()
                .attr("x2", width - marginLeft - marginRight)
                .attr("stroke-opacity", 0.1))
            .call(g => g.append("text")
                .attr("x", -marginLeft)
                .attr("y", 10)
                .attr("fill", "currentColor")
                .attr("text-anchor", "start")
                .text(yLabel));

        const bar = svg.append("g")
            .attr("fill", color)
            .selectAll("rect")
            .data(I)
            .join("rect")
            .attr("x", i => xScale(X[i]))
            .attr("y", i => yScale(Y[i]))
            .attr("height", i => yScale(0) - yScale(Y[i]))
            .attr("width", xScale.bandwidth());

        if (title) bar.append("title")
            .text(title);

        svg.append("g")
            .attr("transform", `translate(0,${height - marginBottom})`)
            .call(xAxis);

        return svg.node();
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

    /*BarChart(vis_data_top, str, {
        x: d => d.name,
        y: d => d.value,
        xDomain: d3.groupSort(vis_data_top, ([d]) => -d.value, d => d.name), // sort by descending frequency
        yFormat: "%",
        yLabel: "↑ Frequency",
        color: "steelblue",
        width: 2000,
        height: 700
    })*/

    //animation

    function BarChart3(data, strname, {
        x = (d, i) => i, // given d in data, returns the (ordinal) x-value
        y = d => d, // given d in data, returns the (quantitative) y-value
        marginTop = 20, // the top margin, in pixels
        marginRight = 0, // the right margin, in pixels
        marginBottom = 30, // the bottom margin, in pixels
        marginLeft = 40, // the left margin, in pixels
        width = 640, // the outer width of the chart, in pixels
        height = 400, // the outer height of the chart, in pixels
        xDomain, // an array of (ordinal) x-values
        xRange = [marginLeft, width - marginRight], // [left, right]
        yType = d3.scaleLinear, // type of y-scale
        yDomain, // [ymin, ymax]
        yRange = [height - marginBottom, marginTop], // [bottom, top]
        xPadding = 0.1, // amount of x-range to reserve to separate bars
        yFormat, // a format specifier string for the y-axis
        yLabel, // a label for the y-axis
        color = "currentColor", // bar fill color
        duration: initialDuration = 250, // transition duration, in milliseconds
        delay: initialDelay = (_, i) => i * 20 // per-element transition delay, in milliseconds
      } = {}) {
        // Compute values.
        const X = d3.map(data, x);
        const Y = d3.map(data, y);
      
        // Compute default domains, and unique the x-domain.
        if (xDomain === undefined) xDomain = X;
        if (yDomain === undefined) yDomain = [0, d3.max(Y)];
        xDomain = new d3.InternSet(xDomain);
      
        // Omit any data not present in the x-domain.
        const I = d3.range(X.length).filter(i => xDomain.has(X[i]));
      
        // Construct scales, axes, and formats.
        const xScale = d3.scaleBand(xDomain, xRange).padding(xPadding);
        const yScale = yType(yDomain, yRange);
        const xAxis = d3.axisBottom(xScale).tickSizeOuter(0);
        const yAxis = d3.axisLeft(yScale).ticks(height / 40, yFormat);
        const format = yScale.tickFormat(100, yFormat);
      
        const container = d3.select("#"+strname)
        
        const svg = d3.select("#svg-"+strname)
            .attr("id", strname)
            .attr("width", width)
            .attr("height", height)
            .attr("viewBox", [0, 0, width, height])
            .attr("style", "max-width: 100%; height: auto; height: intrinsic;");
      
        const yGroup = svg.append("g")
            .attr("transform", `translate(${marginLeft},0)`)
            .call(yAxis)
            .call(g => g.select(".domain").remove())
            .call(g => g.selectAll(".tick").call(grid))
            .call(g => g.append("text")
                .attr("x", -marginLeft)
                .attr("y", 10)
                .attr("fill", "currentColor")
                .attr("text-anchor", "start")
                .text(yLabel));
      
        let rect = svg.append("g")
            .attr("fill", color)
          .selectAll("rect")
          .data(I)
          .join("rect")
            .property("key", i => X[i]) // for future transitions
            .call(position, i => xScale(X[i]), i => yScale(Y[i]))
            .style("mix-blend-mode", "multiply")
            .call(rect => rect.append("title")
                .text(i => [X[i], format(Y[i])].join("\n")));
      
        const xGroup = svg.append("g")
            .attr("transform", `translate(0,${height - marginBottom})`)
            .call(xAxis);
      
        // A helper method for updating the position of bars.
        function position(rect, x, y) {
          return rect
              .attr("x", x)
              .attr("y", y)
              .attr("height", typeof y === "function" ? i => yScale(0) - y(i) : i => yScale(0) - y)
              .attr("width", xScale.bandwidth());
        }
      
        // A helper method for generating grid lines on the y-axis.
        function grid(tick) {
          return tick.append("line")
              .attr("class", "grid")
              .attr("x2", width - marginLeft - marginRight)
              .attr("stroke", "currentColor")
              .attr("stroke-opacity", 0.1);
        }
      
        // Call chart.update(data, options) to transition to new data.
        return Object.assign(svg.node(), {
          update(data, {
            xDomain, // an array of (ordinal) x-values
            yDomain, // [ymin, ymax]
            duration = initialDuration, // transition duration, in milliseconds
            delay = initialDelay // per-element transition delay, in milliseconds
          } = {}) {
            // Compute values.
            const X = d3.map(data, x);
            const Y = d3.map(data, y);
      
            // Compute default domains, and unique the x-domain.
            if (xDomain === undefined) xDomain = X;
            if (yDomain === undefined) yDomain = [0, d3.max(Y)];
            xDomain = new d3.InternSet(xDomain);
      
            // Omit any data not present in the x-domain.
            const I = d3.range(X.length).filter(i => xDomain.has(X[i]));
      
            // Update scale domains.
            xScale.domain(xDomain);
            yScale.domain(yDomain);
      
            // Start a transition.
            const t = svg.transition().duration(duration);
      
            // Join the data, applying enter and exit.
            rect = rect
                .data(I, function(i) { return this.tagName === "rect" ? this.key : X[i]; })
                .join(
                  enter => enter.append("rect")
                      .property("key", i => X[i]) // for future transitions
                      .call(position, i => xScale(X[i]), yScale(0))
                      .style("mix-blend-mode", "multiply")
                      .call(enter => enter.append("title")),
                  update => update,
                  exit => exit.transition(t)
                      .delay(delay)
                      .attr("y", yScale(0))
                      .attr("height", 0)
                      .remove()
                );
      
            // Update the title text on all entering and updating bars.
            rect.select("title")
                .text(i => [X[i], format(Y[i])].join("\n"));
      
            // Transition entering and updating bars to their new position. Note
            // that this assumes that the input data and the x-domain are in the
            // same order, or else the ticks and bars may have different delays.
            rect.transition(t)
                .delay(delay)
                .call(position, i => xScale(X[i]), i => yScale(Y[i]));
      
            // Transition the x-axis (using a possibly staggered delay per tick).
            xGroup.transition(t)
                .call(xAxis)
                .call(g => g.selectAll(".tick").delay(delay));
      
            // Transition the y-axis, then post process for grid lines etc.
            yGroup.transition(t)
                .call(yAxis)
              .selection()
                .call(g => g.select(".domain").remove())
                .call(g => g.selectAll(".tick").selectAll(".grid").data([,]).join(grid));
          }
        });
      }

      chart = BarChart3(vis_data_top, str, {
        x: d => d.name,
        y: d => d.value,
        yFormat: "%",
        yLabel: "↑ Frequency",
        color: "steelblue",
        width: 2000,
        height: 700,
        duration: 750
    })

    update = undefined
    update = chart.update(d3.sort(vis_data_top, order))
}
