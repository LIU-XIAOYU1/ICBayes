\name{case2ph}
\alias{case2ph}
\title{PH model for general interval-censored data}
\description{Fit proportional hazards model for general interval-censored data. Use MCMC method to estimate regression coefficients, baseline survival, 
and survival function at user-specified covariate values.}
\usage{
case2ph(L, R, status, xcov, x_user, order, sig0, coef_range, 
	a_eta, b_eta, knots, grids, niter)
}
\arguments{
  \item{L}{a numeric vector of left timepoints of observed time intervals.}
  \item{R}{a numeric vector of right timepoints of observed time intervals.}
  \item{status}{a vector of censoring indicators: 1=left-censored, 0=right-censored.}
  \item{xcov}{a matrix of covariates, each column corresponds to one covariate.}
  \item{x_user}{a user specified vector of covariate values.}
  \item{order}{degree of I-splines (\code{b_l}) (see details). Recommended values are 2-4.}
  \item{sig0}{standard deviation of normal prior for each regression coefficient \code{beta_r}.}
  \item{coef_range}{specify support domain of target density for \code{beta_r} sampled by \code{\link[HI]{arms}} (see details).}
  \item{a_eta}{shape parameter of Gamma prior for \code{gamma_l} (see details).}
  \item{b_eta}{rate parameter of Gamma prior for \code{gamma_l} (see details).}
  \item{knots}{a sequence of points to define I-splines.}
  \item{grids}{a sequence of points where baseline survival function is to be estimated.}
  \item{niter}{total number of iterations of MCMC chains.}
}
\details{
The baseline cumulative hazard is modeled by a linear combination of I-splines: 

                    \code{sum_{l=1}^{k}(gamma_l*b_l)}.

Function \code{\link[HI]{arms}} is used to sample each regression coefficient \code{beta_r}, and \code{coef_range} specifies the support of the \code{indFunc} 
in \code{\link[HI]{arms}}.
}
\value{
a list containing the following elements:
 \item{parbeta}{a \code{niter} by \code{p} matrix of MCMC draws of \code{beta_r}, r=1, ..., p. }
 \item{parsurv0}{a \code{niter} by \code{length(grids)} matrix, each row contains the baseline survival at \code{grids} from one iteration.}
 \item{grids}{a sequence of points where baseline survival is estimated.}
}
\references{
Lin, X., Cai, B., Wang, L., and Zhang, Z. (2015). Bayesian proportional hazards model for general interval-censored data. 
\emph{Lifetime Data Analysis}, \bold{21} 470-490.
}
\author{Bo Cai}
