%Command Window output from Fri, July 10, 2020

load('101.mat')
load('102.mat')
clear
load('102.mat')
help regexp
 regexp Match regular expression
    S = regexp(STR,EXPRESSION) matches the regular expression, EXPRESSION, in
    the input argument, STR.  The indices of the beginning of the matches are 
    returned. STR and EXPRESSION can be character vectors, string arrays,
    or cell arrays of character vectors.
 
    S = regexp(STR,EXPRESSION,'forceCellOutput') returns S as a cell array
    in all cases, even when the output would otherwise be returned as a numeric 
    array, character vector, or a string array. In those cases, the
    numeric array, character vector, or string array is contained within a scalar cell.
    
    In EXPRESSION, patterns are specified using combinations of metacharacters 
    and literal characters.  There are a few classes of metacharacters, 
    partially listed below.  More extensive explanation can be found in the 
    Regular Expressions section of the MATLAB documentation.
 
    The following metacharacters match exactly one character from its respective 
    set of characters:  
 
     Metacharacter   Meaning
    ---------------  --------------------------------
                .    Any character
               []    Any character contained within the brackets
              [^]    Any character not contained within the brackets
               \w    A word character [a-z_A-Z0-9]
               \W    Not a word character [^a-z_A-Z0-9]
               \d    A digit [0-9]
               \D    Not a digit [^0-9]
               \s    Whitespace [ \t\r\n\f\v]
               \S    Not whitespace [^ \t\r\n\f\v]
 
    The following metacharacters are used to logically group subexpressions or
    to specify context for a position in the match.  These metacharacters do not
    match any characters in STR:
   
     Metacharacter   Meaning
    ---------------  --------------------------------
              ()     Group subexpression
               |     Match subexpression before or after the |
               ^     Match expression at the start of STR
               $     Match expression at the end of STR
              \<     Match expression at the start of a word
              \>     Match expression at the end of a word
 
    The following metacharacters specify the number of times the previous
    metacharacter or grouped subexpression may be matched:
    
     Metacharacter   Meaning
    ---------------  --------------------------------
               *     Match zero or more occurrences
               +     Match one or more occurrences
               ?     Match zero or one occurrence
            {n,m}    Match between n and m occurrences
 
    Characters that are not special metacharacters are all treated literally in
    a match.  To match a character that is a special metacharacter, escape that
    character with a '\'.  For example '.' matches any character, so to match
    a '.' specifically, use '\.' in your pattern.
 
    Example:
       str = 'bat cat can car coat court cut ct caoueouat';
       pat = 'c[aeiou]+t';
       regexp(str, pat)
          returns [5 17 28 35]
 
       regexp(str, pat, 'forceCellOutput')
          returns {[5 17 28 35]}
 
    When one of STR or EXPRESSION is a string array or a cell array of character 
    vectors, regexp matches the scalar input with each element of the array input.
 
    Example:
       str = ["Madrid, Spain","Romeo and Juliet","MATLAB is great"];
       pat = '\s';
       regexp(str, pat)
          returns {[8]; [6 10]; [7 10]}
 
    When both STR and EXPRESSION are string arrays or cell arrays of character 
    vectors, regexp matches the elements of STR and EXPRESSION sequentially.  
    The number of elements in STR and EXPRESSION must be identical.
 
    Example:
       str = {'Madrid, Spain' 'Romeo and Juliet' 'MATLAB is great'};
       pat = {'\s', '\w+', '[A-Z]'};
       regexp(str, pat)
          returns {[8]; [1 7 11]; [1 2 3 4 5 6]}
 
    regexp supports up to seven outputs.  These outputs may be requested 
    individually or in combinations by using additional input keywords.  The 
    order of the input keywords corresponds to the order of the results.  The 
    input keywords and their corresponding results in the default order are:
 
           Keyword   Result
    ---------------  --------------------------------
           'start'   Row vector of starting indices of each match
             'end'   Row vector of ending indices of each match
    'tokenExtents'   Cell array of extents of tokens in each match
           'match'   Cell array or string array of the text of each match
          'tokens'   Cell array or string array of the text of each token in each match
           'names'   Structure array of each named token in each match
           'split'   Cell array or string array of the text delimited by each match
 
    If you specify 'match', 'tokens', or 'split', then regexp returns a
    string array if STR is a string array, or a cell array if STR is a cell
    array of character vectors.
 
    Example:
       str = 'regexp helps you relax';
       pat = '\w*x\w*';
       m = regexp(str, pat, 'match')
          returns
             m = {'regexp', 'relax'}
 
    Example:
       str = "regexp helps you relax";
       pat = '\s+';
       s = regexp(str, pat, 'split')
          returns
             s = ["regexp"    "helps"    "you"    "relax"]
 
    Tokens are created by parenthesized subexpressions within EXPRESSION.
 
    Example:
       str = 'six sides of a hexagon';
       pat = 's(\w*)s';
       t = regexp(str, pat, 'tokens')
          returns
             t = {{'ide'}}
 
    Named tokens are denoted by the pattern (?<name>...).  The 'names' result 
    structure will have fields corresponding to the named tokens in EXPRESSION.
 
    Example:
       str = 'John Davis; Rogers, James';
       pat = '(?<first>\w+)\s+(?<last>\w+)|(?<last>\w+),\s+(?<first>\w+)';
       n = regexp(str, pat, 'names')
          returns
              n(1).first = 'John'
              n(1).last  = 'Davis'
              n(2).first = 'James'
              n(2).last  = 'Rogers'
 
    By default, regexp returns all matches.  To find just the first match, use
    regexp(STR,EXPRESSION,'once').
 
    regexp supports international character sets.
 
    See also regexpi, regexprep, regexptranslate, strcmp, strfind.
 

    Reference page for regexp

