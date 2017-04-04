#lang scribble/manual
@(require scribble-math/dollar)
@require[@for-label[machin
                    racket/base]]

@title{machin}
@author{logc}

@defmodule[machin]

A Machine Learning package

@section{Supervised learning}

@subsection{Least Squares and Nearest Neighbors}

The linear model has been a mainstay of statistics for the past 30 years and
remains one of our most important tools. Given a vector of inputs @${X^{T} =
(X_1,X_2,...,X_p)}, we predict the output @${Y} via the model

@$${ \hat{Y} = \hat{\beta}_0 + \sum\limits_{j=1}^{p}{X_j \hat{\beta}_j} }

How do we fit the linear model to a set of training data? There are many
different methods, but by far the most popular is the method of least squares.
In this approach, we pick the coefficients β to minimize the residual sum of
squares

@$${ RSS(\beta) = \sum\limits_{i=1}^{N}{(y_i - x_{i}^{T} \beta)^2} }

where @${X} is an @${N \times p} matrix with each row an input vector, and @${y}
is an @${N}-vector of the outputs in the training set. Differentiating w.r.t.
@${\beta} we get the normal equations

@$${ X^{T} (y - X \beta) = 0 }

If @${X^{T} X} is nonsingular, then the unique solution is given by

@$${\hat{\beta} = (X^{T} X)^{-1} X^{T} y}