class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.147"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.147/workmux-darwin-arm64.tar.gz"
      sha256 "5bacb170974cb1cc61ccbc3229d4dd15cf3e4af28816313b33b383e42bd1ec2c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.147/workmux-darwin-amd64.tar.gz"
      sha256 "227c6a2b8a5f09e438fc085a954649770e9a2209ab68cb2e6b9d4a216ff1cda8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.147/workmux-linux-arm64.tar.gz"
      sha256 "0e6f03649093621231d6f2278774f89f1e1c4b8af4ecee6ef943f8dfc86e967f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.147/workmux-linux-amd64.tar.gz"
      sha256 "f8024ba4249d3ddf6f980661f7280cb441b39fc31fb65d1818de704d2cedb01b"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
