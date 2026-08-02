class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.233"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.233/workmux-darwin-arm64.tar.gz"
      sha256 "9617f089a79831d35f2a1e7e71809f0bf18e88e86fd9795947ee128ff0233980"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.233/workmux-darwin-amd64.tar.gz"
      sha256 "8f99a449faad4bc344524fa8bd09af0e0026be595e512022294d6052c10b3f62"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.233/workmux-linux-arm64.tar.gz"
      sha256 "fff8299e17481a8fc24cc3a2f458631061c0c37236e15bd0fcaa72e13c6935b7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.233/workmux-linux-amd64.tar.gz"
      sha256 "c992a42b3cda71f2ecd4eb515cc869fde2041dffb4e186fe675f7113a96a39a0"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
