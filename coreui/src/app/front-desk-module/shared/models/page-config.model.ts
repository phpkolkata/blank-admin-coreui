export class ModelPageConfig {
  limit?: number;
  offset?: number;
  sort?: {
    sortBy?: string;
    sortType?: number;
  };
  filters?: any;
  customData?: any;
  joins?: any;
}
