class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.96"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.96/workmux-darwin-arm64.tar.gz"
      sha256 "34cc937e3baf3546b1e85250a893d6def9ec65bd886f4bb34d729532fad27818"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.96/workmux-darwin-amd64.tar.gz"
      sha256 "10c80f4807b4cab7a01b3721d3f13199c47dab391cff1204543b79ba89b1eb7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.96/workmux-linux-arm64.tar.gz"
      sha256 "5a5e186255999e99e19c7e553f558d1f6344b31f3d10d0645f0cffa6aee39218"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.96/workmux-linux-amd64.tar.gz"
      sha256 "dbb278cbeb1797032b1f56240cd900e2e163fae56c12bd7f8a33ea24a276efe5"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
