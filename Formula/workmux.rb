class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.106"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.106/workmux-darwin-arm64.tar.gz"
      sha256 "314049fbf4b08110379c00a735cff3caf307181f814fdfd5a18af0d61595bd28"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.106/workmux-darwin-amd64.tar.gz"
      sha256 "26804cb12ad700cc4aa0f5736024449a70856f13701ec5c0d51d770b2fae277c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.106/workmux-linux-arm64.tar.gz"
      sha256 "0b86addac4a483a47971b6406111c14259efbe4b4e09557cc6b7568e49bb4dae"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.106/workmux-linux-amd64.tar.gz"
      sha256 "de533d1ef776d185b37df2ac879312b504f4b6afed50006fc1beea2aef0a4ac1"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