load('/Users/lucy_core/Documents/Summer 2020/NSERC-CREATE Fellowship/ArsIsabelle_BHS_Project/FFRclassifiers_Backup/hmm f0 syllable vs tone/results/sub101_nst3_size50_ave13.mat')
analysesCorrectRates_2
Undefined function or variable 'analysesCorrectRates_2'. 
analysesCorrectRates_2
help gcp
 gcp Returns the current parallel pool
 
    pool = gcp returns the current parallel pool if one exists. If a pool
    does not exist then an empty pool is returned if your parallel
    preferences have auto-creation of pools disabled, or will create and
    return a pool otherwise.
 
    pool = gcp('nocreate') returns the current pool if one exists, otherwise pool will
    be empty
 
    Example:
    % Create a parallel pool if none exists
    if isempty(gcp)
        parpool;
    end
 
    % If a parallel pool exists, list the auto-attached files
    p = gcp;
    if ~isempty(p)
        listAutoAttachedFiles(p);
    end
 
    % Delete the current parallel pool. If no pool is running, gcp starts
    % one, which is immediately deleted.
    delete(gcp)
 
    % Delete the current parallel pool if there is one, without creating one.
    delete(gcp('nocreate'))
 
    See also parpool

    Reference page for gcp

help intersect
 intersect Set intersection.
    C = intersect(A,B) for vectors A and B, returns the values common to
    the two vectors with no repetitions. C will be sorted.
 
    C = intersect(A,B,'rows') for matrices A and B with the same
    number of columns, returns the rows common to the two matrices. The
    rows of the matrix C will be in sorted order.
 
    [C,IA,IB] = intersect(A,B) also returns index vectors IA and IB such
    that C = A(IA) and C = B(IB). If there are repeated common values in
    A or B then the index of the first occurrence of each repeated value is
    returned.
 
    [C,IA,IB] = intersect(A,B,'rows') also returns index vectors IA and IB
    such that C = A(IA,:) and C = B(IB,:).
 
    [C,IA,IB] = intersect(A,B,'stable') for arrays A and B, returns the
    values of C in the same order that they appear in A.
    [C,IA,IB] = intersect(A,B,'sorted') returns the values of C in sorted
    order.
    If A and B are row vectors, then C will be a row vector as well,
    otherwise C will be a column vector. IA and IB are column vectors.
    If there are repeated common values in A or B then the index of the
    first occurrence of each repeated value is returned.
 
    [C,IA,IB] = intersect(A,B,'rows','stable') returns the rows of C in the
    same order that they appear in A.
    [C,IA,IB] = intersect(A,B,'rows','sorted') returns the rows of C in
    sorted order.
 
    The behavior of intersect has changed.  This includes:
      -	occurrence of indices in IA and IB switched from last to first
      -	orientation of vector C
      -	IA and IB will always be column index vectors
      -	tighter restrictions on combinations of classes
 
    If this change in behavior has adversely affected your code, you may
    preserve the previous behavior with:
 
       [C,IA,IB] = intersect(A,B,'legacy')
       [C,IA,IB] = intersect(A,B,'rows','legacy')
 
    Examples:
 
       a = [9 9 9 9 9 9 8 8 8 8 7 7 7 6 6 6 5 5 4 2 1]
       b = [1 1 1 3 3 3 3 3 4 4 4 4 4 10 10 10]
 
       [c1,ia1,ib1] = intersect(a,b)
       % returns
       c1 = [1 4], ia1 = [21 19]', ib1 = [1 9]'
 
       [c2,ia2,ib2] = intersect(a,b,'stable')
       % returns
       c2 = [4 1], ia2 = [19 21]', ib2 = [9 1]'
 
       c = intersect([1 NaN 2 3],[3 4 NaN 1])
       % NaNs compare as not equal, so this returns
       c = [1 3]
 
    Class support for inputs A and B, where A and B must be of the same
    class unless stated otherwise:
       - logical, char, all numeric classes (may combine with double arrays)
       - cell arrays of strings (may combine with char arrays)
       -- 'rows' option is not supported for cell arrays
       - objects with methods SORT (SORTROWS for the 'rows' option), EQ and NE
       -- including heterogeneous arrays derived from the same root class
 
    See also unique, union, setdiff, setxor, ismember, sort, sortrows.

    Reference page for intersect
    Other functions named intersect

