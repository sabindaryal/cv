import 'package:cv/view/Modal/education_modal.dart';
import 'package:cv/view/Modal/person_detial_modal.dart';
import 'package:cv/view/pdf_preview.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'Modal/expriendModal.dart';

class DesignPdfClass {
  static void displayPdf(context, personDetails, List<Education> a, b, skil,
      List<ExprienceModal> exprience, works) {
    final doc = pw.Document();
    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.letter.copyWith(
            marginLeft: 10, marginTop: 20, marginRight: 10, marginBottom: 10),
        build: (pw.Context context) {
          Person about = personDetails[0];
          return <pw.Widget>[
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Row(
                  children: [
                    pw.Text(about.firstName),
                    pw.Text(about.middleName),
                    pw.Text(about.lastName),
                  ],
                ),
                pw.Column(
                  children: [
                    pw.Text(about.address),
                    pw.Text(about.email),
                    pw.Text(about.gender),
                    pw.Text(about.githubUsername),
                    pw.Text(about.instaUsername),
                    pw.Text(about.likedenUsername),
                  ],
                ),
              ],
            ),
            pw.Divider(
              height: 4,
              color: PdfColor.fromHex("000000"),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("About"),
                pw.Column(
                  children: [
                    pw.Text(about.address.toString()),
                  ],
                ),
              ],
            ),
            pw.Divider(height: 4, color: PdfColor.fromHex("000000")),
            pw.SizedBox(
              height: 10,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Exprience"),
                    ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.ListView.builder(
                          itemCount: exprience.length,
                          itemBuilder: (context, index) {
                            var a = exprience[index].works;
                            return pw.Column(children: [
                              pw.Text(exprience[index].jobPost.toString()),
                              pw.ListView.builder(
                                itemCount: a!.length,
                                itemBuilder: (context, index) {
                                  return pw.Text(a[index].detials.toString());
                                },
                              ),
                            ]);
                          }),
                    ]),
              ],
            ),
            pw.Divider(height: 4, color: PdfColor.fromHex("000000")),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Education"),
                    ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.ListView.builder(
                          itemCount: a.length,
                          itemBuilder: (context, index) {
                            return pw.Column(children: [
                              pw.Text(a[index].schoolName.toString()),
                            ]);
                          }),
                    ]),
              ],
            ),
            pw.Divider(height: 4, color: PdfColor.fromHex("000000")),
            pw.SizedBox(
              height: 10,
            ),
          ];
        },
      ),
    );

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(doc: doc),
        ));
  }
}
