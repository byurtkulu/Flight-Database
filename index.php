<!DOCTYPE html>
<html>
<head>
	<title>Flight Information System</title>
	<?php
	$db = mysqli_connect("localhost", "root", "", "flight_cs306");
	if (!$db) {
		die ("Error connecting to the database");
	}
	$sql = "SELECT *
			FROM flights
			ORDER BY departure_time ASC";
	$result = mysqli_query($db, $sql);
	if (! $result) {
		die("Error fetching result");
	}
	?>
</head>
<body>

<style>
table, th, td {
	border: 1px solid black;
}
</style>
<table>
<thead>
<tr>
	<td>Flight Number</td>
	<td>Plane Model</td>
	<td>Tail Number</td>
	<td>Gate/Park</td>
	<td>Departure Time</td>
	<td>Is Domestic</td>
	<td>Departure</td>
	<td>Destination</td>
	<td>Runway</td>
</tr>
</thead>
<tbody>
	<?php
	while ($row = mysqli_fetch_assoc($result)) {
		$fnum = $row["flight_number"];
		$model = $row["plane_model"];
		$tnum = $row["tail_number"];
		$gate = $row["gate/park"];
		$deptime = $row["departure_time"];
		$dom = $row["isDomestic"];
		$dest = $row["destination"];
		$dep = $row["departure"];
		$runway = $row["runway"];
		echo "
			 <tr>
			 <td>$fnum</td>
			 <td>$model</td>
			 <td>$tnum</td>
			 <td>$gate</td>
			 <td>$deptime</td>
			 ";
			 if ($dom) {
			 	echo "<td>YES</td>";
			 }
			 else {
			 	echo "<td>NO</td>";
			 }
			 echo
			 "<td>$dep</td>
			 <td>$dest</td>
			 <td>$runway</td>
			 </tr>";
		}
	?>
</tbody>
</table>
</body>
</html>
