use regexsolver::Term;
use rustler::NifResult;

mod atoms {
    rustler::atoms! {
        ok
    }
}

#[rustler::nif]
pub fn intersection(regex1: &str, regex2: &str) -> NifResult<(rustler::Atom, String)> {
    let term1 = Term::from_regex(regex1)
        .map_err(|_| rustler::Error::Term(Box::new(format!("invalid regex: {regex1}"))))?;
    let term2 = Term::from_regex(regex2)
        .map_err(|_| rustler::Error::Term(Box::new(format!("invalid regex: {regex2}"))))?;

    match term1.intersection(&[term2]) {
        Ok(Term::RegularExpression(regex)) => Ok((atoms::ok(), regex.to_string())),
        _ => Err(rustler::Error::BadArg),
    }
}

rustler::init!("Elixir.RegexSolver");
