import 'package:scalers_demo/core/model/lookup_model.dart';
import 'package:scalers_demo/features/jobs_feature/data/models/company_model.dart';
import 'package:scalers_demo/features/jobs_feature/data/models/icp_answer_model.dart';

List<JobModel> jobsListFromJson(List str) => List<JobModel>.from(str.map((x) => JobModel.fromJson(x)));

class JobModel {
  num? id;
  String? createdDate;
  List<num>? salaryRange;
  List<dynamic>? benefits;
  LookupModel? location;
  bool? openForDiscussion;
  bool? commissionBased;
  LookupModel? type;
  LookupModel? status;
  LookupModel? workplacePreference;
  LookupModel? workplaceType;
  LookupModel? vertical;
  bool? isPredefinedListSet;
  CompanyModel? company;
  IcpAnswersModel? icpAnswers;
  String? uuid;
  String? title;
  DateTime? updatedDate;
  LookupModel? filters;
  String? uniqueToken;
  String? createdSource;
  bool? isCurationRequested;
  dynamic curationRequestedDateTime;
  dynamic cancellationReason;
  num? editAttempts;
  bool? isDefault;
  num? order;
  num? jobBucket;
  List<dynamic>? genericCandidateApplications;

  JobModel({
    this.id,
    this.createdDate,
    this.salaryRange,
    this.benefits,
    this.location,
    this.openForDiscussion,
    this.commissionBased,
    this.type,
    this.status,
    this.workplacePreference,
    this.workplaceType,
    this.vertical,
    this.isPredefinedListSet,
    this.company,
    this.icpAnswers,
    this.uuid,
    this.title,
    this.updatedDate,
    this.filters,
    this.uniqueToken,
    this.createdSource,
    this.isCurationRequested,
    this.curationRequestedDateTime,
    this.cancellationReason,
    this.editAttempts,
    this.isDefault,
    this.order,
    this.jobBucket,
    this.genericCandidateApplications,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        id: json["id"],
        createdDate: (json["created_date"]),
        salaryRange: List<num>.from(json["salary_range"].map((x) => x)),
        benefits: List<dynamic>.from(json["benefits"].map((x) => x)),
        location: LookupModel.fromJson(json["location"]),
        openForDiscussion: json["open_for_discussion"],
        commissionBased: json["commission_based"],
        type: LookupModel.fromJson(json["type"]),
        status: LookupModel.fromJson(json["status"]),
        workplacePreference: LookupModel.fromJson(json["workplace_preference"]),
        workplaceType: LookupModel.fromJson(json["workplace_type"]),
        vertical: LookupModel.fromJson(json["vertical"]),
        isPredefinedListSet: json["is_predefined_list_set"],
        company: CompanyModel.fromJson(json["company"]),
        icpAnswers: IcpAnswersModel.fromJson(json["icp_answers"]),
        uuid: json["uuid"],
        title: json["title"],
        updatedDate: DateTime.parse(json["updated_date"]),
        filters: LookupModel.fromJson(json["filters"]),
        uniqueToken: json["unique_token"],
        createdSource: json["created_source"],
        isCurationRequested: json["is_curation_requested"],
        curationRequestedDateTime: json["curation_requested_date_time"],
        cancellationReason: json["cancellation_reason"],
        editAttempts: json["edit_attempts"],
        isDefault: json["is_default"],
        order: json["order"],
        jobBucket: json["job_bucket"],
        genericCandidateApplications: List<dynamic>.from(json["generic_candidate_applications"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_date": createdDate ?? DateTime.now().toIso8601String(),
        "salary_range": List<dynamic>.from(salaryRange!.map((x) => x)),
        "benefits": List<dynamic>.from(benefits!.map((x) => x)),
        "location": location?.toJson(),
        "open_for_discussion": openForDiscussion,
        "commission_based": commissionBased,
        "type": type?.toJson(),
        "status": status?.toJson(),
        "workplace_preference": workplacePreference?.toJson(),
        "workplace_type": workplaceType?.toJson(),
        "vertical": vertical?.toJson(),
        "is_predefined_list_set": isPredefinedListSet,
        "company": company?.toJson(),
        "icp_answers": icpAnswers?.toJson(),
        "uuid": uuid,
        "title": title,
        "updated_date": updatedDate?.toIso8601String(),
        "filters": filters?.toJson(),
        "unique_token": uniqueToken,
        "created_source": createdSource,
        "is_curation_requested": isCurationRequested,
        "curation_requested_date_time": curationRequestedDateTime,
        "cancellation_reason": cancellationReason,
        "edit_attempts": editAttempts,
        "is_default": isDefault,
        "order": order,
        "job_bucket": jobBucket,
        "generic_candidate_applications": List<dynamic>.from(genericCandidateApplications!.map((x) => x)),
      };
}
