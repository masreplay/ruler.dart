# Ruler
A ruler is a widget that displays a ruler with a given distance in cm or inches
## Overview
A ruler is a widget that displays a ruler with a given distance in cm or inches
#### Ruler.real create an in real life ruler equivalent to real cm or inches
<img src="/docs/images/ruler_real_.png" alt="Ruler.real create an in real life ruler equivalent to real cm or inches" />

```dart
Ruler.real()
```

#### Ruler.count fit the given distance to the width
<img src="/docs/images/ruler_count_.png" alt="Ruler.count fit the given distance to the width" />

```dart
Ruler.count(10.cm),
```

#### Ruler.dynamic is used to display a ruler with a fixed width in pixels for notch
<img src="/docs/images/ruler_dynamic_.png" alt="Ruler.dynamic is used to display a ruler with a fixed width in pixels for notch" />

```dart
Ruler.dynamic(300.cm),
```

#### Double-sided ruler
<img src="/docs/images/double_sided.png" alt="Double-sided ruler" />

```dart
DynamicDoubleSidedRuler(
      cmWidth: 100,
      child: Container(color: Colors.red, height: 100, width: 100),
    );
```

### Table of contents
<table>
<tr>
<td> Image </td>
<td> Code </td>
<td> description </td>
</tr>
<tr>
<td> <img src="/docs/images/ruler_count.png" alt="Ruler.count fit the given distance to the width" /> </td>
<td> 

```dart
Ruler.count(3.cm),
```
</td>
<td> Ruler.count fit the given distance to the width</td>
</tr>
<tr>
<td> <img src="/docs/images/ruler_dynamic.png" alt="Ruler.dynamic is used to display a ruler with a fixed width in pixels for notch" /> </td>
<td> 

```dart
Ruler.dynamic(300.cm)
```
</td>
<td> Ruler.dynamic is used to display a ruler with a fixed width in pixels for notch</td>
</tr>
<tr>
<td> <img src="/docs/images/ruler_real.png" alt="Ruler.real create an in real life ruler equivalent to real cm or inches" /> </td>
<td> 

```dart
Ruler.count(1.cm)
```
</td>
<td> Ruler.real create an in real life ruler equivalent to real cm or inches</td>
</tr>
<tr>
<td> <img src="/docs/images/notch_color.png" alt="Change color notches color" /> </td>
<td> 

```dart
Ruler.count(1.cm, notchColor: Colors.black)
```
</td>
<td> Change color notches color</td>
</tr>
<tr>
<td> <img src="/docs/images/axis.png" alt="Change axis to vertical or horizontal" /> </td>
<td> 

```dart
Ruler.count(1.cm, axis: Axis.vertical)
```
</td>
<td> Change axis to vertical or horizontal</td>
</tr>
</table>

