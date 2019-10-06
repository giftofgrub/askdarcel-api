# frozen_string_literal: true

namespace :algolia do
  task reindex: :environment do
    puts '[algolia:reindex] Reindexing resource/service index...'
    AlgoliaReindexJob.new.perform
    puts '[algolia:reindex] Success.'
  end

  task incremental_index: :environment do
    puts '[algolia:incremental_index] Indexing recent updates to resources/services...'
    AlgoliaIncrementalIndexJob.new.perform
    puts '[algolia:incremental_index] Success.'
  end

  task refresh_synonyms: :environment do
    puts '[algolia:refresh_synonyms] Uploading synonyms...'

    # Batch synonyms, with replica forwarding and atomic replacement of existing synonyms
    forward_to_replicas = true
    replace_existing_synonyms = true

    index.batch_synonyms([
  {
    "type": "synonym",
    "synonyms": [
      "needle exchange",
      "intravenous",
      "intervenous",
      "needle",
      "syringe",
      "needle drop",
      "needles",
      "opoid detox",
      "IV",
      "methadone",
      "intravenous"
    ],
    "objectID": "1570405395059_45"
  },
  {
    "type": "synonym",
    "synonyms": [
      "San Francisco Public Library",
      "sfpl",
      "library",
      "public library"
    ],
    "objectID": "1570405395058_9"
  },
  {
    "type": "synonym",
    "synonyms": [
      "saint vincent de paul",
      "svdp",
      "saint vincents de paul",
      "st vincent de paul",
      "st vincents de paul"
    ],
    "objectID": "1570405395058_8"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Bay Area Addiction Research and Treatment",
      "BAART",
      "opioid detox",
      "opiates"
    ],
    "objectID": "1570405395058_7"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Free Application for Federal Student Aid",
      "FAFSA",
      "school finances",
      "tuition reimbursement"
    ],
    "objectID": "1570405395058_6"
  },
  {
    "type": "synonym",
    "synonyms": [
      "department",
      "dept",
      "dpt"
    ],
    "objectID": "1570405395058_5"
  },
  {
    "type": "synonym",
    "synonyms": [
      "laundry service",
      "laundromat",
      "dry cleaners",
      "clean clothes"
    ],
    "objectID": "1570405395058_44"
  },
  {
    "type": "synonym",
    "synonyms": [
      "food",
      "meal",
      "hot meal",
      "kitchen",
      "pantry",
      "grub",
      "hungry",
      "free food",
      "foodbank",
      "food bank",
      "foodbanks",
      "food banks",
      "food donation",
      "food charity"
    ],
    "objectID": "1570405395058_43"
  },
  {
    "type": "synonym",
    "synonyms": [
      "bed",
      "beds",
      "shelter bed",
      "shelter",
      "sleep",
      "ShortTerm Housing",
      "furniture",
      "bedroom furniture",
      "311",
      "short term housing"
    ],
    "objectID": "1570405395058_42"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Tenderloin",
      "TL"
    ],
    "objectID": "1570405395058_41"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Financial District",
      "FiDi"
    ],
    "objectID": "1570405395058_40"
  },
  {
    "type": "synonym",
    "synonyms": [
      "apartment",
      "apt",
      "flat",
      "unit",
      "room",
      "rm"
    ],
    "objectID": "1570405395058_4"
  },
  {
    "type": "synonym",
    "synonyms": [
      "South of Market",
      "SOMA"
    ],
    "objectID": "1570405395058_39"
  },
  {
    "type": "synonym",
    "synonyms": [
      "San Francisco",
      "SF",
      "San Fran",
      "the city"
    ],
    "objectID": "1570405395058_38"
  },
  {
    "type": "synonym",
    "synonyms": [
      "catholic charities",
      "cyo"
    ],
    "objectID": "1570405395058_37"
  },
  {
    "type": "synonym",
    "synonyms": [
      "San Francisco Tenants Union",
      "sftu"
    ],
    "objectID": "1570405395058_36"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Tenderloin Housing Clinic",
      "thc"
    ],
    "objectID": "1570405395058_35"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Asian Pacific Islander",
      "api"
    ],
    "objectID": "1570405395058_34"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Asian Law Caucus",
      "alc"
    ],
    "objectID": "1570405395058_33"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Causa Justa Just Cause",
      "cjjc"
    ],
    "objectID": "1570405395058_32"
  },
  {
    "type": "synonym",
    "synonyms": [
      "bay area legal aid",
      "bay legal",
      "baylegal"
    ],
    "objectID": "1570405395058_31"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Episcopal Community Services",
      "ecs"
    ],
    "objectID": "1570405395058_30"
  },
  {
    "type": "synonym",
    "synonyms": [
      "way",
      "wy"
    ],
    "objectID": "1570405395058_3"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Homelessness Supportive Housing",
      "hsh"
    ],
    "objectID": "1570405395058_29"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Housing Rights Committee",
      "hrc"
    ],
    "objectID": "1570405395058_28"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Justice Diversity Center",
      "jdc"
    ],
    "objectID": "1570405395058_27"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Community Development Center",
      "cdc"
    ],
    "objectID": "1570405395058_26"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Eviction Defense Collaborative",
      "edc"
    ],
    "objectID": "1570405395058_25"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Displaced Tenant Housing Preference",
      "dthp"
    ],
    "objectID": "1570405395058_24"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Homeless Advocacy Project",
      "hap"
    ],
    "objectID": "1570405395058_23"
  },
  {
    "type": "synonym",
    "synonyms": [
      "San Francisco Housing Authority",
      "sfha"
    ],
    "objectID": "1570405395058_22"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Bill Sorro Housing Program",
      "BiSHoP"
    ],
    "objectID": "1570405395058_21"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Consumer Credit Counseling Service of San Francisco",
      "cccssf",
      "balance"
    ],
    "objectID": "1570405395058_20"
  },
  {
    "type": "synonym",
    "synonyms": [
      "avenue",
      "ave"
    ],
    "objectID": "1570405395058_2"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Institute on Aging",
      "ioa"
    ],
    "objectID": "1570405395058_19"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Homeless Prenatal Program",
      "hpp"
    ],
    "objectID": "1570405395058_18"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Legal Assistance to the Elderly",
      "LAE"
    ],
    "objectID": "1570405395058_17"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Cooperative Restraining Order Clinic",
      "croc"
    ],
    "objectID": "1570405395058_16"
  },
  {
    "type": "synonym",
    "synonyms": [
      "San Francisco AIDS Foundation",
      "sfaf"
    ],
    "objectID": "1570405395058_15"
  },
  {
    "type": "synonym",
    "synonyms": [
      "AIDS Housing Alliance",
      "aha"
    ],
    "objectID": "1570405395058_14"
  },
  {
    "type": "synonym",
    "synonyms": [
      "AIDS Emergency Fund",
      "aef"
    ],
    "objectID": "1570405395058_13"
  },
  {
    "type": "synonym",
    "synonyms": [
      "positive resource center",
      "prc",
      "AIDS Emergency Fund",
      "Baker Places"
    ],
    "objectID": "1570405395058_12"
  },
  {
    "type": "synonym",
    "synonyms": [
      "AIDS Legal Referral Panel",
      "alrp"
    ],
    "objectID": "1570405395058_11"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Asian Women’s Shelter",
      "aws"
    ],
    "objectID": "1570405395058_10"
  },
  {
    "type": "synonym",
    "synonyms": [
      "boulevard",
      "blvd"
    ],
    "objectID": "1570405395058_1"
  },
  {
    "type": "synonym",
    "synonyms": [
      "street",
      "st"
    ],
    "objectID": "1570405395058_0"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Disease Management",
      " managing disease",
      " manage disease",
      " disease education"
    ],
    "objectID": "1570405342793_99"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Health Education",
      " health ed"
    ],
    "objectID": "1570405342793_98"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Financial Education",
      " CREDIT COUNSELING",
      " FORECLOSURE COUNSELING",
      " HOMEBUYER EDUCATION",
      " SAVINGS PROGRAM",
      " Money Management",
      " financial literacy",
      " learn to manage money",
      " budget",
      " budgeting",
      " financial counseling",
      " financial counsel",
      " manage debt",
      " debt management"
    ],
    "objectID": "1570405342793_97"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Education Financial Assistance",
      " HELP PAY FOR SCHOOL",
      " Financial Aid for School",
      " Loans for Education",
      " School Financial Aid",
      " financial aid for college",
      " school financial aid",
      " college financial aid",
      " financial aid for class",
      " education loan",
      " Financial Aid for Education",
      " financial aid for higher education",
      " higher education financial aid",
      " loans for higher education",
      " help paying for school",
      " paying for school",
      " pay for school",
      " school payment",
      " school payments",
      " grants"
    ],
    "objectID": "1570405342793_96"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Alternative Education",
      " alt education",
      " alternate education",
      " alternative schools",
      " alternative school",
      " alternate school",
      " alternate schools",
      " school alternatives",
      " school alternative"
    ],
    "objectID": "1570405342793_95"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Education",
      " HELP FIND SCHOOL",
      " MORE EDUCATION",
      " adult education",
      " Learning",
      " adult school",
      " night school",
      " weekend classes",
      " night classes",
      " night class",
      " weekend class",
      " education for adults",
      " school for adults",
      " school",
      " help finding school"
    ],
    "objectID": "1570405342793_94"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Vision Care",
      " sight test",
      " test of sight",
      " glasses",
      " contact lenses",
      " contacts",
      " eye care",
      " eye doctor",
      " optometrist",
      " opthamology",
      " opthamologist"
    ],
    "objectID": "1570405342793_93"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Traumatic Brain Injury",
      " TBI",
      " brain damage",
      " brain damaged",
      " brain injury",
      " injure brain",
      " stroke",
      " injured brain",
      " brain trauma"
    ],
    "objectID": "1570405342793_92"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Special Education",
      " special ed",
      " learning disability"
    ],
    "objectID": "1570405342793_91"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Independent Living",
      " senior care",
      " community living",
      " living independently"
    ],
    "objectID": "1570405342793_90"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Hearing Tests",
      " auditory tests",
      " auditory test",
      " test of hearing",
      " deaf test",
      " deafness test"
    ],
    "objectID": "1570405342793_89"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Unemployment Benefits",
      " unemployed",
      " unemployment",
      " Employment Development Department",
      " unemployment insurance",
      " out of work",
      " EDD",
      " lost job",
      " fired",
      " quit",
      " laid off",
      " layed off"
    ],
    "objectID": "1570405342793_88"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Disability Benefits",
      " benefits for people with disabilities",
      " ada benefits",
      " disabled benefits",
      " benefits for disabled"
    ],
    "objectID": "1570405342793_87"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Government Benefits",
      " RETIREMENT BENEFITS",
      " Social Security"
    ],
    "objectID": "1570405342793_86"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Disability Screening",
      " disability assessment",
      " ada assessment",
      " ada test",
      " assessment for disability",
      " assessment for ada",
      " screening for ada",
      " screening for disability",
      " screening of disability",
      " screening of ada",
      " test of ability"
    ],
    "objectID": "1570405342793_85"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Daily Life Skills",
      " indepent living skills"
    ],
    "objectID": "1570405342793_84"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Assisted Living",
      " residential care home",
      " residential care home",
      " assisted care living facility",
      " assisted care living facilities",
      " personal care home",
      " personal care homes"
    ],
    "objectID": "1570405342793_83"
  },
  {
    "type": "synonym",
    "synonyms": [
      "ADA Transit",
      " Transit for People with Disabilities",
      " transport for people with disabilities",
      " transportation for people with disabilities",
      " transit for disabled people",
      " transport for disabled people",
      " transportation for disabled people",
      " paratransit",
      " disability transportation",
      " ada transportation",
      " ada transport",
      " disabled transport",
      " wheelchair transport",
      " wheelchair transit",
      " wheelchair transportation",
      " transit for wheelchairs",
      " transportationf for wheelchairs",
      " disabled person transit",
      " disabled persons transit",
      " disabled persons transportation"
    ],
    "objectID": "1570405342793_82"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Senior Centers",
      " continuing care retirement community",
      " CCRC",
      " life plan community",
      " retirement community",
      " senior center",
      " seniors center",
      " elderly center"
    ],
    "objectID": "1570405342793_81"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Residential Treatment",
      " residential rehabilitation",
      " residential rehab",
      " inpatient treatment",
      " inpatient rehab",
      " inpatient rehabilitation",
      " rehab",
      " rehabilitation",
      " rehabilitation services"
    ],
    "objectID": "1570405342793_80"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Assisted Living",
      " residential care home",
      " residential care homes",
      " assisted care living facility",
      " assisted care living facilities",
      " personal care home",
      " personal care homes",
      " assisted care facility",
      " assisted care home",
      " assisted care",
      " assisted care homes",
      " assisted care facilities"
    ],
    "objectID": "1570405342793_79"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Residential Care",
      " residential caregiving",
      " residential care giving"
    ],
    "objectID": "1570405342793_78"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Rec Teams",
      " Team Sports",
      " Recreation Teams",
      " Rec Clubs",
      " Recreation Club",
      " Recreation clubs",
      " Rec team",
      " recreation team",
      " team sport",
      " sport club",
      " sports club",
      " sport clubs",
      " sports clubs",
      " leisure sports"
    ],
    "objectID": "1570405342793_77"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Fitness & Exercise",
      " Fitness",
      " Exercise",
      " Workout",
      " get fit",
      " get in shape",
      " gym"
    ],
    "objectID": "1570405342793_76"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Recreation",
      " sports",
      " hobbies",
      " hobby",
      " sport",
      " activities",
      " activity",
      " leisure"
    ],
    "objectID": "1570405342793_75"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Independent Living",
      " senior care",
      " community living",
      " living independently"
    ],
    "objectID": "1570405342793_74"
  },
  {
    "type": "synonym",
    "synonyms": [
      "In-Home Support",
      " in home caregiver",
      " care giver",
      " in home support",
      " support in home",
      " support at home",
      " home care",
      " home nurse",
      " nurse at home",
      " nurse for home"
    ],
    "objectID": "1570405342793_73"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Guardianship",
      " Parent",
      " Guardian",
      " power of attorney",
      " conservatorship",
      " legal guardian"
    ],
    "objectID": "1570405342793_72"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Pain Management",
      " manage pain",
      " painkillers",
      " reduce physical pain"
    ],
    "objectID": "1570405342793_71"
  },
  {
    "type": "synonym",
    "synonyms": [
      "End-of-Life Care",
      " HOSPICE",
      " BURIAL & FUNERAL HELP",
      " end of life care",
      " death",
      " hospice care",
      " palliative care",
      " palliative",
      " care for terminally ill",
      " care for terminal illness",
      " terminal illness care",
      " terminal illness",
      " terminally ill",
      " euthanasia",
      " burial",
      " funeral",
      " help burrying"
    ],
    "objectID": "1570405342793_70"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Domestic Violence Shelters",
      " SAFE HOUSING",
      " shelter for domestic violence",
      " safe house",
      " bunker",
      " emergency shelter",
      " domestic violence shelter"
    ],
    "objectID": "1570405342793_69"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Disaster Response",
      " DISASTER PREPAREDNESS & RESPONSE",
      " Disaster Assistance",
      " disaster preparedness"
    ],
    "objectID": "1570405342793_68"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Physical Safety",
      " HELP ESCAPE VIOLENCE",
      " IMMEDIATE SAFETY",
      " Domestic Violence",
      " Domestic Violence Counseling",
      " abuse",
      " domestic abuse",
      " attack at home",
      " attacked at home",
      " Domestic Violence Counsel",
      " help with assault",
      " domestic violence help",
      " escape domestic violence",
      " escape domestic abuse",
      " self defense",
      " defending oneself",
      " physical security",
      " physically secure"
    ],
    "objectID": "1570405342793_67"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Maternity Care",
      " pregnant services",
      " pregnancy services"
    ],
    "objectID": "1570405342793_66"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Preschool",
      " pre school",
      " prek",
      " pre k",
      " pre-kindergarden"
    ],
    "objectID": "1570405342793_65"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Early Childhood Care",
      " HEAD START",
      " EARLY CHILDHOOD INTERVENTION",
      " EARLY CHILDHOOD EDUCATION",
      " education before preschool",
      " early childhood health",
      " early childhood nutrition",
      " early childhood parenting",
      " developmental delays",
      " developmental delay",
      " early childhood therapeutic services",
      " early childhood therapy",
      " therapy for early childhood",
      " toddler",
      " toddlers",
      " toddler care",
      " small child care"
    ],
    "objectID": "1570405342793_64"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Day Camp",
      " summer camp",
      " daycamp",
      " summercamp"
    ],
    "objectID": "1570405342793_63"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Childcare Financial Assistance",
      " HELP PAY FOR CHILDCARE",
      " help pay for child care",
      " help paying for childcare",
      " paying for childcare",
      " help paying for child care",
      " paying for child care",
      " childcare financial aid",
      " child care financial assistance",
      " afford childcare"
    ],
    "objectID": "1570405342793_62"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Before School Care",
      " beforeschool care",
      " care before school",
      " beforeschool supervision",
      " before school supervision"
    ],
    "objectID": "1570405342793_61"
  },
  {
    "type": "synonym",
    "synonyms": [
      "After School Care",
      " after school program",
      " afterschool supervision",
      " after school supervision",
      " afterschool care",
      " care after school"
    ],
    "objectID": "1570405342793_60"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Childcare",
      " HELP FIND CHILDCARE",
      " child care",
      " Babysitting",
      " babysit"
    ],
    "objectID": "1570405342793_59"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Caregiver Relief",
      " caregiver relief",
      " RELIEF FOR CAREGIVERS",
      " care giver relief",
      " relief for care givers"
    ],
    "objectID": "1570405342793_58"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Adult Daycare",
      " Elderly daycare",
      " adult day care",
      " elder daycare",
      " elder day care",
      " elderly day care",
      " senior daycare",
      " senior day care",
      " senior daytime care",
      " elder daytime care",
      " elderly daytime care",
      " adult daytime care",
      " planned care",
      " elderly care",
      " eldercare",
      " senior care",
      " senior citizen care"
    ],
    "objectID": "1570405342793_57"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Daytime Care",
      " daycare",
      " day care",
      " daytime caregiving"
    ],
    "objectID": "1570405342793_56"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Transit",
      " TRANSPORTATION",
      " help getting to",
      " help me get to",
      " get to",
      " commuter",
      " commutes",
      " commute",
      " bus",
      " busses",
      " bart",
      " bay area rapid transit",
      " muni",
      " municipal transportation",
      " car",
      " automobile",
      " van",
      " vehicle",
      " transport"
    ],
    "objectID": "1570405342793_193"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Smartphones",
      " Phone",
      " free phone",
      " obama phone",
      " i want a phone",
      " how to get a free phone",
      " how to get a phone",
      " phone help",
      " cell phone",
      " cellphone",
      " cell",
      " iphone",
      " android"
    ],
    "objectID": "1570405342793_192"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Computer Class",
      " technology class",
      " learn to use computers",
      " learn how to use computers ",
      " learn how to use technology",
      " learn to use technology",
      " computer help",
      " pc help"
    ],
    "objectID": "1570405342793_191"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Technology",
      " tech",
      " online",
      " web",
      " website",
      " world wide web",
      " www"
    ],
    "objectID": "1570405342793_190"
  },
  {
    "type": "synonym",
    "synonyms": [
      "MOHCD Funded",
      " Mayors Office of Housing and Community Development",
      " Mayors Office of Housing & Community Development",
      " Mayor Office of Housing and Community Development",
      " Funded by MOHCD",
      " MOHCD funds"
    ],
    "objectID": "1570405342793_189"
  },
  {
    "type": "synonym",
    "synonyms": [
      "LGBTQ",
      " Gay",
      " Lesbian",
      " Bi",
      " Bisexual",
      " bi-sexual",
      " bi sexual",
      " transgender",
      " trans gender",
      " queer",
      " not straight",
      " gays",
      " lesbians",
      " bisexuals"
    ],
    "objectID": "1570405342793_188"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Translation & Interpretation",
      " translation",
      " I need a translator",
      " translator",
      " translation help",
      " interpretation",
      " interpreter",
      " I need an interpreter",
      " interpretation help",
      " help no english"
    ],
    "objectID": "1570405342793_187"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Representation",
      " legal representation",
      " representative",
      " legally represent",
      " represent in court",
      " represent legally"
    ],
    "objectID": "1570405342793_186"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Notary",
      " Notary",
      " notarization",
      " notary service",
      " notary services"
    ],
    "objectID": "1570405342793_185"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Mediation",
      " Mediation",
      " mediation services",
      " mediator",
      " resolve conflict",
      " conflict resolution",
      " mediate problems"
    ],
    "objectID": "1570405342793_184"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Identification Recovery",
      " ID recovery",
      " lost ID",
      " Re-identification",
      " lost identification",
      " lost my id",
      " birth certificate",
      " social security card"
    ],
    "objectID": "1570405342793_183"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Re-entry Services",
      " re-entry",
      " prison release",
      " jail release"
    ],
    "objectID": "1570405342793_182"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Probation & Parole",
      " Probation",
      " parole"
    ],
    "objectID": "1570405342793_181"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Prison/Jail Related Services",
      " Prison",
      " Jail",
      " confinement",
      " imprisoned",
      " jailed",
      " confined",
      " penitentiary",
      " detention center",
      " gaol",
      " correctional facility",
      " correctional center",
      " inmate"
    ],
    "objectID": "1570405342793_180"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Clean Slate",
      " absolve felonies",
      " absolve record",
      " clear record",
      " wipe slate clean"
    ],
    "objectID": "1570405342793_179"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Citizenship & Immigration",
      " Immigration Assistance",
      " citizenship",
      " papers",
      " apply for papers",
      " immigration",
      " become citizen",
      " apply for citizenship",
      " green card",
      " immigrate"
    ],
    "objectID": "1570405342793_178"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Guardianship",
      " Parent",
      " Guardian",
      " power of attorney",
      " conservatorship",
      " legal guardian",
      " life insurance"
    ],
    "objectID": "1570405342793_177"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Discrimination & Civil Rights",
      " discrimination",
      " civil rights",
      " social justice",
      " my rights",
      " discriminated"
    ],
    "objectID": "1570405342793_176"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Building Code Enforcement",
      " Habitability"
    ],
    "objectID": "1570405342793_175"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Advocacy & Legal Aid",
      " Legal Advocacy",
      " Legal Aid",
      " law firms",
      " lawyer",
      " law firm",
      " advocate",
      " legal counsel",
      " attorney",
      " advocacy",
      " advocacy aid"
    ],
    "objectID": "1570405342793_174"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Legal",
      " Legal Assistance",
      " Legal Services",
      " legal help",
      " legal service",
      " law"
    ],
    "objectID": "1570405342793_173"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Family Shelters",
      " shelters for family",
      " shelters for families",
      " shelter for family",
      " shelter for families",
      " families shelter",
      " families shelters",
      " family shelter"
    ],
    "objectID": "1570405342793_172"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Domestic Violence Shelter",
      " SAFE HOUSING",
      " safe house",
      " bunker",
      " emergency shelter",
      " domestic violence shelter",
      " Shelter for domestic violence",
      " shelter from abuse"
    ],
    "objectID": "1570405342793_171"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Temporary Shelter",
      " WEATHER RELIEF",
      " SHORT-TERM HOUSING",
      " Shelter Tonight",
      " immediate shelter",
      " short term housing",
      " emergency shelter",
      " short term shelter",
      " short-term shelter",
      " emergency housing",
      " shelter"
    ],
    "objectID": "1570405342793_170"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Low-income Housing",
      " PUBLIC HOUSING",
      " Affordable Housing",
      " low income housing",
      " Subsidized Housing",
      " cheap housing",
      " affordable rent",
      " cheap rent",
      " cheap apartment",
      " cheap condo",
      " cheap condominium",
      " housing subsidies",
      " housing subsidy",
      " rent subsidies",
      " rent subsidy",
      " subsidized condo",
      " subsidized rent"
    ],
    "objectID": "1570405342793_169"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Long-Term Housing",
      " buy a home",
      " lease",
      " apartment",
      " find apartment",
      " find apartments",
      " rent an apartment",
      " rent",
      " home buying",
      " leasing",
      " condo",
      " condominium",
      " house",
      " renting",
      " mortgage",
      " housing deposit",
      " rent deposit"
    ],
    "objectID": "1570405342793_168"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Housing",
      " HOUSING",
      " RESIDENTIAL HOUSING",
      " Homeless",
      " Homelessness",
      " residence",
      " place to stay",
      " place to sleep",
      " places to sleep",
      " places to stay"
    ],
    "objectID": "1570405342793_167"
  },
  {
    "type": "synonym",
    "synonyms": [
      "STD/STI Treatment & Prevention",
      " sti",
      " std",
      " sexually transmitted disease",
      " sexually transmitted infection",
      " sti treatment",
      " sti prevention",
      " std treatment",
      " std prevention"
    ],
    "objectID": "1570405342793_166"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Postnatal Care",
      " postnatal",
      " postpartum"
    ],
    "objectID": "1570405342793_165"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Maternity Care",
      " pregnancy services",
      " pregnant services"
    ],
    "objectID": "1570405342793_164"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Fertility",
      " trying to get pregnant",
      " want to have baby",
      " have baby",
      " get pregnant"
    ],
    "objectID": "1570405342793_163"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Birth Control",
      " condoms",
      " condom",
      " IUD",
      " contraceptive",
      " plan B",
      " contraceptives",
      " rubber"
    ],
    "objectID": "1570405342793_162"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Sexual & Reproductive Health",
      " WOMEN'S HEALTH",
      " sexual health",
      " reproductive health",
      " well woman exams",
      " OB/GYN"
    ],
    "objectID": "1570405342793_161"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Psychiatric Emergency Services",
      " emergency mental health",
      " mental health emergency",
      " psychiatric emergency",
      " emergency psychiatry"
    ],
    "objectID": "1570405342793_160"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Mental Health Evaluation",
      " Psychologist",
      " Psychiatrist",
      " psychiatry",
      " psychology",
      " mental health test",
      " test of mental health",
      " evaluation of mental health",
      " evaluation of sanity"
    ],
    "objectID": "1570405342793_159"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Hoarding",
      " Cluttering",
      " Hoarding and cluttering",
      " hoard",
      " clutter",
      " hoarder",
      " clear clutter",
      " hoarding & cluttering",
      " cluttering and hoarding",
      " clutterer",
      " keeps everything",
      " leaves a mess",
      " never cleans"
    ],
    "objectID": "1570405342793_158"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Guardianship",
      " Parent",
      " Guardian",
      " power of attorney",
      " conservatorship",
      " legal guardian"
    ],
    "objectID": "1570405342793_157"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Mental Health Care",
      " Psychiatric Help",
      " Mental Health",
      " psychiatric health",
      " psychiatric care"
    ],
    "objectID": "1570405342793_156"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Mental Health Medication",
      " MEDICATIONS FOR MENTAL HEALTH",
      " Mental Health Medications",
      " Mental Health Meds",
      " Meds for Mental Health",
      " medication for mental health",
      " Psychiatric Medication",
      " Psychiatric Medications",
      " Psychiatric Meds",
      " Mood Disorder Meds",
      " Meds for Mood Disorders",
      " mental health prescription",
      " mood stabilizers",
      " mood stabilizer",
      " anti-depressants",
      " antidepressants",
      " anxiolitic",
      " anxiolitics",
      " bipolar meds",
      " bipolar medication"
    ],
    "objectID": "1570405342793_155"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Medication Management",
      " manage medication",
      " manage medications",
      " medications management",
      " meds management",
      " manage meds"
    ],
    "objectID": "1570405342793_154"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Medications",
      " Prescriptions",
      " Medication",
      " Prescription",
      " medicine",
      " pills",
      " medicines"
    ],
    "objectID": "1570405342793_153"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Medical Supplies",
      " PROSTHESIS",
      " ASSISTIVE TECHNOLOGY",
      " wheelchair",
      " wheel chair",
      " wheelchairs",
      " wheel chairs",
      " walker",
      " walkers",
      " crutches",
      " cane",
      " first aid supplies",
      " firstaid supplies",
      " bandaids",
      " bandages",
      " splint",
      " disinfectant",
      " splints",
      " disinfectants",
      " first aid kit"
    ],
    "objectID": "1570405342793_152"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Vaccinations",
      " vaccine",
      " vaccines",
      " vaccinated",
      " not vaccinated",
      " need vaccines"
    ],
    "objectID": "1570405342793_151"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Primary Care",
      " doctors",
      " doctor",
      " hospital"
    ],
    "objectID": "1570405342793_150"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Physical Therapy",
      " PT",
      " physical therapist",
      " physical rehabilitation",
      " physical rehab"
    ],
    "objectID": "1570405342793_149"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Disease Screening",
      " screen for disease",
      " test for disease",
      " disease testing",
      " cancer screening"
    ],
    "objectID": "1570405342793_148"
  },
  {
    "type": "synonym",
    "synonyms": [
      "MEDICAL CARE",
      " SKILLED NURSING",
      " nurse",
      " nurses",
      " doctor",
      " doctors",
      " checkup",
      " treatment"
    ],
    "objectID": "1570405342793_147"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Medical Care",
      " SCREENING & EXAMS",
      " PREVENT & TREAT",
      " CHECKUP & TEST",
      " HOSPITAL TREATMENT",
      " Doctor visit",
      " doctor checkup",
      " checkup clinic",
      " test clinic",
      " medical checkup",
      " doctor clinic",
      " medical screening",
      " medical exams",
      " health exam",
      " health checkup",
      " health screening",
      " blood test",
      " preventative care",
      " clinics",
      " treat"
    ],
    "objectID": "1570405342793_146"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Healthcare Transportation",
      " TRANSPORTATION FOR HEALTHCARE",
      " health care transportation",
      " health care transport",
      " healthcare transport",
      " health care transit",
      " healthcare transit",
      " transit for healthcare",
      " transit for health care",
      " transportation to appointments",
      " transportation for appointments",
      " appointment transit",
      " appointment transport",
      " appointment transportation"
    ],
    "objectID": "1570405342793_145"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Dental Care",
      " Dental",
      " Teeth",
      " Teeth cleaning",
      " tooth",
      " tooth cleaning",
      " Dentist",
      " dental hygiene",
      " dental assistance",
      " where to find a dentist"
    ],
    "objectID": "1570405342793_144"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Sober Living",
      " halfway house",
      " recovery house",
      " recovery home",
      " sober lodging",
      " sober home",
      " halfway home",
      " half way house",
      " half way home",
      " sober house"
    ],
    "objectID": "1570405342793_143"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Addiction Medicine",
      " MEDICATIONS FOR ADDICTION",
      " addiction medications",
      " addiction medication",
      " medication for addiction",
      " methadone maintenance",
      " methadone",
      " NARCAN",
      " addiction meds",
      " addiction recovery meds",
      " addiction recovery medicine",
      " addiction recovery medications",
      " suboxone",
      " buprenorphine",
      " substance use medication",
      " substance use medications"
    ],
    "objectID": "1570405342793_142"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Drug Testing",
      " drug test",
      " piss test",
      " pee test"
    ],
    "objectID": "1570405342793_141"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Detox",
      " detoxification"
    ],
    "objectID": "1570405342793_140"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Addiction & Recovery",
      " drug treatment",
      " addiction help",
      " help with drugs",
      " alcohol treatment",
      " addiction",
      " recovery",
      " substance use",
      " substance abuse",
      " alcohol abuse",
      " narcotics",
      " opiates",
      " narcotic",
      " opiate",
      " drug use",
      " drug abuse",
      " prescription abuse",
      " addict",
      " alcoholic",
      " drug services"
    ],
    "objectID": "1570405342793_139"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Health",
      " MEDICAL CARE",
      " medical",
      " health care",
      " healthcare",
      " medicalcare",
      " doctor",
      " see a doctor"
    ],
    "objectID": "1570405342793_138"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Transportation Financial Assistance",
      " HELP PAY FOR TRANSIT",
      " HELP PAY FOR GAS",
      " BUS PASSES",
      " HELP PAY FOR CAR",
      " help pay for transportation",
      " bus pass",
      " muni pass",
      " money for transportation",
      " money for transit",
      " transit voucher",
      " transportation voucher",
      " commuter check",
      " transportation money",
      " transit money",
      " transportation funds",
      " funds for transportation",
      " financial assistance for transportation"
    ],
    "objectID": "1570405342793_137"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Tax Preparation",
      " filing taxes",
      " doing taxes",
      " tax prep",
      " tax help",
      " help with taxes",
      " tax counseling",
      " tax counsel",
      " help filing taxes",
      " help doing taxes"
    ],
    "objectID": "1570405342793_136"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Payee Services",
      " representative payee",
      " payee service"
    ],
    "objectID": "1570405342793_135"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Loans",
      " BUSINESS LOANS",
      " PERSONAL LOANS",
      " borrow money",
      " loan money",
      " lean",
      " loan",
      " business loan",
      " personal loan"
    ],
    "objectID": "1570405342793_134"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Insurance",
      " insure"
    ],
    "objectID": "1570405342793_133"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Home & Renters Insurance",
      " renters insurance",
      " homeowners insurance",
      " rent insurance",
      " home insurance"
    ],
    "objectID": "1570405342793_132"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Utilities Financial Assistance",
      " HELP PAY FOR UTILITIES",
      " HELP PAY FOR INTERNET OR PHONE",
      " utility assist",
      " utility assistance",
      " utilities assist",
      " utitilities assistance",
      " utilities",
      " help pay utilities",
      " help paying utilities",
      " help paying for utilities",
      " help pay for home phone",
      " help pay for home internet",
      " help paying home phone",
      " help paying home internet"
    ],
    "objectID": "1570405342793_131"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Housing Financial Assistance",
      " HELP PAY FOR HOUSING",
      " HOUSING VOUCHERS",
      " housing voucher",
      " Rental Assistance",
      " help paying rent",
      " rent assist",
      " rent assistance",
      " rental assistance",
      " help pay rent",
      " help paying rent",
      " help pay for rent",
      " help paying for rent",
      " housing financial aid",
      " financial aid for housing",
      " financial aid for rent",
      " financial assistance for rent",
      " financial assistance for housing"
    ],
    "objectID": "1570405342793_130"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Prescription Assistance",
      " Help pay for medications",
      " help paying for meds",
      " help pay for prescriptions",
      " medication assistance",
      " prescription financial aid",
      " prescription financial assistance",
      " financial aid for prescriptions",
      " financial assistance for prescriptions",
      " financial aid for medications",
      " financial assistance for medication"
    ],
    "objectID": "1570405342793_129"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Health Insurance",
      " health coverage",
      " dental insurance",
      " medical insurance",
      " medicare",
      " medicaid",
      " medi-cal",
      " SFHP",
      " san francisco health plan",
      " cover costs of health care",
      " cover doctors visit",
      " cover costs of healthcare",
      " cover healthcare costs"
    ],
    "objectID": "1570405342793_128"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Discounted Healthcare",
      " healthcare discounted",
      " reduced cost healthcare",
      " cheap healthcare",
      " cheaper healthcare",
      " cheap medical visit",
      " cheaper medical visit",
      " discounted health care",
      " health care discounted",
      " see doctor for cheap",
      " go to hospital for cheap",
      " cheap clinic",
      " free clinics",
      " subsidized healthcare",
      " subsidized medical",
      " subsidized doctor",
      " subsidized clinic"
    ],
    "objectID": "1570405342793_127"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Healthcare Financial Assistance",
      " HELP PAY FOR HEALTHCARE",
      " free healthcare",
      " free health care",
      " help paying for healthcare",
      " help pay for health care",
      " heal paying for health care",
      " medical financial aid",
      " medical financial assistance",
      " help pay medical bill",
      " help pay medical bills",
      " medical bills",
      " help paying medical costs",
      " help paying medical bills",
      " help paying hospital bills"
    ],
    "objectID": "1570405342793_126"
  },
  {
    "type": "synonym",
    "synonyms": [
      "FINANCES & BENEFITS",
      " funds",
      " fund"
    ],
    "objectID": "1570405342793_125"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Finances & Benefits",
      " MONEY",
      " FINANCIAL ASSISTANCE",
      " FINANCIAL AID & LOANS",
      " Benefits",
      " Finances",
      " Finance",
      " moneys",
      " mulah",
      " help with expenses",
      " help pay for",
      " subsidy",
      " default",
      " check",
      " checking",
      " financial aid",
      " money order",
      " money orders",
      " financial benefits",
      " financial help"
    ],
    "objectID": "1570405342793_124"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Workplace Rights",
      " employment rights",
      " employee rights",
      " workplace legal issue",
      " workplace legal issues",
      " employees rights",
      " work place rights",
      " work place legal issues",
      " work place legal issue"
    ],
    "objectID": "1570405342793_123"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Work Expenses",
      " HELP PAY FOR WORK EXPENSES",
      " CLOTHES FOR WORK",
      " SUPPLIES FOR WORK",
      " work expenses",
      " work clothes",
      " work clothing",
      " clothing for work",
      " work supplies",
      " work tools",
      " tools for work"
    ],
    "objectID": "1570405342793_122"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Supported Employment",
      " disability employment",
      " ada employment",
      " supported work environment",
      " work environment support",
      " job for people with disability",
      " jobs for people with disability"
    ],
    "objectID": "1570405342793_121"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Resume Development",
      " resume review",
      " review resume",
      " resume touch up",
      " improve resume",
      " write resume",
      " develop a resume"
    ],
    "objectID": "1570405342793_120"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Interview Training",
      " interview help",
      " interview prep",
      " interview preparation",
      " training to interview",
      " prep for interviews",
      " practice interviews",
      " interview practice"
    ],
    "objectID": "1570405342793_119"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Job Training",
      " SKILLS & TRAINING",
      " Job Skills",
      " Vocational Training",
      " technical training",
      " skills training",
      " employment training",
      " job abilities",
      " work abilities",
      " employment abilities"
    ],
    "objectID": "1570405342793_118"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Job Placement & Skill Assessment",
      " HELP FIND WORK",
      " JOB PLACEMENT",
      " SKILLS ASSESSMENT",
      " skill assessment",
      " assess skills",
      " assess skill",
      " job test",
      " career test",
      " career assessment",
      " finding work",
      " find work",
      " looking for work",
      " look for work",
      " help finding a job",
      " help find a job"
    ],
    "objectID": "1570405342793_117"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Employment & Jobs",
      " WORK",
      " Employment",
      " Jobs",
      " employment assistance",
      " job",
      " get a job",
      " help getting a job",
      " place of employment",
      " employer",
      " sustaining work",
      " keeping work",
      " employ"
    ],
    "objectID": "1570405342793_116"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Drop-In Center",
      " Urgent care",
      " no appointment needed",
      " no appointment necessary"
    ],
    "objectID": "1570405342793_115"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Emergency",
      " emergent",
      " urgent",
      " high need",
      " immediate need"
    ],
    "objectID": "1570405342793_114"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Tutoring",
      " help with school",
      " tutor",
      " teacher",
      " after school tutor",
      " help with homework",
      " homework help",
      " schoolwork help",
      " school help",
      " TA help",
      " tutors"
    ],
    "objectID": "1570405342793_113"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Special Education",
      " special ed",
      " education for special needs",
      " school for special needs",
      " special needs school",
      " special needs education"
    ],
    "objectID": "1570405342793_112"
  },
  {
    "type": "synonym",
    "synonyms": [
      "School Transportation",
      " TRANSPORTATION FOR SCHOOL",
      " school transit",
      " school transport",
      " school bus",
      " ride to school",
      " transit for school",
      " transport for school"
    ],
    "objectID": "1570405342793_111"
  },
  {
    "type": "synonym",
    "synonyms": [
      "School Supplies",
      " SUPPLIES FOR SCHOOL",
      " BOOKS",
      " school materials",
      " school material",
      " Pencils",
      " Notebooks",
      " reading",
      " library",
      " reading materials",
      " book",
      " study materials",
      " study material"
    ],
    "objectID": "1570405342793_110"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Foreign Languages",
      " learn a language",
      " learn languages",
      " learn a foreign language"
    ],
    "objectID": "1570405342793_109"
  },
  {
    "type": "synonym",
    "synonyms": [
      "English as a Second Language",
      " ESL",
      " English as a Second Language",
      " Learn English",
      " English Learning",
      " EFL",
      " Engish as a foreign language",
      " learning english",
      " i dont speak english",
      " help with english",
      " learn a language",
      " don't speak english",
      " ELL",
      " english language learner"
    ],
    "objectID": "1570405342793_108"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Resume Development",
      " resume review",
      " review resume",
      " resume touch up",
      " improve resume",
      " write resume",
      " develop a resume"
    ],
    "objectID": "1570405342793_107"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Interview Training",
      " interview help",
      " interview prep",
      " interview preparation",
      " training to interview",
      " prep for interviews",
      " practice interviews",
      " interview practice"
    ],
    "objectID": "1570405342793_106"
  },
  {
    "type": "synonym",
    "synonyms": [
      "GED/High-School Equivalency",
      " ged",
      " high school equivalency",
      " hse",
      " high school",
      " return to school",
      " diploma",
      " General Education Development",
      " General Education Diploma"
    ],
    "objectID": "1570405342793_105"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Computer Class",
      " computer literacy",
      " technology class",
      " learn to use computers",
      " learn to use a computer",
      " how to use a computer",
      " how to use computers",
      " how to type",
      " typing class"
    ],
    "objectID": "1570405342793_104"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Basic Literacy",
      " literacy",
      " illiterate",
      " can't read",
      " cannot read",
      " learn to read",
      " reading instruction",
      " writing instruction",
      " learn to write",
      " learning to read",
      " learning to write"
    ],
    "objectID": "1570405342793_103"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Job Training",
      " SKILLS & TRAINING",
      " Job Skills",
      " Vocational Training",
      " technical training",
      " skills training",
      " employment training",
      " job abilities",
      " work abilities",
      " employment abilities",
      " training for employment",
      " skills for employment",
      " work skills",
      " skills for work",
      " training for work",
      " vocational skills"
    ],
    "objectID": "1570405342793_102"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Sex Education",
      " sex ed",
      " HIV education",
      " AIDS education",
      " safe sex"
    ],
    "objectID": "1570405342793_101"
  },
  {
    "type": "synonym",
    "synonyms": [
      "HIV Treatment",
      " aids treatment",
      " hiv medication",
      " aids medication",
      " aids medicine",
      " hiv medicine",
      " help aids",
      " help hiv",
      " aids",
      " hiv",
      " hiv meds",
      " aids meds",
      " aids help"
    ],
    "objectID": "1570405342793_100"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Food Delivery",
      " Home Delivered Meals",
      " food drop off",
      " deliver food to me",
      " deliver food"
    ],
    "objectID": "1570405342792_9"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Food Benefits",
      " HELP PAY FOR FOOD",
      " GOVERNMENT FOOD BENEFITS",
      " Financial Assistance for Food",
      " Food Stamps",
      " food expenses",
      " food assistance",
      " food financial assistance",
      " money for food",
      " help paying for food"
    ],
    "objectID": "1570405342792_8"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Congregate Meals",
      " Group Meals",
      " soup kitchen",
      " kitchen",
      " food kitchen"
    ],
    "objectID": "1570405342792_7"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Food",
      " FREE MEALS",
      " I want food",
      " place to eat",
      " something to eat",
      " place to eat",
      " free meal",
      " eat free",
      " grub",
      " hungry"
    ],
    "objectID": "1570405342792_6"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Online Only",
      " only online"
    ],
    "objectID": "1570405342792_55"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Virtual Support",
      " online support",
      " remote support",
      " online",
      " remote",
      " online help",
      " remote help",
      " virtual guide",
      " virtual help"
    ],
    "objectID": "1570405342792_54"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Understand Mental Health",
      " Mental Health Education",
      " what is mental health",
      " mental health resources",
      " understanding mental health",
      " understand mood disorder",
      " understanding mood disorder",
      " what is a mood disorder",
      " what is a mental health disorder",
      " understanding mental health",
      " understand psychiatric issues",
      " understanding psychiatric issues",
      " understand mood disorders",
      " understanding mood disorders"
    ],
    "objectID": "1570405342792_53"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Understand Government Programs",
      " NAVIGATING THE SYSTEM",
      " help navigating the system",
      " government programs",
      " government assistance",
      " understand government benefits",
      " what is government programs",
      " what are government programs",
      " how do government programs work",
      " navigating government programs",
      " how to get government assistance",
      " how to navigate the system",
      " how to enroll in government programs",
      " what is government assistance",
      " help find services",
      " help finding services",
      " help locate a service"
    ],
    "objectID": "1570405342792_52"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Understand Disability",
      " learning about disability",
      " understand challenges of persons with disabilities",
      " support disabilities",
      " what is disability",
      " disability needs",
      " disability resources",
      " disability supporters"
    ],
    "objectID": "1570405342792_51"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Parenting Education",
      " how to parent",
      " how to be a father",
      " how to be a mother",
      " how to be a dad",
      " how to be a mom",
      " how to raise a kid",
      " how to raise a child",
      " educate parents",
      " education for parents",
      " parental education",
      " parent education",
      " school for parents"
    ],
    "objectID": "1570405342792_50"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Wifi Access",
      " Internet",
      " wifi",
      " free wifi",
      " broadband",
      " internet access",
      " wi fi"
    ],
    "objectID": "1570405342792_5"
  },
  {
    "type": "synonym",
    "synonyms": [
      "12-Step",
      " 12 step",
      " twelve step",
      " narcotics anonymous",
      " alcoholics anonymous",
      " NA",
      " AA",
      " Cocaine anonymous",
      " 12step"
    ],
    "objectID": "1570405342792_49"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Support Groups",
      " group support"
    ],
    "objectID": "1570405342792_48"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Substance Abuse Counseling",
      " PEER RECOVERY COACHING",
      " OUTPATIENT TREATMENT",
      " drug counseling",
      " substance use counseling",
      " addiction help",
      " counseling for drugs",
      " counseling for substance abuse",
      " counseling for substance use",
      " substance abuse therapy",
      " drug abuse therapy",
      " addiction counseling",
      " addiction therapy",
      " outpatient rehabilitation",
      " outpatient rehab",
      " addiction group therapy",
      " addiction group counseling",
      " group addiction support"
    ],
    "objectID": "1570405342792_47"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Spiritual Support",
      " religious support"
    ],
    "objectID": "1570405342792_46"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Specialized Therapy",
      " OCCUPATIONAL THERAPY",
      " SPEECH THERAPY"
    ],
    "objectID": "1570405342792_45"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Peer Support",
      " PEER RECOVERY COACHING",
      " support peer",
      " support from peers",
      " peers support",
      " support peers"
    ],
    "objectID": "1570405342792_44"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Mentoring",
      " mentor",
      " mentorship",
      " mentorship opportunity",
      " mentorships",
      " mentee",
      " mentees",
      " mentors"
    ],
    "objectID": "1570405342792_43"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Individual Counseling",
      " ONE-ON-ONE SUPPORT",
      " 1-on-1 Support",
      " One on One support",
      " 1 on 1 support",
      " one on one counseling",
      " 1 on 1 counseling",
      " one-on-one counseling",
      " 1-on-1 counseling",
      " individual support",
      " therapy",
      " 1-on-1 therapy",
      " one on one therapy"
    ],
    "objectID": "1570405342792_42"
  },
  {
    "type": "synonym",
    "synonyms": [
      "EVICTION PREVENTION & DEFENSE",
      " At Imminent Risk of Eviction",
      " Eviction Prevention",
      " eviction",
      " evicted",
      " stop eviction",
      " eviction legal help",
      " eviction legal assistance",
      " legal assistance for eviction",
      " legal help for eviction",
      " notice to vacate",
      " kicked out"
    ],
    "objectID": "1570405342792_41"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Eviction Prevention & Defense",
      " At Imminent Risk of Eviction",
      " Eviction Prevention",
      " avoiding eviction",
      " eviction",
      " eviction help",
      " help with eviction",
      " fight eviction",
      " prevent eviction",
      " defend against eviction",
      " defence from eviction",
      " defend from eviction",
      " resist eviction",
      " eviction defense",
      " getting kicked out",
      " eviction notice",
      " evicted",
      " eviction defence",
      " defense from eviction"
    ],
    "objectID": "1570405342792_40"
  },
  {
    "type": "synonym",
    "synonyms": [
      "CLOTHING",
      " BABY CLOTHES",
      " jacket",
      " coat",
      " shirts",
      " shoes",
      " underwear",
      " coats",
      " jackets",
      " shirt",
      " hats",
      " belt",
      " boot",
      " blouse",
      " skirt",
      " pants",
      " socks",
      " hat",
      " beanie",
      " bra"
    ],
    "objectID": "1570405342792_4"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Housing Counseling",
      " HELP FIND HOUSING",
      " HOUSING ADVICE",
      " FORECLOSURE COUNSELING",
      " HOMEBUYER EDUCATION",
      " tenants rights",
      " housing rights",
      " help finding housing",
      " help finding an apartment",
      " finding an affordable appartment",
      " avoiding foreclosure",
      " help with foreclosure",
      " forclosure help",
      " housing help",
      " help getting housing",
      " renters rights"
    ],
    "objectID": "1570405342792_39"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Home Visiting",
      " homebound",
      " homeward bound",
      " visit in home",
      " in home visit",
      " home visit",
      " visit family",
      " family visit",
      " home visits",
      " keep company"
    ],
    "objectID": "1570405342792_38"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Domestic Violence Hotline",
      " domestic violence hotlines",
      " report domestic violence",
      " report domestic abuse",
      " report abuse",
      " report attack",
      " domestic violence report",
      " abuse report",
      " domestic violence reporting",
      " domestic abuse hotline",
      " abuse hotline",
      " attack hotline",
      " domestic abuse hotlines",
      " abuse hotlines",
      " attack hotlines"
    ],
    "objectID": "1570405342792_37"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Help Hotlines",
      " suicide prevention"
    ],
    "objectID": "1570405342792_36"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Help Escape Violence",
      " Domestic Violence Counseling",
      " Domestic Violence Counsel"
    ],
    "objectID": "1570405342792_35"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Group Therapy",
      " therapy group"
    ],
    "objectID": "1570405342792_34"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Family Planning",
      " planning a family",
      " plan a family"
    ],
    "objectID": "1570405342792_33"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Family Counseling",
      " marriage counseling",
      " family counsel",
      " marriage counsel",
      " marriage therapy",
      " couples therapy",
      " couples counseling",
      " relationship counseling",
      " relationship support",
      " marriage support"
    ],
    "objectID": "1570405342792_32"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Form & Paperwork Assistance",
      " HELP FILL OUT FORMS",
      " paperwork",
      " paperwork assistance",
      " form assistance",
      " form help",
      " help fill out paperwork",
      " help filling out paperwork",
      " help filling out forms",
      " help doing forms",
      " help filling paperwork"
    ],
    "objectID": "1570405342792_31"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Case Manager",
      " ONE-ON-ONE SUPPORT",
      " case management",
      " 1-on-1 Support",
      " One on One support",
      " 1 on 1 support",
      " Individual Counseling",
      " one on one counseling",
      " 1 on 1 counseling",
      " one-on-one counseling",
      " 1-on-1 counseling",
      " individual support",
      " case worker",
      " case workers",
      " caseworker",
      " caseworkers",
      " social worker",
      " social workers",
      " socialworker",
      " socialworkers"
    ],
    "objectID": "1570405342792_30"
  },
  {
    "type": "synonym",
    "synonyms": [
      "CLOTHING",
      " CLOTHES FOR WORK",
      " work clothes",
      " clothing for work",
      " professional clothes",
      " business casual clothes",
      " work clothing",
      " tie",
      " ties",
      " work attire",
      " business attire",
      " formal attire",
      " formal clothes",
      " suit",
      " suits",
      " attire for work",
      " work outfit",
      " outfit for work",
      " formal clothing",
      " boot"
    ],
    "objectID": "1570405342792_3"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Bereavement",
      " loss counseling",
      " loss counsel",
      " lost a loved one",
      " loosing a loved one",
      " dealing with death",
      " deal with death",
      " death support",
      " loss support",
      " bereave",
      " grieving",
      " grief",
      " grief counseling",
      " grief counsel",
      " bereaving",
      " managing loss",
      " loss therapy"
    ],
    "objectID": "1570405342792_29"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Anger Management",
      " anger prevention",
      " anger control",
      " work on my anger",
      " stop being angry",
      " stop anger",
      " manage anger"
    ],
    "objectID": "1570405342792_28"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Counseling & Support",
      " SUPPORT NETWORK",
      " COUNSELING",
      " Support",
      " therapist",
      " counselor",
      " therapy",
      " counseling program",
      " shrink",
      " psychologist",
      " psychiatrist",
      " therapist",
      " support networks"
    ],
    "objectID": "1570405342792_27"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Animal Welfare",
      " SUPPORT & SERVICE ANIMALS",
      " Pets",
      " emotional support animals",
      " animals",
      " pet",
      " animal",
      " dog",
      " cat",
      " pet food",
      " support animals",
      " pet supplies",
      " companion animals",
      " animal companion",
      " animal shelters",
      " pet shelter",
      " animal rescue",
      " help paying for pet care",
      " help pay for pet care",
      " service animal"
    ],
    "objectID": "1570405342792_26"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Transition Age Youth",
      " TAY",
      " transition aged",
      " transition age",
      " transitional age",
      " transitional aged",
      " transitional youth",
      " youth in transition",
      " youths in transition",
      " transitional youths"
    ],
    "objectID": "1570405342792_25"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Adoption & Foster Care",
      " ADOPTION & FOSTER PLACEMENT",
      " ADOPTION & FOSTER PARENTING",
      " ADOPTION PLANNING",
      " ADOPTION COUNSELING",
      " POST-ADOPTION SUPPORT",
      " adopted",
      " adopting",
      " adoption agent",
      " adoption agency",
      " adopt",
      " adoption",
      " foster child",
      " foster parent",
      " foster",
      " adoption placement",
      " foster placement",
      " adoption parenting",
      " foster parenting",
      " support post-adoption"
    ],
    "objectID": "1570405342792_24"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Care",
      " caregiving",
      " help",
      " assistance"
    ],
    "objectID": "1570405342792_23"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Water",
      " drinks",
      " drinking water",
      " tap water"
    ],
    "objectID": "1570405342792_22"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Waste Disposal",
      " Trash",
      " Garbage",
      " disposal",
      " poop pick up",
      " poop pickup",
      " shit clean up",
      " blackwater",
      " black water",
      " grey water",
      " greywater"
    ],
    "objectID": "1570405342792_21"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Dental Care",
      " Dental",
      " Teeth",
      " Teeth cleaning",
      " tooth",
      " tooth cleaning",
      " Dentist",
      " dental hygiene",
      " dentistry",
      " dds"
    ],
    "objectID": "1570405342792_20"
  },
  {
    "type": "synonym",
    "synonyms": [
      "CLOTHING",
      " CLOTHES FOR SCHOOL",
      " school clothes",
      " school shopping",
      " shoes for school",
      " shirts for school",
      " school clothing",
      " school attire",
      " attire for school",
      " clothing for school",
      " school shirts",
      " school pants",
      " school outfit",
      " outfit for school",
      " school uniform",
      " uniform for school"
    ],
    "objectID": "1570405342792_2"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Haircut",
      " barber",
      " shaving",
      " shave",
      " salon",
      " hairdresser",
      " hair salon",
      " style",
      " hairstyle",
      " trim"
    ],
    "objectID": "1570405342792_19"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Toilet",
      " Bathroom",
      " Restroom",
      " Toilets",
      " loo",
      " public bathroom",
      " public restroom",
      " ladies room",
      " ladys room",
      " mens room",
      " water closet",
      " wc"
    ],
    "objectID": "1570405342792_18"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Shower",
      " Bath",
      " Bathe",
      " Showers",
      " baths",
      " clean up",
      " get clean"
    ],
    "objectID": "1570405342792_17"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Hygiene Supplies",
      " Personal Care Items",
      " toothbrush",
      " hairbrush",
      " Razor",
      " Tampons",
      " towel",
      " Self care supplies",
      " wetwipes",
      " feminine hygiene",
      " feminine products",
      " toothpaste",
      " female products",
      " nail clippers",
      " soap",
      " shampoo",
      " conditioner",
      " body wash",
      " tampon",
      " pads"
    ],
    "objectID": "1570405342792_16"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Hygiene",
      " Personal Hygiene",
      " Personal Cleanliness",
      " cleanliness",
      " sterile",
      " clean",
      " clean up",
      " shower essentials",
      " personal care"
    ],
    "objectID": "1570405342792_15"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Personal Safety Items",
      " personal safety goods",
      " goods for personal safety",
      " bike helmet",
      " mace",
      " whistle",
      " helmet",
      " bicycle helmet",
      " bike helmets",
      " bicycle helmets",
      " whistles",
      " safety whistle",
      " safety whistles",
      " rape whistle",
      " rape whistles",
      " rape alarm",
      " fire alarm",
      " smoke alarm",
      " carbon monoxide alarm",
      " carbon monoxide detector"
    ],
    "objectID": "1570405342792_14"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Goods",
      " HOME GOODS",
      " BABY SUPPLIES",
      " diaper",
      " diapers",
      " formula",
      " blanket",
      " blankets",
      " fans",
      " furniture",
      " appliances",
      " donations",
      " items",
      " items donated",
      " stuff",
      " donated stuff",
      " donated things",
      " toys",
      " gifts"
    ],
    "objectID": "1570405342792_13"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Nutrition Education",
      " diet education",
      " healthy eating",
      " healthy diet",
      " food education",
      " nutrition support"
    ],
    "objectID": "1570405342792_12"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Hot Meals",
      " soup kitchen"
    ],
    "objectID": "1570405342792_11"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Food Pantry",
      " EMERGENCY FOOD",
      " food distribution",
      " food storage",
      " free food",
      " pantry of food",
      " food bank",
      " foodbank",
      " foodbanks",
      " food banks",
      " food pantries",
      " foodpantry",
      " foodpantries",
      " food for emergencies",
      " emergencies food"
    ],
    "objectID": "1570405342792_10"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Clothing",
      " CLOTHING VOUCHERS",
      " clothes",
      " attire",
      " outfit",
      " outfits",
      " vouchers for clothes",
      " clothes vouchers",
      " clothes voucher",
      " vouchers for clothing"
    ],
    "objectID": "1570405342792_1"
  },
  {
    "type": "synonym",
    "synonyms": [
      "Basic Needs",
      " Homelessness Essentials"
    ],
    "objectID": "1570405342792_0"
  }
], forward_to_replicas, replace_existing_synonyms)
    puts '[algolia:refresh_synonyms] Success.'
end
