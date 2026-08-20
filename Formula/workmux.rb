class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.242"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.242/workmux-darwin-arm64.tar.gz"
      sha256 "dea274b19ed4d6dc240b1add23d3a3ac6eebc5aa65d10d62adb346f6bcdd0a38"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.242/workmux-darwin-amd64.tar.gz"
      sha256 "f1ad91a991a34eec0ca9c56f2c5b9cd9edef8d04ebcb37172a373a327dd0a702"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.242/workmux-linux-arm64.tar.gz"
      sha256 "6f8b43d592df48e8d3b4673cf16eaf43d3892ea2c69a40b783d040a844df2432"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.242/workmux-linux-amd64.tar.gz"
      sha256 "5bb8c9665fcf82d6400098fe5bc312c9e368c739fc63647b9352fee03cc76888"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
