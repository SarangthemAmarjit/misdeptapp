import 'package:flutter/material.dart';


class MISLandingPage extends StatelessWidget {
  const MISLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       Image.asset('assets/gov_logo.png', height: 40),
      //       const SizedBox(width: 15),
      //       const Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text('MANIPUR GOVERNMENT'),
      //           Text('MIS Directorate', style: TextStyle(fontSize: 18)),
      //         ],
      //       ),
      //     ],
      //   ),
      //   backgroundColor: const Color(0xFF0D47A1),
      // ),
      body: SafeArea(
	child: Container(
		constraints: const BoxConstraints.expand(),
		color: Color(0xFFFFFFFF),
		child: Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: [
				Expanded(
					child: Container(
						color: Color(0xFFFFFFFF),
						width: double.infinity,
						height: double.infinity,
						child: SingleChildScrollView(
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									IntrinsicHeight(
										child: Container(
											color: Color(0xFFF9F9F9),
											padding: const EdgeInsets.only( bottom: 40),
											width: double.infinity,
											child: Column(
												crossAxisAlignment: CrossAxisAlignment.start,
												children: [
													IntrinsicHeight(
														child: Container(
															decoration: BoxDecoration(
																border: Border(
																	bottom: BorderSide(
																		color: Color(0xFFE5E8EA),
																		width: 1,
																	),
																),
															),
															padding: const EdgeInsets.only( top: 12, bottom: 12, left: 40, right: 40),
															width: double.infinity,
															child: Row(
																children: [
																	IntrinsicWidth(
																		child: IntrinsicHeight(
																			child: Row(
																				children: [
																					Container(
																						margin: const EdgeInsets.only( right: 16),
																						width: 16,
																						height: 16,
																						child: Image.network(
																							"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/a326849e-2a94-4d22-86e8-12ee7d2ccc88",
																							fit: BoxFit.fill,
																						)
																					),
																					Container(
																						margin: const EdgeInsets.only( bottom: 1),
																						child: Text(
																							"Directorate of MIS",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 18,
																								fontWeight: FontWeight.bold,
																							),
																						),
																					),
																				]
																			),
																		),
																	),
																	Expanded(
																		child: IntrinsicHeight(
																			child: Container(
																				width: double.infinity,
																				child: Column(
																					crossAxisAlignment: CrossAxisAlignment.end,
																					children: [
																						IntrinsicWidth(
																							child: IntrinsicHeight(
																								child: Row(
																									crossAxisAlignment: CrossAxisAlignment.start,
																									children: [
																										Container(
																											margin: const EdgeInsets.only( bottom: 1, right: 36),
																											child: Text(
																												"About Us",
																												style: TextStyle(
																													color: Color(0xFF111416),
																													fontSize: 14,
																													fontWeight: FontWeight.bold,
																												),
																											),
																										),
																										Container(
																											margin: const EdgeInsets.only( bottom: 1, right: 36),
																											child: Text(
																												"Vision & Mission",
																												style: TextStyle(
																													color: Color(0xFF111416),
																													fontSize: 14,
																													fontWeight: FontWeight.bold,
																												),
																											),
																										),
																										Container(
																											margin: const EdgeInsets.only( bottom: 1, right: 36),
																											child: Text(
																												"Genesis & Evolution",
																												style: TextStyle(
																													color: Color(0xFF111416),
																													fontSize: 14,
																													fontWeight: FontWeight.bold,
																												),
																											),
																										),
																										Container(
																											margin: const EdgeInsets.only( bottom: 1, right: 36),
																											child: Text(
																												"Core Responsibilities",
																												style: TextStyle(
																													color: Color(0xFF111416),
																													fontSize: 14,
																													fontWeight: FontWeight.bold,
																												),
																											),
																										),
																										Container(
																											margin: const EdgeInsets.only( bottom: 1, right: 36),
																											child: Text(
																												"CMIS Modules",
																												style: TextStyle(
																													color: Color(0xFF111416),
																													fontSize: 14,
																													fontWeight: FontWeight.bold,
																												),
																											),
																										),
																										Container(
																											margin: const EdgeInsets.only( bottom: 1),
																											child: Text(
																												"Departments & Scope",
																												style: TextStyle(
																													color: Color(0xFF111416),
																													fontSize: 14,
																													fontWeight: FontWeight.bold,
																												),
																											),
																										),
																									]
																								),
																							),
																						),
																					]
																				),
																			),
																		),
																	),
																]
															),
														),
													),
													IntrinsicHeight(
														child: Container(
															padding: const EdgeInsets.symmetric(vertical: 20),
															margin: const EdgeInsets.only( bottom: 40),
															width: double.infinity,
															child: Column(
																children: [
																	IntrinsicHeight(
																		child: Container(
																			width: 960,
																			child: Column(
																				crossAxisAlignment: CrossAxisAlignment.start,
																				children: [
																					Container(
																						margin: const EdgeInsets.all(16),
																						height: 480,
																						width: double.infinity,
																						child: Image.network(
																							"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/d3ccd839-d7c9-478a-b8d0-7ab53178ece2",
																							fit: BoxFit.fill,
																						)
																					),
																					Container(
																						margin: const EdgeInsets.only( top: 20, bottom: 20, left: 16),
																						child: Text(
																							"About Us",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 22,
																								fontWeight: FontWeight.bold,
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
																						width: double.infinity,
																						child: Text(
																							"The Directorate of Management Information System (MIS) is a pivotal entity within the Finance Department of the Government of Manipur. Our mission is to spearhead e-governance initiatives and ensure robust data management across the state. We are committed to leveraging technology to enhance efficiency, transparency, and accountability in financial administration.",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 16,
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.only( top: 20, bottom: 20, left: 16),
																						child: Text(
																							"Vision and Mission",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 22,
																								fontWeight: FontWeight.bold,
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
																						width: double.infinity,
																						child: Text(
																							"Our vision is to transform financial governance in Manipur through innovative technology solutions. Our mission is to provide cutting-edge MIS services, ensuring seamless data integration, process automation, and informed decision-making.",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 16,
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.only( top: 20, bottom: 20, left: 16),
																						child: Text(
																							"Genesis and Evolution",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 22,
																								fontWeight: FontWeight.bold,
																							),
																						),
																					),
																					IntrinsicHeight(
																						child: Container(
																							width: double.infinity,
																							child: Column(
																								crossAxisAlignment: CrossAxisAlignment.start,
																								children: [
																									IntrinsicHeight(
																										child: Container(
																											margin: const EdgeInsets.only( bottom: 8, left: 16, right: 16),
																											width: double.infinity,
																											child: Row(
																												crossAxisAlignment: CrossAxisAlignment.start,
																												children: [
																													Container(
																														margin: const EdgeInsets.only( right: 8),
																														width: 40,
																														height: 66,
																														child: Image.network(
																															"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/e142179e-2bfc-4654-8687-3ac2434c6797",
																															fit: BoxFit.fill,
																														)
																													),
																													Expanded(
																														child: IntrinsicHeight(
																															child: Container(
																																padding: const EdgeInsets.symmetric(vertical: 12),
																																width: double.infinity,
																																child: Column(
																																	crossAxisAlignment: CrossAxisAlignment.start,
																																	children: [
																																		Container(
																																			margin: const EdgeInsets.only( bottom: 1),
																																			child: Text(
																																				"Establishment of MIS Directorate",
																																				style: TextStyle(
																																					color: Color(0xFF111416),
																																					fontSize: 16,
																																					fontWeight: FontWeight.bold,
																																				),
																																			),
																																		),
																																		Container(
																																			margin: const EdgeInsets.only( bottom: 1),
																																			child: Text(
																																				"2010",
																																				style: TextStyle(
																																					color: Color(0xFF5E7287),
																																					fontSize: 16,
																																				),
																																			),
																																		),
																																	]
																																),
																															),
																														),
																													),
																												]
																											),
																										),
																									),
																									IntrinsicHeight(
																										child: Container(
																											margin: const EdgeInsets.only( bottom: 3, left: 24, right: 24),
																											width: double.infinity,
																											child: Row(
																												children: [
																													IntrinsicWidth(
																														child: IntrinsicHeight(
																															child: Container(
																																margin: const EdgeInsets.only( right: 16),
																																child: Column(
																																	children: [
																																		Container(
																																			color: Color(0xFFD6DBE2),
																																			margin: const EdgeInsets.only( bottom: 4),
																																			width: 2,
																																			height: 8,
																																			child: SizedBox(),
																																		),
																																		Container(
																																			margin: const EdgeInsets.only( bottom: 3),
																																			width: 24,
																																			height: 24,
																																			child: Image.network(
																																				"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/f6634d90-d994-431d-9251-b2a4b2b6f5f0",
																																				fit: BoxFit.fill,
																																			)
																																		),
																																		Container(
																																			color: Color(0xFFD6DBE2),
																																			width: 2,
																																			height: 32,
																																			child: SizedBox(),
																																		),
																																	]
																																),
																															),
																														),
																													),
																													Expanded(
																														child: IntrinsicHeight(
																															child: Container(
																																padding: const EdgeInsets.symmetric(vertical: 12),
																																width: double.infinity,
																																child: Column(
																																	crossAxisAlignment: CrossAxisAlignment.start,
																																	children: [
																																		Text(
																																			"Implementation of CMIS",
																																			style: TextStyle(
																																				color: Color(0xFF111416),
																																				fontSize: 16,
																																				fontWeight: FontWeight.bold,
																																			),
																																		),
																																		Text(
																																			"2015",
																																			style: TextStyle(
																																				color: Color(0xFF5E7287),
																																				fontSize: 16,
																																			),
																																		),
																																	]
																																),
																															),
																														),
																													),
																												]
																											),
																										),
																									),
																									IntrinsicHeight(
																										child: Container(
																											margin: const EdgeInsets.symmetric(horizontal: 16),
																											width: double.infinity,
																											child: Row(
																												crossAxisAlignment: CrossAxisAlignment.start,
																												children: [
																													IntrinsicWidth(
																														child: IntrinsicHeight(
																															child: Container(
																																padding: const EdgeInsets.only( bottom: 29, left: 8, right: 8),
																																margin: const EdgeInsets.only( right: 8),
																																child: Column(
																																	children: [
																																		Container(
																																			color: Color(0xFFD6DBE2),
																																			margin: const EdgeInsets.only( bottom: 4),
																																			width: 2,
																																			height: 8,
																																			child: SizedBox(),
																																		),
																																		Container(
																																			width: 24,
																																			height: 24,
																																			child: Image.network(
																																				"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/52c9a2d8-cf99-43fe-97ee-92ab8ad7ca3e",
																																				fit: BoxFit.fill,
																																			)
																																		),
																																	]
																																),
																															),
																														),
																													),
																													Expanded(
																														child: IntrinsicHeight(
																															child: Container(
																																padding: const EdgeInsets.symmetric(vertical: 12),
																																width: double.infinity,
																																child: Column(
																																	crossAxisAlignment: CrossAxisAlignment.start,
																																	children: [
																																		Text(
																																			"Integration with State Departments",
																																			style: TextStyle(
																																				color: Color(0xFF111416),
																																				fontSize: 16,
																																				fontWeight: FontWeight.bold,
																																			),
																																		),
																																		Text(
																																			"2018-Present",
																																			style: TextStyle(
																																				color: Color(0xFF5E7287),
																																				fontSize: 16,
																																			),
																																		),
																																	]
																																),
																															),
																														),
																													),
																												]
																											),
																										),
																									),
																								]
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.only( top: 20, bottom: 20, left: 16),
																						child: Text(
																							"Core Responsibilities",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 22,
																								fontWeight: FontWeight.bold,
																							),
																						),
																					),
																					IntrinsicHeight(
																						child: Container(
																							padding: const EdgeInsets.symmetric(vertical: 16),
																							width: double.infinity,
																							child: Column(
																								crossAxisAlignment: CrossAxisAlignment.start,
																								children: [
																									IntrinsicHeight(
																										child: Container(
																											margin: const EdgeInsets.only( bottom: 12, left: 16, right: 16),
																											width: double.infinity,
																											child: Row(
																												crossAxisAlignment: CrossAxisAlignment.start,
																												children: [
																													Expanded(
																														child: IntrinsicHeight(
																															child: Container(
																																decoration: BoxDecoration(
																																	border: Border.all(
																																		color: Color(0xFFD6DBE2),
																																		width: 1,
																																	),
																																	borderRadius: BorderRadius.circular(8),
																																	color: Color(0xFFF9F9F9),
																																),
																																padding: const EdgeInsets.only( top: 17, bottom: 58),
																																margin: const EdgeInsets.only( right: 12),
																																width: double.infinity,
																																child: Column(
																																	crossAxisAlignment: CrossAxisAlignment.start,
																																	children: [
																																		Container(
																																			margin: const EdgeInsets.only( bottom: 12, left: 17, right: 17),
																																			width: 24,
																																			height: 24,
																																			child: Image.network(
																																				"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/024b6a8a-f9ed-4a47-9a48-930beee1634f",
																																				fit: BoxFit.fill,
																																			)
																																		),
																																		IntrinsicHeight(
																																			child: Container(
																																				margin: const EdgeInsets.symmetric(horizontal: 17),
																																				width: double.infinity,
																																				child: Column(
																																					crossAxisAlignment: CrossAxisAlignment.start,
																																					children: [
																																						Container(
																																							margin: const EdgeInsets.only( bottom: 5),
																																							child: Text(
																																								"Data Governance",
																																								style: TextStyle(
																																									color: Color(0xFF111416),
																																									fontSize: 16,
																																									fontWeight: FontWeight.bold,
																																								),
																																							),
																																						),
																																						Container(
																																							margin: const EdgeInsets.only( bottom: 1),
																																							width: 88,
																																							child: Text(
																																								"Ensuring data integrity and accessibility.",
																																								style: TextStyle(
																																									color: Color(0xFF5E7287),
																																									fontSize: 14,
																																								),
																																							),
																																						),
																																					]
																																				),
																																			),
																																		),
																																	]
																																),
																															),
																														),
																													),
																													Expanded(
																														child: IntrinsicHeight(
																															child: Container(
																																decoration: BoxDecoration(
																																	border: Border.all(
																																		color: Color(0xFFD6DBE2),
																																		width: 1,
																																	),
																																	borderRadius: BorderRadius.circular(8),
																																	color: Color(0xFFF9F9F9),
																																),
																																padding: const EdgeInsets.only( top: 17, bottom: 38),
																																margin: const EdgeInsets.only( right: 12),
																																width: double.infinity,
																																child: Column(
																																	crossAxisAlignment: CrossAxisAlignment.start,
																																	children: [
																																		Container(
																																			margin: const EdgeInsets.only( bottom: 12, left: 17, right: 17),
																																			width: 24,
																																			height: 24,
																																			child: Image.network(
																																				"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/b3c62d6e-2779-4ecc-b6b3-344e221f12e3",
																																				fit: BoxFit.fill,
																																			)
																																		),
																																		IntrinsicHeight(
																																			child: Container(
																																				margin: const EdgeInsets.symmetric(horizontal: 17),
																																				width: double.infinity,
																																				child: Column(
																																					crossAxisAlignment: CrossAxisAlignment.start,
																																					children: [
																																						Container(
																																							margin: const EdgeInsets.only( bottom: 5),
																																							width: 82,
																																							child: Text(
																																								"Payroll Integration",
																																								style: TextStyle(
																																									color: Color(0xFF111416),
																																									fontSize: 16,
																																									fontWeight: FontWeight.bold,
																																								),
																																							),
																																						),
																																						Container(
																																							margin: const EdgeInsets.only( bottom: 1),
																																							width: double.infinity,
																																							child: Text(
																																								"Streamlining payroll processes across departments.",
																																								style: TextStyle(
																																									color: Color(0xFF5E7287),
																																									fontSize: 14,
																																								),
																																							),
																																						),
																																					]
																																				),
																																			),
																																		),
																																	]
																																),
																															),
																														),
																													),
																													Expanded(
																														child: IntrinsicHeight(
																															child: Container(
																																decoration: BoxDecoration(
																																	border: Border.all(
																																		color: Color(0xFFD6DBE2),
																																		width: 1,
																																	),
																																	borderRadius: BorderRadius.circular(8),
																																	color: Color(0xFFF9F9F9),
																																),
																																padding: const EdgeInsets.only( top: 17, bottom: 59),
																																margin: const EdgeInsets.only( right: 12),
																																width: double.infinity,
																																child: Column(
																																	crossAxisAlignment: CrossAxisAlignment.start,
																																	children: [
																																		Container(
																																			margin: const EdgeInsets.only( bottom: 12, left: 17, right: 17),
																																			width: 24,
																																			height: 24,
																																			child: Image.network(
																																				"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/f5890ac5-13aa-4589-ad58-bc1bd26aa75d",
																																				fit: BoxFit.fill,
																																			)
																																		),
																																		IntrinsicHeight(
																																			child: Container(
																																				margin: const EdgeInsets.symmetric(horizontal: 17),
																																				width: double.infinity,
																																				child: Column(
																																					crossAxisAlignment: CrossAxisAlignment.start,
																																					children: [
																																						Container(
																																							margin: const EdgeInsets.only( bottom: 5),
																																							width: 87,
																																							child: Text(
																																								"Process Automation",
																																								style: TextStyle(
																																									color: Color(0xFF111416),
																																									fontSize: 16,
																																									fontWeight: FontWeight.bold,
																																								),
																																							),
																																						),
																																						Container(
																																							margin: const EdgeInsets.only( bottom: 1),
																																							width: double.infinity,
																																							child: Text(
																																								"Automating key financial workflows.",
																																								style: TextStyle(
																																									color: Color(0xFF5E7287),
																																									fontSize: 14,
																																								),
																																							),
																																						),
																																					]
																																				),
																																			),
																																		),
																																	]
																																),
																															),
																														),
																													),
																													Expanded(
																														child: IntrinsicHeight(
																															child: Container(
																																decoration: BoxDecoration(
																																	border: Border.all(
																																		color: Color(0xFFD6DBE2),
																																		width: 1,
																																	),
																																	borderRadius: BorderRadius.circular(8),
																																	color: Color(0xFFF9F9F9),
																																),
																																padding: const EdgeInsets.symmetric(vertical: 17),
																																margin: const EdgeInsets.only( right: 12),
																																width: double.infinity,
																																child: Column(
																																	crossAxisAlignment: CrossAxisAlignment.start,
																																	children: [
																																		Container(
																																			margin: const EdgeInsets.only( bottom: 12, left: 17, right: 17),
																																			width: 24,
																																			height: 24,
																																			child: Image.network(
																																				"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/a248c02f-6bf0-4c4a-b18e-557b5e8a27c2",
																																				fit: BoxFit.fill,
																																			)
																																		),
																																		IntrinsicHeight(
																																			child: Container(
																																				margin: const EdgeInsets.symmetric(horizontal: 17),
																																				width: double.infinity,
																																				child: Column(
																																					crossAxisAlignment: CrossAxisAlignment.start,
																																					children: [
																																						Container(
																																							margin: const EdgeInsets.only( bottom: 5),
																																							width: 89,
																																							child: Text(
																																								"Security & Compliance",
																																								style: TextStyle(
																																									color: Color(0xFF111416),
																																									fontSize: 16,
																																									fontWeight: FontWeight.bold,
																																								),
																																							),
																																						),
																																						Container(
																																							margin: const EdgeInsets.only( bottom: 1),
																																							width: double.infinity,
																																							child: Text(
																																								"Maintaining high security standards and regulatory compliance.",
																																								style: TextStyle(
																																									color: Color(0xFF5E7287),
																																									fontSize: 14,
																																								),
																																							),
																																						),
																																					]
																																				),
																																			),
																																		),
																																	]
																																),
																															),
																														),
																													),
																													Expanded(
																														child: IntrinsicHeight(
																															child: Container(
																																decoration: BoxDecoration(
																																	border: Border.all(
																																		color: Color(0xFFD6DBE2),
																																		width: 1,
																																	),
																																	borderRadius: BorderRadius.circular(8),
																																	color: Color(0xFFF9F9F9),
																																),
																																padding: const EdgeInsets.only( top: 17, bottom: 38),
																																width: double.infinity,
																																child: Column(
																																	crossAxisAlignment: CrossAxisAlignment.start,
																																	children: [
																																		Container(
																																			margin: const EdgeInsets.only( bottom: 12, left: 17, right: 17),
																																			width: 24,
																																			height: 24,
																																			child: Image.network(
																																				"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/7285e06e-aade-43fb-8251-dda3553536d4",
																																				fit: BoxFit.fill,
																																			)
																																		),
																																		IntrinsicHeight(
																																			child: Container(
																																				margin: const EdgeInsets.symmetric(horizontal: 17),
																																				width: double.infinity,
																																				child: Column(
																																					crossAxisAlignment: CrossAxisAlignment.start,
																																					children: [
																																						Container(
																																							margin: const EdgeInsets.only( bottom: 5),
																																							width: 87,
																																							child: Text(
																																								"Analytics & Reporting",
																																								style: TextStyle(
																																									color: Color(0xFF111416),
																																									fontSize: 16,
																																									fontWeight: FontWeight.bold,
																																								),
																																							),
																																						),
																																						Container(
																																							margin: const EdgeInsets.only( bottom: 1),
																																							width: double.infinity,
																																							child: Text(
																																								"Providing insightful financial analytics and reports.",
																																								style: TextStyle(
																																									color: Color(0xFF5E7287),
																																									fontSize: 14,
																																								),
																																							),
																																						),
																																					]
																																				),
																																			),
																																		),
																																	]
																																),
																															),
																														),
																													),
																												]
																											),
																										),
																									),
																									IntrinsicWidth(
																										child: IntrinsicHeight(
																											child: Container(
																												decoration: BoxDecoration(
																													border: Border.all(
																														color: Color(0xFFD6DBE2),
																														width: 1,
																													),
																													borderRadius: BorderRadius.circular(8),
																													color: Color(0xFFF9F9F9),
																												),
																												padding: const EdgeInsets.symmetric(vertical: 17),
																												margin: const EdgeInsets.symmetric(horizontal: 16),
																												child: Column(
																													crossAxisAlignment: CrossAxisAlignment.start,
																													children: [
																														Container(
																															margin: const EdgeInsets.only( bottom: 12, left: 17, right: 135),
																															width: 24,
																															height: 24,
																															child: Image.network(
																																"https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/b0d1ec21-c44f-46af-af56-413128c43b0f",
																																fit: BoxFit.fill,
																															)
																														),
																														IntrinsicWidth(
																															child: IntrinsicHeight(
																																child: Container(
																																	margin: const EdgeInsets.symmetric(horizontal: 17),
																																	child: Column(
																																		crossAxisAlignment: CrossAxisAlignment.start,
																																		children: [
																																			Container(
																																				margin: const EdgeInsets.only( bottom: 5, right: 43),
																																				child: Text(
																																					"User Support",
																																					style: TextStyle(
																																						color: Color(0xFF111416),
																																						fontSize: 16,
																																						fontWeight: FontWeight.bold,
																																					),
																																				),
																																			),
																																			Container(
																																				margin: const EdgeInsets.only( bottom: 1, right: 38),
																																				width: 104,
																																				child: Text(
																																					"Offering comprehensive support to CMIS users.",
																																					style: TextStyle(
																																						color: Color(0xFF5E7287),
																																						fontSize: 14,
																																					),
																																				),
																																			),
																																		]
																																	),
																																),
																															),
																														),
																													]
																												),
																											),
																										),
																									),
																								]
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.only( top: 20, bottom: 20, left: 16),
																						child: Text(
																							"CMIS Modules & Functional Features",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 22,
																								fontWeight: FontWeight.bold,
																							),
																						),
																					),
																					IntrinsicHeight(
																						child: Container(
																							decoration: BoxDecoration(
																								border: Border.all(
																									color: Color(0xFFD6DBE2),
																									width: 1,
																								),
																								borderRadius: BorderRadius.circular(12),
																								color: Color(0xFFF9F9F9),
																							),
																							padding: const EdgeInsets.all(1),
																							margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
																							width: double.infinity,
																							child: Column(
																								crossAxisAlignment: CrossAxisAlignment.start,
																								children: [
																									IntrinsicHeight(
																										child: Container(
																											color: Color(0xFFF9F9F9),
																											width: double.infinity,
																											child: Row(
																												crossAxisAlignment: CrossAxisAlignment.start,
																												children: [
																													Container(
																														margin: const EdgeInsets.only( top: 12, bottom: 12, left: 16),
																														child: Text(
																															"Module",
																															style: TextStyle(
																																color: Color(0xFF111416),
																																fontSize: 14,
																																fontWeight: FontWeight.bold,
																															),
																														),
																													),
																													Container(
																														margin: const EdgeInsets.only( top: 12, bottom: 12, left: 16),
																														child: Text(
																															"Description",
																															style: TextStyle(
																																color: Color(0xFF111416),
																																fontSize: 14,
																																fontWeight: FontWeight.bold,
																															),
																														),
																													),
																													Container(
																														margin: const EdgeInsets.only( top: 12, bottom: 12, left: 16),
																														child: Text(
																															"Key Features",
																															style: TextStyle(
																																color: Color(0xFF111416),
																																fontSize: 14,
																																fontWeight: FontWeight.bold,
																															),
																														),
																													),
																												]
																											),
																										),
																									),
																									IntrinsicHeight(
																										child: Container(
																											width: double.infinity,
																											child: Column(
																												crossAxisAlignment: CrossAxisAlignment.start,
																												children: [
																													IntrinsicHeight(
																														child: Container(
																															decoration: BoxDecoration(
																																border: Border(
																																	top: BorderSide(
																																		color: Color(0xFFE5E8EA),
																																		width: 1,
																																	),
																																),
																															),
																															padding: const EdgeInsets.symmetric(vertical: 1),
																															width: double.infinity,
																															child: Row(
																																crossAxisAlignment: CrossAxisAlignment.start,
																																children: [
																																	Container(
																																		margin: const EdgeInsets.only( top: 25, bottom: 25, left: 16),
																																		child: Text(
																																			"Budget Management",
																																			style: TextStyle(
																																				color: Color(0xFF111416),
																																				fontSize: 14,
																																			),
																																		),
																																	),
																																	Container(
																																		margin: const EdgeInsets.only( top: 25, bottom: 25, left: 16),
																																		child: Text(
																																			"Manages budget allocation and tracking.",
																																			style: TextStyle(
																																				color: Color(0xFF5E7287),
																																				fontSize: 14,
																																			),
																																		),
																																	),
																																	Expanded(
																																		child: Container(
																																			margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
																																			width: double.infinity,
																																			child: Text(
																																				"Budget creation, fund allocation, expenditure tracking.",
																																				style: TextStyle(
																																					color: Color(0xFF5E7287),
																																					fontSize: 14,
																																				),
																																			),
																																		),
																																	),
																																]
																															),
																														),
																													),
																													IntrinsicHeight(
																														child: Container(
																															decoration: BoxDecoration(
																																border: Border(
																																	top: BorderSide(
																																		color: Color(0xFFE5E8EA),
																																		width: 1,
																																	),
																																),
																															),
																															padding: const EdgeInsets.symmetric(vertical: 1),
																															width: double.infinity,
																															child: Row(
																																crossAxisAlignment: CrossAxisAlignment.start,
																																children: [
																																	Container(
																																		margin: const EdgeInsets.only( top: 25, bottom: 25, left: 16),
																																		child: Text(
																																			"Payroll System",
																																			style: TextStyle(
																																				color: Color(0xFF111416),
																																				fontSize: 14,
																																			),
																																		),
																																	),
																																	Container(
																																		margin: const EdgeInsets.only( top: 25, bottom: 25, left: 16),
																																		child: Text(
																																			"Automates employee payroll processing.",
																																			style: TextStyle(
																																				color: Color(0xFF5E7287),
																																				fontSize: 14,
																																			),
																																		),
																																	),
																																	Expanded(
																																		child: Container(
																																			margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
																																			width: double.infinity,
																																			child: Text(
																																				"Salary calculation, tax deductions, payslip generation.",
																																				style: TextStyle(
																																					color: Color(0xFF5E7287),
																																					fontSize: 14,
																																				),
																																			),
																																		),
																																	),
																																]
																															),
																														),
																													),
																													IntrinsicHeight(
																														child: Container(
																															decoration: BoxDecoration(
																																border: Border(
																																	top: BorderSide(
																																		color: Color(0xFFE5E8EA),
																																		width: 1,
																																	),
																																),
																															),
																															padding: const EdgeInsets.symmetric(vertical: 1),
																															width: double.infinity,
																															child: Row(
																																crossAxisAlignment: CrossAxisAlignment.start,
																																children: [
																																	Container(
																																		margin: const EdgeInsets.only( top: 25, bottom: 25, left: 16),
																																		child: Text(
																																			"Reporting & Analytics",
																																			style: TextStyle(
																																				color: Color(0xFF111416),
																																				fontSize: 14,
																																			),
																																		),
																																	),
																																	Container(
																																		margin: const EdgeInsets.only( top: 25, bottom: 25, left: 16),
																																		child: Text(
																																			"Provides financial reports and analytics.",
																																			style: TextStyle(
																																				color: Color(0xFF5E7287),
																																				fontSize: 14,
																																			),
																																		),
																																	),
																																	Expanded(
																																		child: Container(
																																			margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
																																			width: double.infinity,
																																			child: Text(
																																				"Customizable reports, data visualization, trend analysis.",
																																				style: TextStyle(
																																					color: Color(0xFF5E7287),
																																					fontSize: 14,
																																				),
																																			),
																																		),
																																	),
																																]
																															),
																														),
																													),
																												]
																											),
																										),
																									),
																								]
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.only( top: 20, bottom: 20, left: 16),
																						child: Text(
																							"Departments and Scope",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 22,
																								fontWeight: FontWeight.bold,
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
																						width: double.infinity,
																						child: Text(
																							"CMIS is integrated with various departments across the Government of Manipur, including: Department of Finance, Department of Education, Department of Health, Department of Public Works, and more.",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 16,
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.only( top: 20, bottom: 20, left: 16),
																						child: Text(
																							"Governance Impact & Recognition",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 22,
																								fontWeight: FontWeight.bold,
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
																						width: double.infinity,
																						child: Text(
																							"The implementation of CMIS has significantly improved financial governance in Manipur, leading to enhanced transparency, efficiency, and accountability. Our efforts have been recognized with the prestigious CSI SIG eGovernance Award for excellence in e-governance.",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 16,
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.only( top: 20, bottom: 20, left: 16),
																						child: Text(
																							"Latest Enhancements",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 22,
																								fontWeight: FontWeight.bold,
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
																						width: double.infinity,
																						child: Text(
																							"We continuously enhance the CMIS portal with new features and updates. Recent enhancements include: Improved user interface, Enhanced reporting capabilities, Mobile accessibility, and Integration with new departments.",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 16,
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.only( top: 20, bottom: 20, left: 16),
																						child: Text(
																							"Contact Us",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 22,
																								fontWeight: FontWeight.bold,
																							),
																						),
																					),
																					Container(
																						margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
																						width: double.infinity,
																						child: Text(
																							"Directorate of Management Information System (MIS), Finance Department, Government of Manipur, Imphal, Manipur, India. Email: mis@manipur.gov.in Phone: +91-385-242XXXX",
																							style: TextStyle(
																								color: Color(0xFF111416),
																								fontSize: 16,
																							),
																						),
																					),
																					InkWell(
																						onTap: () { print('Pressed'); },
																						child: IntrinsicWidth(
																							child: IntrinsicHeight(
																								child: Container(
																									decoration: BoxDecoration(
																										borderRadius: BorderRadius.circular(12),
																										color: Color(0xFFB7CEE2),
																									),
																									padding: const EdgeInsets.only( top: 9, bottom: 9, left: 18, right: 18),
																									margin: const EdgeInsets.only( top: 12, bottom: 12, left: 16),
																									child: Column(
																										crossAxisAlignment: CrossAxisAlignment.start,
																										children: [
																											Text(
																												"Access CMIS Portal",
																												style: TextStyle(
																													color: Color(0xFF111416),
																													fontSize: 14,
																													fontWeight: FontWeight.bold,
																												),
																											),
																										]
																									),
																								),
																							),
																						),
																					),
																				]
																			),
																		),
																	),
																]
															),
														),
													),
													IntrinsicWidth(
														child: IntrinsicHeight(
															child: Container(
																margin: const EdgeInsets.only( bottom: 72, left: 180),
																child: Row(
																	children: [
																		Container(
																			margin: const EdgeInsets.symmetric(horizontal: 3),
																			child: Text(
																				"Directorate of Management Information System (MIS), Babupara, Imphal – 795001",
																				style: TextStyle(
																					color: Color(0xFF5E7287),
																					fontSize: 16,
																				),
																			),
																		),
																		Container(
																			margin: const EdgeInsets.only( bottom: 1, right: 1),
																			child: Text(
																				"Email: support-cmis@gov.in",
																				style: TextStyle(
																					color: Color(0xFF5E7287),
																					fontSize: 16,
																				),
																			),
																		),
																		Container(
																			margin: const EdgeInsets.only( right: 3),
																			child: Text(
																				"Phone: +91-9402237620",
																				style: TextStyle(
																					color: Color(0xFF5E7287),
																					fontSize: 16,
																				),
																			),
																		),
																		Text(
																			"CMIS Portal: https://cmis.man.nic.in/sevaarth/home1/sevaarthhome.php",
																			style: TextStyle(
																				color: Color(0xFF5E7287),
																				fontSize: 16,
																			),
																		),
																	]
																),
															),
														),
													),
													IntrinsicHeight(
														child: Container(
															margin: const EdgeInsets.symmetric(horizontal: 180),
															width: double.infinity,
															child: Column(
																children: [
																	Text(
																		"© 2024 Directorate of Management Information System (MIS). All rights reserved.",
																		style: TextStyle(
																			color: Color(0xFF5E7287),
																			fontSize: 16,
																		),
																	),
																]
															),
														),
													),
												]
											),
										),
									),
								],
							)
						),
					),
				),
			],
		),
	),
));


 
}}