main_2
Starting parallel pool (parpool) using the 'local' profile ...
Error using parpool (line 104)
You requested a minimum of 3 workers, but the cluster "local" has the NumWorkers property
set to allow a maximum of 2 workers. To run a communicating job on more workers than this
(up to a maximum of 512 for the Local cluster), increase the value of the NumWorkers
property for the cluster. The default value of NumWorkers for a Local cluster is the number
of cores on the local machine.
Error in main_2 (line 9)
    parpool(3);
 
main_2
Starting parallel pool (parpool) using the 'local' profile ...
Warning: The system time zone setting, 'US/Eastern', does not specify a single time zone
unambiguously. It will be treated as 'America/New_York'. See the datetime.TimeZone property
for details about specifying time zones. 
> In verifyTimeZone (line 23)
  In datetime (line 515)
  In parallel.internal.cluster.DefaultProperties.getNewJobPropStruct (line 16)
  In parallel.internal.cluster.CJSSupport/buildJob (line 158)
  In parallel.cluster.CJSCluster/buildCommunicatingJob (line 465)
  In parallel.Cluster/createCommunicatingJob (line 92)
  In parallel.internal.pool.InteractiveClient>iCreateCommunicatingJob (line 715)
  In parallel.internal.pool.InteractiveClient/start (line 325)
  In parallel.Pool>iStartClient (line 593)
  In parallel.Pool.hBuildPool (line 472)
  In parallel.internal.pool.doParpool (line 18)
  In parpool (line 89)
  In main_2 (line 10) 
connected to 2 workers.
sub =
    '101.mat'
