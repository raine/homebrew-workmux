class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.93"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.93/workmux-darwin-arm64.tar.gz"
      sha256 "21357b697f596662407f4c9bcd683ceab9455b2dab4b0556c52fe8d9126facdc"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.93/workmux-darwin-amd64.tar.gz"
      sha256 "4052f6bd7128abe5fb889d4eaa2341a156fa6d30550490518399950191f02c44"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.93/workmux-linux-arm64.tar.gz"
      sha256 "859bc220e77af0420727e789325a07929ac36a9b6ab2f75b889fd264a487688c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.93/workmux-linux-amd64.tar.gz"
      sha256 "fff1eefe1b5dc31c1a454c108c9b72b15d940cfa3716d4a03386b5686d28bd36"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
