class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.205"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.205/workmux-darwin-arm64.tar.gz"
      sha256 "a46c7bfa96214b40c765b1f5f93a2b6ff95553dfa12eb6811d09fb50ecad7595"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.205/workmux-darwin-amd64.tar.gz"
      sha256 "c09b84ddf4df64e5e1e9c58bb98a123c29f4ba99a84f419fca3934bcc0ac11ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.205/workmux-linux-arm64.tar.gz"
      sha256 "df2eb79404ab8c74f5cc368e1277c3445eeeb499f2940e27606a28e727769266"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.205/workmux-linux-amd64.tar.gz"
      sha256 "c91e790e0b9ef4382adb8b70e6085ce1b909a357ccc328e7d90bf04629e8dbcb"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