cm =
   33.3333   66.6667
   66.6667   33.3333
sub =
    '102.mat'
cm =
   66.6667   33.3333
   66.6667   33.3333
sub =
    '103.mat'
cm =
   66.6667   33.3333
   33.3333   66.6667
sub =
    '104.mat'
cm =
   33.3333   66.6667
   33.3333   66.6667
sub =
    '105.mat'
cm =
   66.6667   33.3333
         0  100.0000
sub =
    '106.mat'
cm =
   66.6667   33.3333
   33.3333   66.6667
sub =
    '107.mat'
cm =
   66.6667   33.3333
   33.3333   66.6667
sub =
    '108.mat'
cm =
   66.6667   33.3333
   66.6667   33.3333
sub =
    '109.mat'
cm =
   66.6667   33.3333
         0  100.0000
sub =
    '110.mat'
cm =
   100     0
   100     0
Operation terminated by user during distcomp.remoteparfor/getCompleteIntervals (line 127)

In parallel_function>distributed_execution (line 820)
        [tags, out] = P.getCompleteIntervals(chunkSize);
In parallel_function (line 587)
        R = distributed_execution(...
In hmm_modeling (line 27)
       parfor j=1:length(tms)

In main_2 (line 77)
                [right pred logp] = hmm_modeling(trainfold,testfold,params);
 
main_2
Analyzing and transferring files to the workers ...done.
sub =
    '101.mat'
cm =
   66.6667   33.3333
   33.3333   66.6667
sub =
    '102.mat'
cm =
   66.6667   33.3333
  100.0000         0
sub =
    '103.mat'
cm =
  100.0000         0
   66.6667   33.3333
sub =
    '104.mat'
cm =
   66.6667   33.3333
   66.6667   33.3333
sub =
    '105.mat'
cm =
   66.6667   33.3333
   33.3333   66.6667
sub =
    '106.mat'
cm =
   66.6667   33.3333
   66.6667   33.3333
sub =
    '107.mat'
cm =
   66.6667   33.3333
   66.6667   33.3333
sub =
    '108.mat'
cm =
   66.6667   33.3333
   66.6667   33.3333
sub =
    '109.mat'
cm =
   66.6667   33.3333
   33.3333   66.6667
sub =
    '110.mat'
cm =
   33.3333   66.6667
   66.6667   33.3333
sub =
    '111.mat'
cm =
   66.6667   33.3333
   33.3333   66.6667
sub =
    '112.mat'
cm =
   33.3333   66.6667
  100.0000         0
sub =
    '114.mat'
cm =
   33.3333   66.6667
         0  100.0000
sub =
    '201.mat'
cm =
   33.3333   66.6667
   66.6667   33.3333
sub =
    '202.mat'
cm =
   66.6667   33.3333
   66.6667   33.3333
sub =
    '203.mat'
cm =
  100.0000         0
   33.3333   66.6667
sub =
    '204.mat'
cm =
     0   100
   100     0
sub =
    '205.mat'
cm =
         0  100.0000
   66.6667   33.3333
sub =
    '206.mat'
cm =
         0  100.0000
   33.3333   66.6667
sub =
    '207.mat'
cm =
   66.6667   33.3333
   33.3333   66.6667
sub =
    '208.mat'
cm =
   66.6667   33.3333
         0  100.0000
sub =
    '209.mat'
cm =
   33.3333   66.6667
   33.3333   66.6667
sub =
    '211.mat'
cm =
  100.0000         0
   66.6667   33.3333
sub =
    '212.mat'
cm =
     0   100
   100     0
sub =
    '213.mat'
cm =
   33.3333   66.6667
   66.6667   33.3333
sub =
    '214.mat'
cm =
   100     0
   100     0
Elapsed time is 110.360369 seconds.
sub =
    '101.mat'
cm =
     0   100
    25    75
sub =
    '102.mat'
cm =
    25    75
    50    50
sub =
    '103.mat'
cm =
    25    75
   100     0
sub =
    '104.mat'
cm =
    75    25
    50    50
sub =
    '105.mat'
cm =
    25    75
    25    75
sub =
    '106.mat'
cm =
    25    75
    50    50
sub =
    '107.mat'
cm =
    50    50
    50    50
sub =
    '108.mat'
cm =
    50    50
     0   100
sub =
    '109.mat'
cm =
    25    75
    50    50
sub =
    '110.mat'
cm =
   100     0
    75    25
sub =
    '111.mat'
cm =
    50    50
    25    75
sub =
    '112.mat'
cm =
    50    50
    25    75
sub =
    '114.mat'
cm =
    25    75
   100     0
sub =
    '201.mat'
cm =
    50    50
    75    25
sub =
    '202.mat'
cm =
    50    50
    75    25
sub =
    '203.mat'
cm =
    25    75
     0   100
sub =
    '204.mat'
cm =
   100     0
    50    50
sub =
    '205.mat'
cm =
    50    50
    75    25
sub =
    '206.mat'
cm =
    25    75
    50    50
sub =
    '207.mat'
cm =
    50    50
    50    50
sub =
    '208.mat'
cm =
    50    50
   100     0
sub =
    '209.mat'
cm =
    50    50
    50    50
sub =
    '211.mat'
cm =
    25    75
    25    75
sub =
    '212.mat'
cm =
    50    50
    25    75
sub =
    '213.mat'
cm =
    75    25
    75    25
sub =
    '214.mat'
cm =
    75    25
     0   100
Elapsed time is 148.618939 seconds.
help ttest
 ttest  One-sample and paired-sample t-test.
    H = ttest(X) performs a t-test of the hypothesis that the data in the
    vector X come from a distribution with mean zero, and returns the
    result of the test in H.  H=0 indicates that the null hypothesis
    ("mean is zero") cannot be rejected at the 5% significance level.  H=1
    indicates that the null hypothesis can be rejected at the 5% level.
    The data are assumed to come from a normal distribution with unknown
    variance.
 
    X can also be a matrix or an N-D array.   For matrices, ttest performs
    separate t-tests along each column of X, and returns a vector of
    results.  For N-D arrays, ttest works along the first non-singleton
    dimension of X.
 
    ttest treats NaNs as missing values, and ignores them.
 
    H = ttest(X,M) performs a t-test of the hypothesis that the data in
    X come from a distribution with mean M.  M must be a scalar.
 
    H = ttest(X,Y) performs a paired t-test of the hypothesis that two
    matched samples, in the vectors X and Y, come from distributions with
    equal means. The difference X-Y is assumed to come from a normal
    distribution with unknown variance.  X and Y must have the same length.
    X and Y can also be matrices or N-D arrays of the same size.
 
    [H,P] = ttest(...) returns the p-value, i.e., the probability of
    observing the given result, or one more extreme, by chance if the null
    hypothesis is true.  Small values of P cast doubt on the validity of
    the null hypothesis.
 
    [H,P,CI] = ttest(...) returns a 100*(1-ALPHA)% confidence interval for
    the true mean of X, or of X-Y for a paired test.
 
    [H,P,CI,STATS] = ttest(...) returns a structure with the following fields:
       'tstat' -- the value of the test statistic
       'df'    -- the degrees of freedom of the test
       'sd'    -- the estimated population standard deviation.  For a
                  paired test, this is the std. dev. of X-Y.
 
    [...] = ttest(X,Y,'PARAM1',val1,'PARAM2',val2,...) specifies one or
    more of the following name/value pairs:
 
        Parameter       Value
        'alpha'         A value ALPHA between 0 and 1 specifying the
                        significance level as (100*ALPHA)%. Default is
                        0.05 for 5% significance.
        'dim'           Dimension DIM to work along. For example, specifying
                        'dim' as 1 tests the column means. Default is the
                        first non-singleton dimension.
        'tail'          A string specifying the alternative hypothesis:
            'both'  -- "mean is not M" (two-tailed test)
            'right' -- "mean is greater than M" (right-tailed test)
            'left'  -- "mean is less than M" (left-tailed test)
 
    See also ttest2, ztest, signtest, signrank, vartest.

    Reference page for ttest

 ttest2 Two-sample t-test with pooled or unpooled variance estimate.
    H = ttest2(X,Y) performs a t-test of the hypothesis that two
    independent samples, in the vectors X and Y, come from distributions
    with equal means, and returns the result of the test in H.  H=0
    indicates that the null hypothesis ("means are equal") cannot be
    rejected at the 5% significance level.  H=1 indicates that the null
    hypothesis can be rejected at the 5% level.  The data are assumed to
    come from normal distributions with unknown, but equal, variances.  X
    and Y can have different lengths.
 
    This function performs an unpaired two-sample t-test. For a paired
    test, use the TTEST function.
 
    X and Y can also be matrices or N-D arrays.  For matrices, ttest2
    performs separate t-tests along each column, and returns a vector of
    results.  X and Y must have the same number of columns.  For N-D
    arrays, ttest2 works along the first non-singleton dimension.  X and Y
    must have the same size along all the remaining dimensions.
 
    ttest2 treats NaNs as missing values, and ignores them.
 
    [H,P] = ttest2(...) returns the p-value, i.e., the probability of
    observing the given result, or one more extreme, by chance if the null
    hypothesis is true.  Small values of P cast doubt on the validity of
    the null hypothesis.
 
    [H,P,CI] = ttest2(...) returns a 100*(1-ALPHA)% confidence interval for
    the true difference of population means.
 
    [H,P,CI,STATS] = ttest2(...) returns a structure with the following fields:
       'tstat' -- the value of the test statistic
       'df'    -- the degrees of freedom of the test
       'sd'    -- the pooled estimate of the population standard deviation
                  (for the equal variance case) or a vector containing the
                  unpooled estimates of the population standard deviations
                  (for the unequal variance case)
 
    [...] = ttest2(X,Y,'PARAM1',val1,'PARAM2',val2,...) specifies one or
    more of the following name/value pairs:
 
        Parameter       Value
        'alpha'         A value ALPHA between 0 and 1 specifying the
                        significance level as (100*ALPHA)%. Default is
                        0.05 for 5% significance.
        'dim'           Dimension DIM to work along. For example, specifying
                        'dim' as 1 tests the column means. Default is the
                        first non-singleton dimension.
        'tail'          A string specifying the alternative hypothesis:
            'both'  "means are not equal" (two-tailed test)
            'right' "mean of X is greater than mean of Y" (right-tailed test)
            'left'  "mean of X is less than mean of Y" (left-tailed test)
        'vartype'       'equal' to perform the default test assuming equal
                        variances, or 'unequal', to perform the test
                        assuming that the two samples come from normal
                        distributions with unknown and unequal variances.
                        This is known as the Behrens-Fisher problem. ttest2
                        uses Satterthwaite's approximation for the
                        effective degrees of freedom.
 
    See also ttest, ranksum, vartest2, ansaribradley.

    Reference page for ttest2

ttest(pclasses, rclasses)
ans =
     0
[H,P,CI,STATS] = ttest(pclasses, rclasses)
H =
     0
P =
    0.3506
CI =
   -0.1706
    0.4206
STATS = 
  struct with fields:

    tstat: 1
       df: 7
       sd: 0.3536
[H,P,CI,STATS] = ttest(plogs2(:,1),plogs2(:,2))
Undefined function or variable 'plogs2'. 
Did you mean:
[H,P,CI,STATS] = ttest(plogps2(:,1),plogps2(:,2))
H =
     0
P =
    0.1521
CI =
   -2.3715
    0.4523
STATS = 
  struct with fields:

    tstat: -1.6071
       df: 7
       sd: 1.6888
