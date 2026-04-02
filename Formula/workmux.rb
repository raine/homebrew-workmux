class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.171"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.171/workmux-darwin-arm64.tar.gz"
      sha256 "7deabbb1bfa2bcb8584160a9736e8ba18165127ea428a07ed0c38a5bb2f9ca8d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.171/workmux-darwin-amd64.tar.gz"
      sha256 "c99472bec73f745a4e577c7cdb2da18bf0e2ef1e4f116291a63a7a1828bcf884"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.171/workmux-linux-arm64.tar.gz"
      sha256 "81ae89eb31b5352cd1ac1d8af8c4019edc4158c2de0b4b99db931ca6ba5653aa"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.171/workmux-linux-amd64.tar.gz"
      sha256 "b3cfe807f638682f47914935256a81fb53758070518b1e6e133ab1f55bc64dbc"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
