class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.120"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.120/workmux-darwin-arm64.tar.gz"
      sha256 "ec58f483a42e29f44a52a9acd863dbab8c196ad9699d70a9c94dc03c659939e7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.120/workmux-darwin-amd64.tar.gz"
      sha256 "fa3fe70b2dd025220d340ae70b317d8dc8617eeb701e474df397e315145ad07f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.120/workmux-linux-arm64.tar.gz"
      sha256 "5d9428078b07bc60db163e64c1c0be7aadcf754cb1a0ccc015e610aa9694a63c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.120/workmux-linux-amd64.tar.gz"
      sha256 "1a7be355baf1f3adc46b822abe63c2f37e34fbea16108add8c13cc785f24c427"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
