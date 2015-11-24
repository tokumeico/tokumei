% tpl_handler `{get_lib_file dirdir/edit.tpl apps/dirdir/edit.tpl}

%{
if(~ 0 $#post_arg_page)
    page=1
if not
    page=$post_arg_page

if(~ `{ls $sitedir$req_path/*.txt | wc -l | awk '{print $1 % 10}'} 0)
    numpages=`{ls $sitedir$req_path/*.txt | wc -l | awk '{print int($1 / 10)}'}
if not
    numpages=`{ls $sitedir$req_path/*.txt | wc -l | awk '{print int($1 / 10) + 1}'}
%}

% post_list $req_path $page

<ul class="pagination right">
%   if(! ~ $page 1) {
    <li class="waves-effect">
        <form action="" method="post">
            <input type="hidden" name="page" value="%(`{echo $page | awk 'echo $1--'}%)">
            <button type="submit" class="fakelink"><i class="mdi mdi-chevron-left"></i></button>
        </form>
    </li>
%   }
% for(i in `{seq $numpages}) {
%   if(~ $i $page) {
    <li class="waves-effect active pink white-text">
%   }
%   if not {
    <li class="waves-effect">
%   }
        <form action="" method="post">
            <input type="hidden" name="page" value="%($i%)">
            <button type="submit" class="fakelink">%($i%)</button>
        </form>
    </li>
% }
%   if(! ~ $page $numpages) {
    <li class="waves-effect">
        <form action="" method="post">
            <input type="hidden" name="page" value="%(`{echo $page | awk 'echo $1++'}%)">
            <button type="submit" class="fakelink"><i class="mdi mdi-chevron-right"></i></button>
        </form>
    </li>
%   }
</ul>
