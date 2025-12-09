class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.46/aarch64-apple-darwin.tar.gz"
      sha256 "ee358cded59d549cd01d30eeed1698146febc07206b2e04d21b4b3d18bf0310d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.46/x86_64-apple-darwin.tar.gz"
      sha256 "e6cba65adb218e8171c7bbec49f2872a33d99af06127b37ed6d8ad0e311c3b39"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.46/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0736549d7c4d3ec1d1b621c20ced8864fdd8489e5be797f458cf5f219e42fe3c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.46/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe82895f7db433b343a9a1cbafe12a4a43e06555ef1ec30a5f7a376fab02cecb"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
