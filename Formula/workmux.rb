class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.199"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.199/workmux-darwin-arm64.tar.gz"
      sha256 "882a07024896c0f6eb23717bc1624c25f006ffa5e346c1a95fdc1b2b31134f93"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.199/workmux-darwin-amd64.tar.gz"
      sha256 "ee6026bab209cc69910bf5149a7dcdfb825c687dc041a6330735674ca93618fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.199/workmux-linux-arm64.tar.gz"
      sha256 "dca449e9abc3656907718703dfc3e72511065e3538d1f788279466c2e879c822"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.199/workmux-linux-amd64.tar.gz"
      sha256 "c66aae2c372f69a27c83a979c1057027e07bed75e389d024f775df1f6268e509"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
