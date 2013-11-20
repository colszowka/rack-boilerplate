# rack-boilerplate

**A lean boilerplate for developing ruby/rack web applications with sane defaults out of the box**

The aim of this project is to provide a boilerplate for rack web applications that supplies sane,
opionated defaults for common things while at the same time documenting as well as possible the reasons
behind the choices and staying lean.

The git history of this repository doubles as documentation. Changes are bundled by functionality as
much as possible, and the commit messages are trying to explain the rationale behind a specific 
choice. Using git blame and git log for a given file should give you a reasonably good understanding of
why a particular thing is implemented the way it is.

The master branch of the repo is kept at a sane minimum base-line that does not force too many opinions
on you. Various added functionalities are present in branches of this repo. Currently, these are:

  * `rspec` - Bootstraped RSpec testing of your project using rack-test, with simplecov enabled.
  * `yard` - API documentation using yard, defaulting to markdown syntax all the way
  * `active_record` - Sets you up with ActiveRecord and database migrations

To construct your custom boilerplate out of these functionalities, the process goes like this:

  * Clone the repository
  * Create a custom branch off of master with `git checkout master && git checkout -b customized` 
  * Bring in the add-ons you want with `git rebase BRANCH_NAME`

Now you should have a branch that includes all the components you would like. Since you probably do not want 
the git history of the boilerplate repo, you can package your branch up as a clean zip file using `git archive`:

    git archive --format zip --output tmp/bp-customized.zip customized

After that, you can extract the archive contents into a directory where you'd like to get started. You can also
perform some cleanup:

    git init
    cat .gitignore | grep -v Gemfile.lock > .gitignore
    echo '# My Shiny Rack App' > README.md
    rm -f MIT_LICENSE
    rm -f db/migrate/*.rb
    git add .
    git commit -m "Initial commit"

*More documentation is obviously required - for now, please refer to the commit notes.*