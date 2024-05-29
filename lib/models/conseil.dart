// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Conseil {
  final String id;
  final String number;
  final String chamber;
  final String section;
  final String procedure;
  final String date;
  final String subject;
  final String principle;
  final String pdfLink;

  Conseil({
    required this.id,
    required this.number,
    required this.chamber,
    required this.section,
    required this.procedure,
    required this.date,
    required this.subject,
    required this.principle,
    required this.pdfLink,
  });

  Conseil copyWith({
    String? id,
    String? number,
    String? chamber,
    String? section,
    String? procedure,
    String? date,
    String? subject,
    String? principle,
    String? pdfLink,
  }) {
    return Conseil(
      id: id ?? this.id,
      number: number ?? this.number,
      chamber: chamber ?? this.chamber,
      section: section ?? this.section,
      procedure: procedure ?? this.procedure,
      date: date ?? this.date,
      subject: subject ?? this.subject,
      principle: principle ?? this.principle,
      pdfLink: pdfLink ?? this.pdfLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'number': number,
      'chamber': chamber,
      'section': section,
      'procedure': procedure,
      'date': date,
      'subject': subject,
      'principle': principle,
      'pdf_link': pdfLink,
    };
  }

  factory Conseil.fromMap(Map<String, dynamic> map) {
    return Conseil(
      id: map['_id'] as String,
      number: map['number'] as String,
      chamber: map['chamber'] as String,
      section: map['section'] as String,
      procedure: map['procedure'] as String,
      date: map['date'] as String,
      subject: map['subject'] as String,
      principle: map['principle'] as String,
      pdfLink: map['pdf_link'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Conseil.fromJson(String source) =>
      Conseil.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Conseil(id: $id, number: $number, chamber: $chamber, section: $section, procedure: $procedure, date: $date, subject: $subject, principle: $principle, pdfLink: $pdfLink)';
  }

  @override
  bool operator ==(covariant Conseil other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.number == number &&
        other.chamber == chamber &&
        other.section == section &&
        other.procedure == procedure &&
        other.date == date &&
        other.subject == subject &&
        other.principle == principle &&
        other.pdfLink == pdfLink;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        number.hashCode ^
        chamber.hashCode ^
        section.hashCode ^
        procedure.hashCode ^
        date.hashCode ^
        subject.hashCode ^
        principle.hashCode ^
        pdfLink.hashCode;
  }
}
