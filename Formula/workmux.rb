class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.39/aarch64-apple-darwin.tar.gz"
      sha256 "1d89b6f05063adf5741855986fe01928a0d996ec520b116ec1d533201db6b4dd"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.39/x86_64-apple-darwin.tar.gz"
      sha256 "a6bd1268f1ab2a4dbc1006b0814e3fd014a21ef646aca1310ae1a77a86481dc6"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.39/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "11d7ab7fe2e503c734ddc4985c4fa6d96c551f92a5a45becf0a77b08e7ba6ece"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
