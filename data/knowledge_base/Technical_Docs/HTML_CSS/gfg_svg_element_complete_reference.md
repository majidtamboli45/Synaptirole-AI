# SVG Element Complete Reference

> Source: https://www.geeksforgeeks.org/html/svg-element-complete-reference

SVG stands for Scalable Vector Graphic. It can be used to make graphics and animations like in HTML canvas. It is a type of vector graphic that may be scaled up or down. Elements are the core things that is required to work with SVGs.
List of SVG Elements:
| SVG Elements | Description | 
|---|---|
| <a> | The <a> element in SVG is used to create a hyperlink to other webpages or any URL. | 
| <animate> | The <animate> SVG element is used to animate an attribute or property of an element over time. | 
| <animateMotion> | The <animateMotion> element let define how an element moves along a motion path. | 
| <animateTransform> | The <animateTransform> element animates a transformation attribute on its target element. | 
| <circle> | The SVG <circle> element is used to draw circle. The center point and radius are given. | 
| <clipPath> | The <clipPath> SVG element is used to define a clipping path that is to be used by the clip-path property. | 
| <defs> | The <defs> in SVG is used whenever we want a particular element to render only when required or when it is called. | 
| <desc> | The <desc> element in SVG is used to provide an accessible text description to any of the available SVG elements whether it is a container or graphic element. | 
| <Ellipse> | The <Ellipse> element is used to create an ellipse. | 
| <feBlend> | <feBlend> element is used to combines two images or SVG fragments into a single graphic. | 
| <feComponentTransfer> | <feComponentTransfer> element implements color manipulations on each color channel separately. | 
| <feConvolveMatrix> | The <feConvolveMatrix> SVG filter primitive changes pixels in the input image with neighboring pixels to produce a resulting image. | 
| <feDiffuseLighting> | The <feDiffuseLighting> filter primitive lights an image using the alpha channel as a bump map. | 
| <feDisplacementMap> | The <feDisplacementMap> SVG filter primitive is use to spatially displace the image content using a displacement map. | 
| <feDropShadow> | The <feDropShadow> element works in combination with other filter primitives to add a drop shadow to the graphic. | 
| <feFlood> | <feFlood> element generates a layer of continuous color that completely fills this element's filter primitive region. | 
| <feGaussianBlur> | The <feGaussianBlur> element adds a smooth blur to the graphic based on the standard deviation provided in the input primitive. | 
| <feImage> | The <feImage> SVG filter primitive fetches image data from an external source and provides the pixel data as output. | 
| <feMerge> | The <feMerge> SVG element allows filter effects to be applied concurrently instead of sequentially. | 
| <feMergeNode> | The <feMergeNode> SVG element takes the result of another filter which is to be processed by its parent element i.e. feMerge element. | 
| <feOffset> | The <feOffset> element is used to create drop shadow effects. | 
| <fePointLight> | The <fePointLight> filter primitive defines a light source which allows to create a point light effect. | 
| <feSpecularLighting> | The <feSpecularLighting> SVG filter primitive lights a source graphic using the alpha channel as a bump map. | 
| <feSpotLight> | The <feSpotLight> SVG defines a light source which results in a spotlight effect. | 
| <feTile> | The <feTile> SVG filter primitive allows to fill a target rectangle with a repeated, tiled pattern of an input image. | 
| <feTurbulence> | The <feTurbulence> SVG filter generates noise which is helpful in simulating several natural phenomena | 
| <filter> | The <filter> element is used to define filters. To identify uniquely filter use id. The filters are defined in def elements. | 
| <foreignObject> | The <foreignObject> element of SVG includes elements from a different XML namespace. | 
| <g> | The <g> element is a container used to group other SVG elements. | 
| <hatch> | The <hatch> element is used to stroke an object. | 
| <image> | The <image> element includes images inside SVG documents. | 
| <Line> | The SVG <Line> element is used to draw line. The start point and endpoints are given to draw the line. | 
| <marker> | The <marker> element in SVG is used to define the graphics that is mostly used for the drawing purpose. | 
| <mask> | The <mask> element defines the transparency and visibility of the input object. | 
| <mpath> | The <mpath> is the sub element for the <animateMotion> element that provides the ability to reference an external <path> element as the definition of a motion path. | 
| <path> | The element <path> is used to define a path that starts from a position and ends to a particular position. | 
| <pattern> | <pattern> element is used to fill shapes with patterns made up of images. | 
| <polygon> | The <polygon> element of SVG is used to make any type of polygon on the SVG. | 
| <polyline> | The <polyline> element of SVG in HTML is used to create a shape by connecting lines through different points. | 
| <rect> | The <rect> element is used to create a rectangle. | 
| <script> | The <script> element allows adding scripts to an SVG document. | 
| <set> | The <set> element provides an easy means of just setting the value of an attribute for a specified duration. | 
| <stop> | <stop> Element tells the color and position to be used within the parent element. | 
| <style> | The <style> element allows style sheets to be embedded directly within the SVG content. | 
| <switch> | The <switch> element is used to evaluate attributes on its direct child elements in order and then renders the first child where these attributes evaluate to true. | 
| <symbol> | The <symbol> element is used to define graphical template objects which can be instantiated by the <use> element. | 
| <text> | The <text> element is used to draw text. | 
| <textPath> | The <textPath> element is used to render the text along with a certain path. | 
| <title> | The <title> element provides an accessible, short-text description of any SVG container element or graphics element. | 
| <tspan> | The <tspan> element defines a subtext within a <text> element or another <tspan> element. | 
| <use> | The <use> element takes nodes from within the SVG document and duplicates them somewhere else. | 
| <view> | The <view> element is used to alter the attributes of viewbox of the original SVG element. | 
Below example will give you a brief idea that how to use the SVG Element:
Example: In this example, we will add an Image and create a polygon.
<!DOCTYPE html>
<html>
<body>
   <center>
   <h1 style="color:green;">
      GeeksforGeeks
   </h1>
   <b>SVG Elements Image and Polygon</b>
   <center>
      <svg width="200" 
           height="200"
           xmlns="https://www.w3.org/2000/svg">
         <image href=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png"
                height="150" 
                width="150"/>
      </svg>
      <svg width="200px" 
           height="200px">
         <!-- try different pairs and make different shapes-->
         <polygon points="100, 100 15, 205 150, 7 20, 0"
                  fill="green" 
                  stroke="yellow"/>
      </svg>
   </center>
</body>
</html>
Output:
