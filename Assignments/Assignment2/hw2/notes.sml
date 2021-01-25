    | (k,v)::obj' => case assoc(obj',k) of
                            SOME x => v = x
                              | _ => check_contents(obj')
