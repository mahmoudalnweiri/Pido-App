abstract class SearchStates{}

class InitialSearchState extends SearchStates{}

class LoadingGetSearchSuggestionsState extends SearchStates{}

class SuccessGetSearchSuggestionsState extends SearchStates{}

class ErrorGetSearchSuggestionsState extends SearchStates{}

class LoadingGetResultsSearchState extends SearchStates{}

class SuccessGetResultsSearchState extends SearchStates{}

class ErrorGetResultsSearchState extends SearchStates{}

class RemoveSuggestionState extends SearchStates{}

class ClearSearchState extends SearchStates{}

class SelectKeywordOfSearchState extends SearchStates{}