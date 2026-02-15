class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.115"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.115/workmux-darwin-arm64.tar.gz"
      sha256 "479b742956dccf161f5a0cd87a577cee5583c4909495e197e7630cc16c690f75"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.115/workmux-darwin-amd64.tar.gz"
      sha256 "ef3dc948149ab3309e68f62bb58443b2d9e3b22dd4c2bdb2e490f2fb8a46f2ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.115/workmux-linux-arm64.tar.gz"
      sha256 "86ad53ddb18407a88b947977cb084b287daea6eec06557b02c7328ef781dec81"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.115/workmux-linux-amd64.tar.gz"
      sha256 "c4cf26ae06913993943362a44a601a3a31f0bbf4f87889c43922fe82e7859703"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
