class GroupMember {
  String name;
  String rollNo;
  String email;

  GroupMember({required this.name, required this.rollNo, required this.email});
}

class ProjectData {
  String title = '';
  String domain = '';
  List<GroupMember> members = [];
  String guideName = '';
  String department = '';
  String semester = '';
  DateTime? submissionDate;

// Add methods for serialization if needed
}