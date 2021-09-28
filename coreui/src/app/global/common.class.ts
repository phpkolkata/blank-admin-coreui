export class CommonClass {
  public static timeframe = [
    { label: '1 day', value: '1 day' },
    { label: '2 day', value: '2 day' },
    { label: '3 day', value: '3 day' },
    { label: '4 day', value: '4 day' },
    { label: '5 day', value: '5 day' },
    { label: '6 day', value: '6 day' },
    { label: '7 day', value: '7 day' },
    { label: '8 day', value: '8 day' },
    { label: '9 day', value: '9 day' },
    { label: '10 day', value: '10 day' },
    { label: '11 day', value: '11 day' },
    { label: '12 day', value: '12 day' },
    { label: '13 day', value: '13 day' },
    { label: '14 day', value: '14 day' },
    { label: '15 day', value: '15 day' },
  ];

  public static sampleTypes = [
    { label: 'Blood', value: 'Blood' },
    { label: 'Semen', value: 'Semen' },
    { label: 'Swabs', value: 'Swabs' },
    { label: 'Tissue', value: 'Tissue' },
    { label: 'Stool', value: 'Stool' },
    { label: 'Body Fluids', value: 'Body Fluids' },
    { label: 'Body Parts', value: 'Body Parts' },
    { label: 'Urine', value: 'Urine' },
    { label: 'Saliva', value: 'Saliva' },
    { label: 'Sputum', value: 'Sputum' },
    { label: 'Surgical Drain Fluids', value: 'Surgical Drain Fluids' },
    { label: 'Tissues Biopsies', value: 'Tissues Biopsies' },
    { label: 'Whole Blood', value: 'Whole Blood' },
    { label: 'Serum', value: 'Serum' },
    { label: 'Plasma', value: 'Plasma' },
  ];

  public static paymentStyle = [
    { label: 'Flat Amount', value: 'flat' },
    { label: 'Percentage Amount', value: 'percent' },
  ];

  public static genderList = [
    { label: 'Male', value: 'male' },
    { label: 'Female', value: 'female' },
    { label: 'Others', value: 'others' },
  ];
  public static isActive = [
    { label: 'Active', value: 'y' },
    { label: 'Inactive', value: 'n' },
  ];

  public static pageRange = [10, 50, 100, 500, 1000, 2000, 3000, 5000];

  public static role = { reporting: 'rd', frontdesk: 'fd', admin: 'ad' };
}
