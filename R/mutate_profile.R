#' @title Transform a SPC (by profile) with a set of expressions
#' @name mutate_profile
#' @aliases mutate_profile,SoilProfileCollection-method
#' @description \code{mutate_profile()} is a function used for transforming SoilProfileCollections. Each expression is applied to site or horizon level attributes of individual profiles. This distinguishes this function from \code{mutate}, which is applied to pooled values (across individuals) in a collection/group. 
#' @param object A SoilProfileCollection
#' @param ... A set of comma-delimited R expressions that resolve to a transformation to be applied to a single profile e.g \code{mutate_profile(hzdept = max(hzdept) - hzdept)}
#' @return A SoilProfileCollection.
#' @author Andrew G. Brown.
#' 
#' @rdname mutate_profile
#' @export mutate_profile
mutate_profile <- function(object, ...) {
  if(requireNamespace("rlang")) {
    
    # capture expression(s) at function
    x <- rlang::enquos(..., .named = TRUE)
    
    # TODO: group_by would operate above profile?
    #       is it safe to assume operations, in general, would
    #       be on the profile basis, and then aggregated by group?
    
    # apply expressions to each profile, frameify results
    res <- profileApply(object, function(o) {
      # create composite object to facilitate eval_tidy
      # TODO: abstract
      h <- horizons(o)
      s <- as.list(site(o))
      h <- as.list(h[,!horizonNames(o) %in% siteNames(o)])
      .data <- c(s, h)
      
      for(n in names(x)) {
        foo <- rlang::eval_tidy(x[[n]], .data)
        o[[n]] <- foo
      }
      return(list(st=site(o), hz=horizons(o)))
      
    }, simplify = FALSE)
    
    slot(object, 'site') <- do.call('rbind', 
                                    lapply(res, function(r) {
      r$st
    }))
    slot(object, 'horizons') <- do.call('rbind', 
                                        lapply(res, function(r) {
      r$hz
    }))
    
    return(object)
  }
}
