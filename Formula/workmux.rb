class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.195"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.195/workmux-darwin-arm64.tar.gz"
      sha256 "01ebb3a5227e14f8128a4554bd3e36a07694b00b757204193a2280fdcccfb450"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.195/workmux-darwin-amd64.tar.gz"
      sha256 "765319572dbcededece8f3f7359d957fb14eeca8cf6cce019bb02962e05c491d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.195/workmux-linux-arm64.tar.gz"
      sha256 "dab3a9128126fbcc55b1972e3ea158b7c970aae49aaa902c3ea0446d1b6a6bc4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.195/workmux-linux-amd64.tar.gz"
      sha256 "e8768ce259384dd0e1d12c643f1588e170ebbb35da4b8cc6b6cf560bdd8f910a"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
