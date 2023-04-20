# Ruler
A ruler is a widget that displays a ruler with a given distance in cm or inches
## Overview
A ruler is a widget that displays a ruler with a given distance in cm or inches
![Double-sided ruler](/docs/double-sided_ruler.png)
<table>
<tr>
<td> Image </td>
<td> Code </td>
<td> description </td>
</tr>
<tr>
<td> <img src="/docs/ruler.count_fit_the_given_distance_to_the_width.png" alt="Ruler.count fit the given distance to the width" /> </td>
<td> 

```dart
Ruler.count(3.cm)
```
</td>
<td> Ruler.count fit the given distance to the width</td>
</tr>
<tr>
<td> <img src="/docs/ruler.dynamic_is_used_to_display_a_ruler_with_a_fixed_width_in_pixels_for_notch.png" alt="Ruler.dynamic is used to display a ruler with a fixed width in pixels for notch" /> </td>
<td> 

```dart
Ruler.dynamic(3.cm)
```
</td>
<td> Ruler.dynamic is used to display a ruler with a fixed width in pixels for notch</td>
</tr>
<tr>
<td> <img src="/docs/ruler.real_create_an_in_real_life_ruler_equivalent_to_real_cm_or_inches.png" alt="Ruler.real create an in real life ruler equivalent to real cm or inches" /> </td>
<td> 

```dart
Ruler.real(MeasureSystem.imperial)
```
</td>
<td> Ruler.real create an in real life ruler equivalent to real cm or inches</td>
</tr>
<tr>
<td> <img src="/docs/change_color_notches_color.png" alt="Change color notches color" /> </td>
<td> 

```dart
Ruler.count(1.cm, notchColor: Colors.black)
```
</td>
<td> Change color notches color</td>
</tr>
<tr>
<td> <img src="/docs/change_axis_to_vertical_or_horizontal.png" alt="Change axis to vertical or horizontal" /> </td>
<td> 

```dart
Ruler.count(1.cm, axis: Axis.vertical)
```
</td>
<td> Change axis to vertical or horizontal</td>
</tr>
</table>

